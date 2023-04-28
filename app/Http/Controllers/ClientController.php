<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;
use App\Models\User;
use App\Models\Designation;
use App\Models\Status;
use Spatie\Permission\Models\Role as SpatieRole;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\PostClient;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Validation\Rule;

class ClientController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function clients()
    {
        $data['menu'] = "client-management";
        $data['sub_menu'] = "clients";
        // if (auth()->user()->hasRole('dev')) {
        //     $clients = User::where('company_id', '!=', 0)->where('type', 3)->orderBy('id', 'DESC')->get();
        // } else {
        //     $clients = User::where('company_id', '!=', 0)
        //         ->where('company_id', Auth::user()->company->id)
        //         ->where('type', 3)
        //         ->orderBy('firstname', 'ASC')->get();
        // }
        // foreach ($clients as $client) {
        //     $client->roles = $client->roles()->pluck('display_name');
        //     $client->departments = $client->assigned_departments()->pluck('name');
        //     $roles = "";
        //     $departments = "";
        //     foreach ($client->roles as $role) {
        //         $roles .= "<span class='role'>$role</span>";
        //     }
        //     foreach ($client->departments as $department) {
        //         $departments .= "<span class='role'>$department</span>";
        //     }
        //     $client->roles = $roles;
        //     $client->departments = $departments;
        // }
        return view('user_management.clients', compact('data'));
    }
    public function add_client()
    {
        $data['menu'] = "client-management";
        $data['sub_menu'] = "clients";
        if (auth()->user()->hasRole('dev'))
            $roles = SpatieRole::pluck('name', 'name')->all();
        else
            $roles = SpatieRole::where('company_id', Auth::user()->company->id)->pluck('display_name', 'name')->all();
        $userRole = [];
        if (auth()->user()->can('assign team user'))
            $teams = Team::where('company_id', Auth::user()->company->id)->orderBy('name', 'ASC')->get();
        else
            $teams = Auth::user()->assigned_teams();
        $assigned_teams = [];

        return view('user_management.add_client', compact('data', 'roles', 'userRole', 'teams', 'assigned_teams'));
    }
    public function edit_client($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "client-management";
        $data['sub_menu'] = "clients";
        $user = User::findorfail($id);
        if (auth()->user()->hasRole('dev'))
            $roles = SpatieRole::pluck('name', 'name')->all();
        else
            $roles = SpatieRole::where('company_id', Auth::user()->company->id)->pluck('display_name', 'name')->all();
        $userRole = $user->roles->pluck('name', 'name')->all();
        if (auth()->user()->can('assign team user'))
            $teams = Team::where('company_id', Auth::user()->company->id)->orderBy('name', 'ASC')->get();
        else
            $teams = Auth::user()->assigned_teams();
        $assigned_teams = $user->assigned_teams_array();
        return view('user_management.add_client', compact('data', 'user', 'roles', 'userRole', 'teams', 'assigned_teams'));
    }
    public function post_client(PostClient $req)
    {
        DB::beginTransaction();
        if (auth()->user()->hasRole('dev')) {
            $company_id = $req->company;
        } else {
            $company_id = Auth::user()->company->id;
        }
        $this->validate($req, [
            'firstname' => ['required', 'string'],
            'lastname' => ['required', 'string'],
            'email' => ['required', 'string', 'email', 'max:255', Rule::unique('users')->where(function ($query) use ($company_id) {
                return $query->where('company_id', $company_id);
            })],
            'username' => ['required', 'string', 'max:255', Rule::unique('users')->where(function ($query) use ($company_id) {
                return $query->where('company_id', $company_id);
            })],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
        $user = new User;
        $user->firstname = $req->firstname;
        $user->lastname = $req->lastname;
        $user->email = $req->email;
        $user->username = $req->username;
        $user->company_id = $company_id;
        $user->password = Hash::make($req->password);
        $user->type = 3;
        $user->timezone = $req->timezone;
        $user->status = $req->status;
        $user->save();
        $user->assignRole($req->input('roles'));
        $user->teams()->sync([$req->team], TRUE);
        DB::commit();
        return redirect()->route('clients')->with('success', "Client Created Successfully");
    }
    public function update_client(Request $req, $id = '')
    {
        if ($id) {
            $id = $this->clean_id($id);
        }
        DB::beginTransaction();
        if (auth()->user()->hasRole('dev')) {
            $company_id = $req->company;
        } else {
            $company_id = Auth::user()->company->id;
        }
        $this->validate($req, [
            'firstname' => ['required', 'string'],
            'lastname' => ['required', 'string'],
            'email' => ['required', 'string', 'email', 'max:255', Rule::unique('users')->where(function ($query) use ($id, $company_id) {
                return $query->where('company_id', $company_id)->where('id', '!=', $id);
            })],
            'username' => ['required', 'string', 'max:255', Rule::unique('users')->where(function ($query) use ($id, $company_id) {
                return $query->where('company_id', $company_id)->where('id', '!=', $id);
            })]
        ]);
        $user = User::findorfail($id);
        $user->firstname = $req->firstname;
        $user->lastname = $req->lastname;
        $user->email = $req->email;
        $user->username = $req->username;
        $user->company_id = $company_id;
        $user->timezone = $req->timezone;
        $user->status = $req->status;
        $user->assignRole($req->input('roles'));
        $user->teams()->sync([$req->team], TRUE);
        $user->save();
        DB::commit();
        return redirect()->route('clients')->with('success', "User Updated Successfully");
    }
    public function all_clients(Request $request)
    {
        $columns = ['firstname', 'lastname', 'psudo_name', 'email', 'username', 'employee_id', 'designation_id', 'status'];
        $date_range = [
            "date_from" => $request->input('date_from_filter') != "" ? date("Y-m-d", strtotime($request->input('date_from_filter'))) . ' 00:00:00' : $request->input('date_from_filter'),
            "date_to" => $request->input('date_to_filter') != "" ? date("Y-m-d", strtotime($request->input('date_to_filter'))) . ' 23:59:59' : date("Y-m-d H:i:s")
        ];
        $filter = array(
            "company_id" => $request->input('company_filter'),
            "department_id" => $request->input('department_filter'),
            "designation_id" => $request->input('designation_filter'),
            "role_id" => $request->input('role_filter'),
            "status" => $request->input('status_filter')
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = !empty($request->input('order.0.column')) ? $request->input('order.0.column') : 0;
        $order = $columns[$order];
        $dir = !empty($request->input('order.0.dir')) ? strtoupper($request->input('order.0.dir')) : "DESC";
        $search = $request->input('search.value');
        $user = new User();
        $totalData = $user->countTotal(3);
        $totalFiltered = $user->countFiltered(3, $date_range, $filter, $search);
        $users = $user->getData(3, $date_range, $filter, $search, $start, $limit, $order, $dir);
        $data = array();
        if (!empty($users)) {
            foreach ($users as $user) {
                $roles = "";
                $departments = "";
                $user->roles = $user->roles()->pluck('display_name');
                $user->departments = $user->assigned_departments()->pluck('name');
                foreach ($user->roles as $role) {
                    $roles .= "<span class='role'>$role</span>";
                }
                foreach ($user->departments as $department) {
                    $departments .= "<span class='role'>$department</span>";
                }
                $edit = '';
                $assign_department = '';
                $assign_practice = '';
                if (auth()->user()->can('update user'))
                    $edit = '<a class="dropdown-item" href="' . route('edit_client', ['id' => Crypt::encrypt($user->id)]) . '">Edit</a>';
                if (auth()->user()->can('assign department user'))
                    $assign_department = '<a class="dropdown-item assign-department" ref="' . Crypt::encrypt($user->id) . '" href="javascript:;">Assign Department</a>';
                if (auth()->user()->can('assign practice user'))
                    $assign_practice = '<a class="dropdown-item assign-practice" ref="' . Crypt::encrypt($user->id) . '" href="javascript:;">Assign Practice</a>';

                $nestedData['first_name'] = $user->firstname;
                $nestedData['last_name'] = $user->lastname;
                $nestedData['psudo_name'] = $user->psudo_name;
                $nestedData['email'] = $user->email;
                $nestedData['username'] = $user->username;
                $nestedData['employee_id'] = $user->employee_id;
                $nestedData['designation_id'] = get_designation($user->designation_id);
                $nestedData['status'] = Status::findorfail($user->status)->name;
                $nestedData['roles'] = $roles;
                $nestedData['departments'] = $departments;
                $nestedData['company_name'] = $user->company->name;
                $nestedData['action'] = '<button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="text-muted sr-only">Action</span></button><div class="dropdown-menu dropdown-menu-right">' . $edit . $assign_department  . $assign_practice . '</div>';
                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw" => intval($request->input('draw')),
            "recordsTotal" => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data" => $data
        );
        echo json_encode($json_data);
    }
}
