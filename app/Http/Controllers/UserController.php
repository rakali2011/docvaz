<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;
use App\Models\User;
use App\Models\Designation;
use App\Models\Status;
use Spatie\Permission\Models\Role as SpatieRole;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\PostUser;
use App\Http\Requests\PostClient;

use Illuminate\Support\Facades\DB;
use Exception;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function users()
    {
        $data['menu'] = "user-management";
        $data['sub_menu'] = "users";
        // if (auth()->user()->hasRole('dev')) {
        //     $users = User::where('company_id', '!=', 0)->where('type', 2)->orderBy('id', 'DESC')->get();
        // } else {
        //     $users = get_users();
        // }
        // foreach ($users as $user) {
        //     $user->roles = $user->roles()->pluck('display_name');
        //     $user->departments = $user->assigned_departments()->pluck('name');
        //     $roles = "";
        //     $departments = "";
        //     foreach ($user->roles as $role) {
        //         $roles .= "<span class='role'>$role</span>";
        //     }
        //     foreach ($user->departments as $department) {
        //         $departments .= "<span class='role'>$department</span>";
        //     }
        //     $user->roles = $roles;
        //     $user->departments = $departments;
        // }
        return view('user_management.users', compact('data'));
    }

    public function add_user()
    {
        $data['menu'] = "user-management";
        $data['sub_menu'] = "users";
        if (auth()->user()->hasRole('dev'))
            $roles = SpatieRole::pluck('name', 'name')->all();
        else
            $roles = SpatieRole::where('company_id', Auth::user()->company->id)->pluck('display_name', 'name')->all();
        $userRole = [];
        // if (auth()->user()->can('assign team user'))
        //     $teams = Team::where('company_id', Auth::user()->company->id)->orderBy('name', 'ASC')->get();
        // else
        //     $teams = Auth::user()->assigned_teams();
        // $assigned_teams = [];
        return view('user_management.add_user', compact('data', 'roles', 'userRole'));
    }
    public function edit_user($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "user-management";
        $data['sub_menu'] = "users";
        $user = User::findorfail($id);
        if (auth()->user()->hasRole('dev'))
            $roles = SpatieRole::pluck('name', 'name')->all();
        else
            $roles = SpatieRole::where('company_id', Auth::user()->company->id)->pluck('display_name', 'name')->all();
        $userRole = $user->roles->pluck('name', 'name')->all();
        // if (auth()->user()->can('assign team user'))
        //     $teams = Team::where('company_id', Auth::user()->company->id)->orderBy('name', 'ASC')->get();
        // else
        //     $teams = Auth::user()->assigned_teams();
        // $assigned_teams = $user->assigned_teams_array();
        return view('user_management.add_user', compact('data', 'user', 'roles', 'userRole'));
    }
    public function post_user(PostUser $req)
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
            'psudo_name' => ['required', 'string'],
            'employee_id' => ['required', 'unique:users'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'username' => ['required', 'string', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
        $user = new User;
        $user->company_id = $company_id;
        $user->firstname = $req->firstname;
        $user->lastname = $req->lastname;
        $user->psudo_name = $req->psudo_name;
        $user->employee_id = $req->employee_id;
        $user->email = $req->email;
        $user->username = $req->username;
        $user->password = Hash::make($req->password);
        $user->type = 2;
        $user->timezone = $req->timezone;
        $user->status = $req->status;
        $user->designation_id = $req->designation;
        $user->save();
        $user->assignRole($req->input('roles'));
        // $user->teams()->sync($req->teams, TRUE);
        DB::commit();
        return redirect()->route('users')->with('success', "User Created Successfully");
    }
    public function update_user(PostUser $req, $id = '')
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
            'psudo_name' => ['required', 'string'],
            'employee_id' => ['required', Rule::unique('users')->where(function ($query) use ($id, $company_id) {
                return $query->where('id', '!=', $id);
            })],
            'email' => ['required', 'string', 'email', 'max:255', Rule::unique('users')->where(function ($query) use ($id, $company_id) {
                return $query->where('id', '!=', $id);
            })],
            'username' => ['required', 'string', 'max:255', Rule::unique('users')->where(function ($query) use ($id, $company_id) {
                return $query->where('id', '!=', $id);
            })]
        ]);
        $user = User::findorfail($id);
        $user->company_id = $company_id;
        $user->firstname = $req->firstname;
        $user->lastname = $req->lastname;
        $user->psudo_name = $req->psudo_name;
        $user->employee_id = $req->employee_id;
        $user->email = $req->email;
        $user->username = $req->username;
        $user->timezone = $req->timezone;
        $user->status = $req->status;
        $user->designation_id = $req->designation;
        $user->save();
        DB::table('model_has_roles')->where('model_id', $id)->delete();
        $user->assignRole($req->input('roles'));
        // $user->teams()->sync($req->teams, TRUE);
        DB::commit();
        return redirect()->route('users')->with('success', "User Updated Successfully");
    }
    public function get_users(Request $req)
    {
        $response = array();
        try {
            $team_id = $this->clean_id($req->ref);
            $team = Team::find($team_id);
            $users = User::select('id', DB::raw("CONCAT(users.firstname,' ',users.lastname) as name"))->where('company_id', $team->company_id)->where('type', 2)->orderBy('firstname', 'ASC')->get();
            $assigned_users = $team->assigned_users_array();
            $response['success'] = 1;
            $select = $this->multiselect($users, $assigned_users, 'team_users[]', 'User teams');
            $response['content'] = $select;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
    public function profile()
    {
        $user = Auth::user();
        $data = array();
        $data['menu'] = "user-management";
        $data['sub_menu'] = "users";
        return view('user_management.profile', compact('data', 'user'));
    }
    public function update_profile(Request $request)
    {
        $user_id = Auth::user()->id;
        $this->validate($request, [
            'lastname' => 'required',
            'lastname' => 'required',
        ]);
        $user = User::findorfail($user_id);
        $user->firstname = $request->firstname;
        $user->lastname = $request->lastname;
        $user->save();
        return redirect()->route('profile')->with('success', "Profile Updated Successfully");
    }
    public function change_password()
    {
        $data['menu'] = "user-management";
        $data['sub_menu'] = "users";
        return view('user_management.change_password', compact('data'));
    }
    public function update_password(Request $request)
    {
        $request->validate([
            'current_password' => ['required', new MatchOldPassword],
            'new_password' => ['required', 'string', 'min:6', 'different:current_password'],
            'new_confirm_password' => ['required_with:new_password', 'string', 'same:new_password', 'min:6'],
        ]);
        User::find(auth()->user()->id)->update(['password' => Hash::make($request->new_password)]);
        return redirect()->route('change_password')->with('success', "Password Change Successfully");
    }
    public function update_user_departments(Request $request)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($request->ref);
            $departments = $request->user_departments;
            $user = User::findorfail($user_id);
            foreach ($departments as $key => $value) {
                $departments[$key] = $this->clean_id($value);
            }
            $user->departments()->sync($departments, TRUE);
            $response['success'] = 1;
            $response['message'] = "Updated Successfully";
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
    public function update_user_document_types(Request $request)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($request->ref);
            $document_types = $request->user_document_types;
            $user = User::findorfail($user_id);
            foreach ($document_types as $key => $value) {
                $document_types[$key] = $this->clean_id($value);
            }
            $user->document_types()->sync($document_types, TRUE);
            $response['success'] = 1;
            $response['message'] = "Updated Successfully";
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
    public function update_user_practices(Request $request)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($request->ref);
            $practices = $request->user_practices;
            $user = User::findorfail($user_id);
            $practices_data = [];
            foreach ($practices as $key => $value) {
                $practices_data[$key]["practice_id"] = $this->clean_id($value);
                $practices_data[$key]["type"] = 1;
                $practices_data[$key]["user_type"] = 1;
            }
            $user->practices()->sync($practices_data, TRUE);
            $response['success'] = 1;
            $response['message'] = "Updated Successfully";
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
    public function update_user_teams(Request $request)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($request->ref);
            $teams = is_array($request->user_teams) ? $request->user_teams : explode(",", $request->user_teams);
            $user = User::findorfail($user_id);
            foreach ($teams as $key => $value) {
                $teams[$key] = $this->clean_id($value);
            }
            $user->teams()->sync($teams, TRUE);
            $response['success'] = 1;
            $response['message'] = "Updated Successfully";
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
    public function all_users(Request $request)
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
        $totalData = $user->countTotal(2);
        $totalFiltered = $user->countFiltered(2, $date_range, $filter, $search);
        $users = $user->getData(2, $date_range, $filter, $search, $start, $limit, $order, $dir);
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
                $assign_document = '';
                $assign_practice = '';
                if (auth()->user()->can('update user'))
                    $edit = '<a class="dropdown-item" href="' . route('edit_user', ['id' => Crypt::encrypt($user->id)]) . '">Edit</a>';
                if (auth()->user()->can('assign department user') && !auth()->user()->hasRole('dev'))
                    $assign_department = '<a class="dropdown-item assign-department" ref="' . Crypt::encrypt($user->id) . '" href="javascript:;">Assign Department</a>';
                if (auth()->user()->can('assign document user') && !auth()->user()->hasRole('dev'))
                    $assign_document = '<a class="dropdown-item assign-document" ref="' . Crypt::encrypt($user->id) . '" href="javascript:;">Allow Document Types</a>';
                if (auth()->user()->can('assign practice user') && !auth()->user()->hasRole('dev'))
                    $assign_practice = '<a class="dropdown-item assign-practice" ref="' . Crypt::encrypt($user->id) . '" href="javascript:;">Assign Practice</a>';
                $nestedData['first_name'] = $user->firstname;
                $nestedData['last_name'] = $user->lastname;
                $nestedData['psudo_name'] = $user->psudo_name;
                $nestedData['email'] = $user->email;
                $nestedData['username'] = $user->username;
                $nestedData['employee_id'] = $user->employee_id;
                $nestedData['designation_id'] = !empty($user->designation_id) ? Designation::findorfail($user->designation_id)->name : "";
                $nestedData['status'] = !empty($user->status) ? Status::findorfail($user->status)->name : "";
                $nestedData['roles'] = $roles;
                $nestedData['departments'] = $departments;
                $nestedData['company_name'] = $user->company->name;
                $nestedData['action'] = '<button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="text-muted sr-only">Action</span></button><div class="dropdown-menu dropdown-menu-right">' . $edit . $assign_department . $assign_document . $assign_practice . '</div>';
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
