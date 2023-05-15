<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\AddCompany;
use App\Models\Company;
use App\Models\User;
use Spatie\Permission\Models\Role as SpatieRole;
use Spatie\Permission\Models\Permission;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Exceptions\RoleDoesNotExist;
use Illuminate\Validation\Rule;

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
    public function post_company(Request $req)
    {
        $this->validate($req, [
            'name' => ['required', 'string', 'max:30', 'unique:companies'],
            'prefix' => ['required', 'string', 'max:10', 'unique:companies']
        ]);
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
        return redirect()->route('companies')->with('success', "Company Created Successfully");
    }
    public function update_company(Request $req, $id = '')
    {
        if ($id)
            $id = $this->clean_id($id);
        $this->validate($req, [
            'name' => ['required', 'string', 'max:30', Rule::unique('companies')->where(function ($query) use ($id) {
                return $query->where('id', '!=', $id);
            })],
            'prefix' => ['required', 'string', 'max:10', Rule::unique('companies')->where(function ($query) use ($id) {
                return $query->where('id', '!=', $id);
            })]
        ]);
        $company = Company::findorfail($id);
        $company->name = $req->name;
        $company->prefix = $req->prefix;
        $company->save();
        return redirect()->route('companies')->with('success', "Company Updated Successfully");
    }
}
