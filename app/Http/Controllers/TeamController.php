<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Team;
use App\Models\User;
use App\Models\UserTeam;
use Illuminate\Support\Facades\DB;

class TeamController extends Controller
{
    protected $team = '';
    public function __construct(Team $team)
    {
        $this->middleware('auth');
        $this->team = $team;
    }
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
    public function get_teams(Request $req)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($req->ref);
            $user = User::find($user_id);
            $type = isset($req->type) ? $req->type : "";
            if (auth()->user()->can('assign team user')) {
                $team = Team::where('company_id', $user->company_id)->orderBy('name', 'ASC')->get();
            } else {
                $team = Auth::user()->assinged_teams();
            }
            $assigned_team = $user->assinged_teams_array();
            $response['success'] = 1;
            $name = empty($type) ? "user_teams[]" : "user_teams";

            $select = $this->multiselect($team, $assigned_team, $name, 'User teams', empty($type) ? true : false);
            $response['content'] = $select;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
    public function update_team_users(Request $request, Team $team)
    {
        $response = array();
        try {
            $team_id = $this->clean_id($request->ref);
            $users = $request->team_users;
            $team = Team::findorfail($team_id);
            foreach ($users as $key => $value) {
                $users[$key] = $this->clean_id($value);
            }
            $team->users()->sync($users, TRUE);
            $response['success'] = 1;
            $response['message'] = "Updated Successfully";
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
}
