<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Models\Role as SpatieRole;
use Spatie\Permission\Models\Permission;
use App\Models\Company;
use App\Models\UserDepartment;
use Illuminate\Support\Facades\Hash;
use App\Models\Role;
use App\Models\Team;
use App\Models\Department;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;

class SuperAdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    // roles
    public function roles()
    {
        $data = array();
        $data['menu'] = "role-management";
        $data['sub_menu'] = "roles";
        if (auth()->user()->hasRole('dev')) {
            $roles = Role::where('company_id', '!=', 0)->orderBy('id', 'DESC')->get();
        } else {
            $roles = Role::where('company_id', '!=', 0)->where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        }

        return view('role_management.roles', compact('data', 'roles'));
    }
    public function add_role()
    {
        $data['menu'] = 'role-management';
        $data['sub_menu'] = 'roles';
        $permissions = Permission::all();
        return view('role_management.add_role', compact('data', 'permissions'));
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

    // end role

    // teams
    public function teams()
    {
        $data = array();
        $data['menu'] = "general-management";
        $data['sub_menu'] = "teams";
        if (auth()->user()->hasRole('dev')) {
            $teams = Team::orderBy('id', 'DESC')->get();
        } else {
            $teams = Team::where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        }

        return view('team_management.teams', compact('data', 'teams'));
    }
    public function add_team()
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "teams";
        return view('team_management.add_team', compact('data'));
    }
    public function edit_team($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "general-management";
        $data['sub_menu'] = "teams";
        $team = Team::findorfail($id);
        return view('team_management.add_team', compact('data', 'team'));
    }
    public function post_team(Request $req)
    {
        $role_array = array();
        $team = new Team;
        $team->name = $req->name;
        if (auth()->user()->hasRole('dev')) {
            $company_id = $req->company;
        } else {
            $company_id = Auth::user()->company->id;
        }
        $team->company_id = $company_id;
        $team->save();
        return redirect()->route('teams')->with('success', "Team Created Successfully");
    }
    public function update_team(Request $req, $id = '')
    {
        if ($id) {
            $id = $this->clean_id($id);
        }
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
            } else {
                $company_id = Auth::user()->company->id;
            }
            $team = Team::findorfail($id);
            $team->name = $req->name;
            $team->company_id = $company_id;
            $team->save();
            DB::commit();
            return redirect()->route('teams')->with('success', "Team Updated Successfully");
        } catch (\Exception $e) {
            return back()->withInput()->with('error', $e->getMessage());
        }
    }

    // end teams
    // departments
    public function departments()
    {
        $data = array();
        $data['menu'] = "general-management";
        $data['sub_menu'] = "departments";
        if (auth()->user()->hasRole('dev')) {
            $departments = Department::orderBy('id', 'DESC')->get();
        } else {
            $departments = Department::where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        }

        return view('department_management.departments', compact('data', 'departments'));
    }
    public function add_department()
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "departments";
        return view('department_management.add_department', compact('data'));
    }
    public function edit_department($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "general-management";
        $data['sub_menu'] = "departments";
        $department = Department::findorfail($id);
        return view('department_management.add_department', compact('data', 'department'));
    }
    public function post_department(Request $req)
    {
        $role_array = array();
        $department = new Department;
        $department->name = $req->name;
        if (auth()->user()->hasRole('dev')) {
            $company_id = $req->company;
        } else {
            $company_id = Auth::user()->company->id;
        }
        $department->company_id = $company_id;
        $department->save();
        return redirect()->route('departments')->with('success', "Department Created Successfully");
    }
    public function update_department(Request $req, $id = '')
    {
        if ($id) {
            $id = $this->clean_id($id);
        }
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
            } else {
                $company_id = Auth::user()->company->id;
            }
            $department = Department::findorfail($id);
            $department->name = $req->name;
            $department->company_id = $company_id;
            $department->save();
            DB::commit();
            return redirect()->route('departments')->with('success', "Department Updated Successfully");
        } catch (\Exception $e) {
            return back()->withInput()->with('error', $e->getMessage());
        }
    }
    // end departments

    // assign departments

    public function get_departments(Request $req)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($req->ref);
            $user = User::find($user_id);
            if (auth()->user()->hasRole('dev') || auth()->user()->hasRole('super admin') || auth()->user()->hasRole('admin')) {
                $department = Department::where('parent_id', '!=', 0)->where('company_id', $user->company_id)->orderBy('name', 'ASC')->get();
            } else {
                $department = Auth::user()->assinged_departments();
            }
            $assigned_department = $user->assinged_departments_array();

            $response['success'] = 1;

            $select = $this->multiselect($department, $assigned_department, 'user_departments[]', 'User Departments');
            $response['content'] = $select;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            // $response['message'] = "Something Went Wrong Try Again";
            $response['message'] = $th->getMessage();
            //throw $th;
        }
        return response()->json($response);
    }
    public function update_user_departments(Request $req)
    {
        $response = array();
        DB::beginTransaction();
        try {
            $user_id = $this->clean_id($req->ref);
            $departments = $req->user_departments;
            // dd($departments);
            $clean_ids = array();
            if ($departments) {
                foreach ($departments as $key => $value) {
                    $d_id = $this->clean_id($value);
                    array_push($clean_ids, $d_id);
                    $check_exist = UserDepartment::where('user_id', $user_id)
                        ->where('department_id', $d_id)->first();
                    if (!$check_exist) {
                        $user_department = new UserDepartment();
                        $user_department->user_id = $user_id;
                        $user_department->department_id = $d_id;
                        $user_department->save();
                    }
                }
            }


            $del_assignmennt = UserDepartment::whereNotIn('department_id', $clean_ids)->where('user_id', $user_id)->delete();
            DB::commit();
            $response['success'] = 1;
            $response['message'] = "Updated Successfully";
        } catch (\Throwable $th) {
            DB::rollback();
            $response['success'] = 0;
            // $response['message'] = "Something Went Wrong Try Again";
            $response['message'] = $th->getMessage();
        }

        return response()->json($response);
    }
}
