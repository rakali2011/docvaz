<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;
use App\Models\User;
use Spatie\Permission\Models\Role as SpatieRole;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\PostUser;
use App\Http\Requests\PostClient;
use Illuminate\Support\Facades\DB;
use Exception;
use Illuminate\Support\Facades\Hash;

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
        if (auth()->user()->hasRole('dev')) {
            $users = User::where('company_id', '!=', 0)->where('type', 2)->orderBy('id', 'DESC')->get();
        } else {
            $users = User::where('company_id', '!=', 0)->where('company_id', Auth::user()->company->id)->where('type', 2)->orderBy('firstname', 'ASC')->get();
        }
        return view('user_management.users', compact('data', 'users'));
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
        return view('user_management.add_user', compact('data', 'user', 'roles', 'userRole'));
    }
    public function post_user(PostUser $req)
    {
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
            } else {
                $company_id = Auth::user()->company->id;
            }
            $this->validate($req, [
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'password' => ['required', 'string', 'min:8', 'confirmed'],
            ]);
            $user = new User;
            $user->firstname = $req->firstname;
            $user->lastname = $req->lastname;
            $user->email = $req->email;
            $user->company_id = $company_id;
            $user->password = Hash::make($req->password);
            $user->type = 2;
            $user->save();
            $user->assignRole($req->input('roles'));
            DB::commit();
            return redirect()->route('users')->with('success', "User Created Successfully");
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->withInput()->with('error', $th->getMessage());
        }
    }
    public function update_user(PostUser $req, $id = '')
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
            ]);
            $user = User::findorfail($id);
            $user->firstname = $req->firstname;
            $user->lastname = $req->lastname;
            $user->email = $req->email;
            $user->company_id = $company_id;
            $user->save();
            DB::table('model_has_roles')->where('model_id', $id)->delete();
            $user->assignRole($req->input('roles'));
            DB::commit();
            return redirect()->route('users')->with('success', "User Updated Successfully");
        } catch (\Exception $e) {
            return back()->withInput()->with('error', $e->getMessage());
        }
    }
    public function get_users(Request $req)
    {
        $response = array();
        try {
            $team_id = $this->clean_id($req->ref);
            $team = Team::find($team_id);
            $users = User::select('id', DB::raw("CONCAT(users.firstname,' ',users.lastname) as name"))->where('company_id', $team->company_id)->where('type', 2)->orderBy('firstname', 'ASC')->get();
            $assigned_users = $team->assinged_users_array();
            $response['success'] = 1;
            $select = $this->multiselect($users, $assigned_users, 'team_users[]', 'User teams');
            $response['content'] = $select;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
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
    public function update_user_practices(Request $request)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($request->ref);
            $practices = $request->user_practices;
            $user = User::findorfail($user_id);
            foreach ($practices as $key => $value) {
                $practices[$key] = $this->clean_id($value);
            }
            $user->departments()->sync($practices, TRUE);
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
            $teams = $request->user_teams;
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
}
