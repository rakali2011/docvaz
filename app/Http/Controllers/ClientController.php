<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;
use App\Models\User;
use Spatie\Permission\Models\Role as SpatieRole;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\PostClient;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

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

        if (auth()->user()->hasRole('dev')) {
            $clients = User::where('company_id', '!=', 0)->where('type', 3)->orderBy('id', 'DESC')->get();
        } else {
            $clients = User::where('company_id', '!=', 0)
                ->where('company_id', Auth::user()->company->id)
                ->where('type', 3)
                ->orderBy('firstname', 'ASC')->get();
        }
        foreach ($clients as $client) {
            $client->roles = $client->roles()->pluck('display_name');
            $roles = "";
            foreach ($client->roles as $role) {
                $roles .= "<span class='role'>$role</span>";
            }
            $client->roles = $roles;
        }
        return view('user_management.clients', compact('data', 'clients'));
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
            $teams = Auth::user()->assinged_teams();
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
            $teams = Auth::user()->assinged_teams();
        $assigned_teams = $user->assinged_teams_array();
        return view('user_management.add_client', compact('data', 'user', 'roles', 'userRole', 'teams', 'assigned_teams'));
    }
    public function post_client(PostClient $req)
    {
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
            } else {
                $company_id = Auth::user()->company->id;
            }
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
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->withInput()->with('error', $th->getMessage());
        }
    }
    public function update_client(Request $req, $id = '')
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
            $this->validate($req, [
                'email' => 'required|email|unique:users,email,' . $id,
                'username' => 'required|unique:users,username,' . $id,
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
        } catch (\Exception $e) {
            return back()->withInput()->with('error', $e->getMessage());
        }
    }
}
