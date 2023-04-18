<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Models\Role as SpatieRole;
use Spatie\Permission\Models\Permission;
use App\Models\Company;
use App\Models\Role;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function roles()
    {
        $data = array();
        $data['menu'] = "role-management";
        $data['sub_menu'] = "roles";
        // if (auth()->user()->hasRole('dev')) {
        //     $roles = SpatieRole::join('companies', 'companies.id', '=', 'roles.company_id')->where('roles.company_id', '!=', 0)->orderBy('roles.id', 'DESC')->get(['roles.*', 'companies.name as company_name']);
        // } else {
        //     $roles = SpatieRole::where('company_id', '!=', 0)->where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        // }
        return view('role_management.roles', compact('data'));
    }
    public function add_role()
    {
        $data['menu'] = 'role-management';
        $data['sub_menu'] = 'roles';
        $permissions = Permission::all();
        $assign_permissions = [];
        return view('role_management.add_role', compact('data', 'permissions', 'assign_permissions'));
    }
    public function edit_role($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "role-management";
        $data['sub_menu'] = "roles";
        $role = SpatieRole::find($id);
        $role->name = $role->name;
        $permissions = Permission::orderBy('type', 'ASC')->orderBy('name', 'ASC')->get();
        $permissions_count = array_count_values(json_decode(json_encode($permissions->pluck("type")), true));
        $rolePermissions = $role->permissions()->get();
        $assign_permissions = json_decode(json_encode($rolePermissions->pluck("id")), true);
        $assign_permissions_count = array_count_values(json_decode(json_encode($rolePermissions->pluck("type")), true));
        $check_all = [];
        foreach ($permissions_count as $key => $value) {
            $check_all[$key] = $this->check_all($key, $permissions_count, $assign_permissions_count);
        }
        return view('role_management.add_role', compact('data', 'role', 'permissions', 'assign_permissions', 'check_all'));
    }
    public function post_role(Request $req)
    {
        $role_array = array();
        $role_array['display_name'] = $req->name;
        if (auth()->user()->hasRole('dev')) {
            $company_id = $req->company;
            $company = Company::findorfail($company_id);
            $role_array['name'] = $company->prefix . "-" . $req->name;
            $role_array['company_id'] = $company->id;
        } else {
            $role_array['name'] = Auth::user()->company->prefix . "-" . $req->name;
            $role_array['company_id'] = Auth::user()->company->id;
        }
        $role = SpatieRole::create($role_array);
        $role->syncPermissions($req->input('permission'));
        return redirect()->route('roles')->with('success', "Role Created Successfully");
    }
    public function update_role(Request $req, $id = '')
    {
        if ($id) {
            $id = $this->clean_id($id);
        }
        DB::beginTransaction();
        try {
            $role = SpatieRole::find($id);
            $role->display_name = $req->name;
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
                $company = Company::findorfail($company_id);
                $role->name = $company->prefix . "-" . $req->name;
                $role->company_id = $company->id;
            } else {
                $role->name = Auth::user()->company->prefix . "-" . $req->name;
                $role->company_id = Auth::user()->company->id;
            }
            $role->save();
            $role->syncPermissions($req->input('permission'));
            DB::commit();
            return redirect()->route('roles')->with('success', "Role Updated Successfully");
        } catch (\Exception $e) {
            return back()->withInput()->with('error', $e->getMessage());
        }
    }
    public function check_all($key, $permissions_count, $assign_permissions_count)
    {
        if (!key_exists($key, $assign_permissions_count))
            return '';
        if ($permissions_count[$key] === $assign_permissions_count[$key])
            return 'checked="checked"';
        return '';
    }
    public function all_roles(Request $request)
    {
        $columns = ['display_name'];
        $date_range = [
            "date_from" => $request->input('date_from_filter') != "" ? date("Y-m-d", strtotime($request->input('date_from_filter'))) . ' 00:00:00' : $request->input('date_from_filter'),
            "date_to" => $request->input('date_to_filter') != "" ? date("Y-m-d", strtotime($request->input('date_to_filter'))) . ' 23:59:59' : date("Y-m-d H:i:s")
        ];
        $filter = array(
            "company_id" => $request->input('company_filter')
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = !empty($request->input('order.0.column')) ? $request->input('order.0.column') : 0;
        $order = $columns[$order];
        $dir = !empty($request->input('order.0.dir')) ? strtoupper($request->input('order.0.dir')) : "DESC";
        $search = $request->input('search.value');
        $role = new Role();
        $totalData = $role->countTotal();
        $totalFiltered = $role->countFiltered($date_range, $filter, $search);
        $roles = $role->getData($date_range, $filter, $search, $start, $limit, $order, $dir);
        $data = array();
        if (!empty($roles)) {
            foreach ($roles as $role) {
                $edit = '';
                if (auth()->user()->can('update role') || auth()->user()->hasRole('dev'))
                    $edit = '<a class="dropdown-item" href="' . route('edit_role', ['id' => Crypt::encrypt($role->id)]) . '">Edit</a>';
                $nestedData['name'] = $role->display_name;
                $nestedData['company_name'] = Company::findorfail($role->company_id)->name;
                $nestedData['action'] = '<button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="text-muted sr-only">Action</span></button><div class="dropdown-menu dropdown-menu-right">' . $edit . '</div>';
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
