<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddCompany;
use App\Models\Company;
use App\Models\User;
use Spatie\Permission\Models\Role as SpatieRole;
use Spatie\Permission\Models\Permission;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Exceptions\RoleDoesNotExist;

class CompanyController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function superadmins()
    {
        $data = array();
        $data['menu'] = "dev-tools";
        $data['sub_menu'] = "superadmins";
        try {
            $superadmins = User::whereHas('roles', function ($query) {
                $query->where('display_name', 'superadmin');
            })->get();
        } catch (RoleDoesNotExist $e) {
            $superadmins = [];
        }
        return view('dev.superadmins', compact('data', 'superadmins'));
    }
    public function companies()
    {
        $data = array();
        $data['menu'] = "dev-tools";
        $data['sub_menu'] = "companies";
        $companies = Company::orderBy('id', 'DESC')->get();
        return view('dev.companies', compact('data', 'companies'));
    }
    public function add_company()
    {
        $data = array();
        $data['menu'] = "dev-tools";
        $data['sub_menu'] = "companies";
        return view('dev.add_company', compact('data'));
    }
    public function edit_company($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "dev-tools";
        $data['sub_menu'] = "companies";
        $company = Company::findorfail($id);
        return view('dev.add_company', compact('data', 'company'));
    }
    public function post_company(AddCompany $req)
    {
        DB::beginTransaction();
        try {
            $company = new Company();
            $company->name = $req->name;
            $company->prefix = $req->prefix;
            $company->save();
            $role_array['display_name'] = 'superadmin';
            $role_array['name'] = $company->prefix . "-superadmin";
            $role_array['company_id'] = $company->id;
            $role = SpatieRole::create($role_array);
            $permissions = Permission::all();
            $role->syncPermissions($permissions);
            $user = new User;
            $user->company_id = $company->id;
            $user->firstname = "Super";
            $user->lastname = "Admin";
            $user->email = "superadmin" . $company->id . "@" . $company->prefix . ".com";
            $user->username = "superadmin" . $company->id;
            $user->timezone = 0;
            $user->password = Hash::make('superadmin@' . $company->prefix);
            $user->save();
            $user->assignRole($role);
            DB::commit();
            return redirect()->route('companies')->with('success', "Company Created Successfully");
        } catch (\Exception $e) {
            DB::rollback();
            return back()->withInput()->with('error', $e->getMessage());
        }
    }
    public function update_company(AddCompany $req, $id = '')
    {
        if ($id) {
            $id = $this->clean_id($id);
        }
        try {
            $company = Company::findorfail($id);
            $company->name = $req->name;
            $company->prefix = $req->prefix;
            $company->save();
            return redirect()->route('companies')->with('success', "Company Updated Successfully");
        } catch (\Exception $e) {
            return back()->withInput()->with('error', $e->getMessage());
        }
    }
}
