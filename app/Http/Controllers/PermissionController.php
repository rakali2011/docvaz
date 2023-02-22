<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role as SpatieRole;
use Spatie\Permission\Models\Permission;
use Exception;

class PermissionController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function permissions()
    {
        $data = array();
        $data['menu'] = "dev-tools";
        $data['sub_menu'] = "permissions";
        $permissions = Permission::orderBy('id', 'DESC')->get();
        return view('dev.permissions', compact('data', 'permissions'));
    }
    public function add_permission()
    {
        $data = array();
        $data['menu'] = "dev-tools";
        $data['sub_menu'] = "permissions";
        return view('dev.add_permission', compact('data'));
    }
    public function post_permission(Request $req)
    {
        try {
            if (!empty($req->name)) {
                $role = SpatieRole::where('company_id', 0)->first();
                $permission = Permission::create(['name' => $req->name]);
                $permission->assignRole($role);
                return redirect()->route('permissions')->with('success', "Permission Created Successfully");
            } else {
                throw new Exception("Name Required");
            }
        } catch (\Exception $e) {
            return back()->withInput()->with('error', $e->getMessage());
        }
    }
}
