<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Department;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class DepartmentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
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
        if (auth()->user()->hasRole('dev'))
            $departments = Department::where('parent_id', 0)->orderBy('id', 'DESC')->get();
        else
            $departments = Department::where('company_id', Auth::user()->company->id)->where('parent_id', 0)->orderBy('id', 'DESC')->get();
        return view('department_management.add_department', compact('data', 'departments'));
    }
    public function edit_department($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "general-management";
        $data['sub_menu'] = "departments";
        $department = Department::findorfail($id);
        if (auth()->user()->hasRole('dev'))
            $departments = Department::where('parent_id', 0)->orderBy('id', 'DESC')->get();
        else
            $departments = Department::where('company_id', Auth::user()->company->id)->where('parent_id', 0)->orderBy('id', 'DESC')->get();
        return view('department_management.add_department', compact('data', 'department', 'departments'));
    }
    public function post_department(Request $req)
    {
        $role_array = array();
        $department = new Department;
        $department->name = $req->name;
        $department->parent_id = $req->parent_department;
        if (auth()->user()->hasRole('dev'))
            $company_id = $req->company;
        else
            $company_id = Auth::user()->company->id;
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
            if (auth()->user()->hasRole('dev'))
                $company_id = $req->company;
            else
                $company_id = Auth::user()->company->id;
            $department = Department::findorfail($id);
            $department->name = $req->name;
            $department->company_id = $company_id;
            $department->parent_id = $req->parent_department;
            $department->save();
            DB::commit();
            return redirect()->route('departments')->with('success', "Department Updated Successfully");
        } catch (\Exception $e) {
            return back()->withInput()->with('error', $e->getMessage());
        }
    }
    public function get_departments(Request $req)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($req->ref);
            $user = User::find($user_id);
            if (auth()->user()->can('assign department user')) {
                $department = Department::where('company_id', $user->company_id)->orderBy('name', 'ASC')->get();
            } else {
                $department = Auth::user()->assigned_departments();
            }
            $assigned_department = $user->assigned_departments_array();
            $response['success'] = 1;
            $select = $this->multiselect($department, $assigned_department, 'user_departments[]', 'User Departments');
            $response['content'] = $select;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
}
