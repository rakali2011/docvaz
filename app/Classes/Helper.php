<?php

use Illuminate\Support\Facades\Auth;
use App\Models\Company;
use App\Models\Department;
use App\Models\Designation;
use App\Models\DocumentType;
use App\Models\File;
use App\Models\Practice;
use App\Models\Status;
use App\Models\Team;
use App\Models\Ticket;
use App\Models\User;
use Spatie\Permission\Models\Role as SpatieRole;

function roles()
{
    $roles = SpatieRole::where('company_id', Auth::user()->company->id)->pluck('display_name', 'id')->all();
    return $roles;
}
if (!function_exists('companies')) {
    function companies()
    {
        $companies = Company::where('status', 1)->get();
        return $companies;
    }
}
// Departments
if (!function_exists('departments')) {
    function departments()
    {
        if (auth()->user()->can('assign department user'))
            $departments = Department::where('company_id', Auth::user()->company_id)->orderBy('name', 'ASC')->get();
        else
            $departments = Auth::user()->assigned_departments();
        return $departments;
    }
}
if (!function_exists('department_users')) {
    function department_users($department_id)
    {
        $department = Department::findorfail($department_id);
        $department_users = $department->assigned_users()->pluck("id");
        return json_decode(json_encode($department_users, true));
    }
}
if (!function_exists('get_departments_users')) {
    function get_departments_users()
    {
        $user_ids = [];
        $departments = departments();
        foreach ($departments as $key => $department)
            $user_ids = array_merge($user_ids, department_users($department->id));
        $user_ids = array_unique($user_ids);
        sort($user_ids);
        return $user_ids;
    }
}
// Designations
if (!function_exists('designations')) {
    function designations()
    {
        return Designation::where('company_id', Auth::user()->company_id)->orderBy('rank', 'ASC')->get();
    }
}
if (!function_exists('get_designation')) {
    function get_designation($designation_id)
    {
        if (empty($designation_id))
            return "";
        $designation = Designation::findorfail($designation_id);
        return $designation->name;
    }
}
if (!function_exists('designation_users')) {
    function designation_users($designation_id)
    {
        $designation = Designation::findorfail($designation_id);
        $designation_users = $designation->users()->pluck("id");
        return json_decode(json_encode($designation_users, true));
    }
}
if (!function_exists('get_designations_users')) {
    function get_designations_users()
    {
        $user_ids = [];
        $designations = designations();
        foreach ($designations as $key => $designation)
            $user_ids = array_merge($user_ids, designation_users($designation->id));
        $user_ids = array_unique($user_ids);
        sort($user_ids);
        return $user_ids;
    }
}
// Document Types
if (!function_exists('document_types')) {
    function document_types()
    {
        if (auth()->user()->can("assign document user"))
            return DocumentType::where('company_id', Auth::user()->company_id)->orderBy('name', 'ASC')->get();
        else
            return Auth::user()->assigned_document_types();
    }
}
if (!function_exists('get_document_type')) {
    function get_document_type($type_id)
    {
        $document_type = DocumentType::findorfail($type_id);
        return $document_type->name;
    }
}
if (!function_exists('statuses')) {
    function statuses($type)
    {
        return Status::where('company_id', Auth::user()->company_id)->where('type', $type)->orderBy('name', 'ASC')->get();
    }
}
if (!function_exists('get_status')) {
    function get_status($status_id)
    {
        if (!$status_id)
            return "";
        $status = Status::findorfail($status_id);
        return isset($status->name) ? $status->name : "";
    }
}
if (!function_exists('ticket_types')) {
    function ticket_types()
    {
        $types = ["Query", "Other", "Info/Other"];
        sort($types);
        return $types;
    }
}
if (!function_exists('ticket_priorities')) {
    function ticket_priorities()
    {
        $priorities = ["Low", "Medium", "High", "Concerning"];
        sort($priorities);
        return $priorities;
    }
}
if (!function_exists('timezones')) {
    function timezones()
    {
        $timezones = ["Asia/Karachi", "US/Alaska", "US/Arizona", "US/Central", "US/Eastern", "US/Hawaii", "US/Mountain", "US/Pacific"];
        sort($timezones);
        return $timezones;
    }
}
if (!function_exists('get_timezone')) {
    function get_timezone($timezone)
    {
        $timezones = ["Asia/Karachi", "US/Alaska", "US/Arizona", "US/Central", "US/Eastern", "US/Hawaii", "US/Mountain", "US/Pacific"];
        return $timezones[$timezone];
    }
}
if (!function_exists('users')) {
    function users($type = NULL)
    {
        if (!empty($type))
            $users = User::where('company_id', Auth::user()->company_id)->where('type', $type)->get();
        else
            $users = User::where('company_id', Auth::user()->company_id)->get();
        return $users;
    }
}
function get_users($type)
{
    $users = [];
    if (auth()->user()->hasRole('dev')) {
        $users = User::where('company_id', '!=', 0)->where('type', $type)->get();
    } else if (auth()->user()->can("view user")) {
        $users = User::where('company_id', Auth::user()->company_id)->where('type', $type)->get();
    } else if (auth()->user()->can("view his own users")) {
        $rank = auth()->user()->designation()->first()->rank;
        $departments = auth()->user()->assigned_departments();
        foreach ($departments as $key => $department) {
            $assigned_users = $department->assigned_users();
            foreach ($assigned_users as $index => $user) {
                if ($rank < $user->designation()->first()->rank && $user->type == $type) {
                    $users[] = $user;
                }
            }
        }
    }
    return $users;
}
function share_to()
{
    if (auth()->user()->can('assign practice user'))
        $practices = Practice::where('company_id', auth()->user()->company_id)->orderBy('name', 'ASC')->get();
    else
        $practices = Auth::user()->assigned_practices();
    $share_to = [];
    if (auth()->user()->type == 3) {
        foreach ($practices as $key => $value) {
            $practice = Practice::findorfail($value->id);
            $associated_client = $practice->associated_user(3);
            foreach ($associated_client as $index => $client) {
                if (auth()->user()->id != $client->id) {
                    $row = new stdClass;
                    $row->id = $client->id;
                    $row->name = $client->firstname . " " . $client->lastname;
                    $share_to[] = $row;
                }
            }
        }
    }
    return ["practices" => $practices, "share_to" => $share_to];
}
function get_assigned_practices()
{
    $practices = Auth::user()->assigned_practices()->pluck("id");
    return $practices;
}
function get_assigned_teams_user_ids($team_id = NULL)
{
    $user_ids = [];
    $assigned_teams = auth()->user()->assigned_teams();
    foreach ($assigned_teams as $key => $team) {
        if ($team->id != $team_id && $team_id != NULL)
            continue;
        $assigned_users = json_decode(json_encode($team->assigned_users()->pluck("id")), true);
        $user_ids = array_merge($user_ids, $assigned_users);
    }
    $user_ids = array_unique($user_ids);
    sort($user_ids);
    return $user_ids;
}
function get_department_practice_users($to_id, $department_id, $is_external)
{
    $response = [];
    $department_users = [];
    $practice_users = [];
    if ($is_external) {
        $practice = Practice::findorfail($to_id);
        $assigned_users = $practice->assigned_users();
        $practice_users = $assigned_users->pluck("id");
        foreach ($assigned_users as $key => $user) {
            $departments = $user->departments()->get()->pluck("id");
            foreach ($departments as $index => $department)
                if ($department == $department_id)
                    array_push($department_users, $user->id);
        }
    } else {
        $department = Department::findorfail($to_id);
        $department_users = $department->assigned_users()->pluck("id");
    }
    $response["department_users"] = json_decode(json_encode($department_users), true);
    $response["practice_users"] = json_decode(json_encode($practice_users), true);
    return $response;
}
function ownership($target_id, $type = "ticket_attachment")
{
    if ($type == "ticket_attachment") {
        $departments = auth()->user()->departments()->get()->pluck("id");
        $departments = json_decode(json_encode($departments), true);
        $ticket = Ticket::findorfail($target_id);
        if ($ticket->is_external) {
            if (in_array($ticket->department_id, $departments))
                return true;
            else
                return false;
        } else {
            if (in_array($ticket->department_id, $departments) || in_array($ticket->target_id, $departments))
                return true;
            else
                return false;
        }
    } else if ($type == "file") {
        $practices = Auth::user()->assigned_practices_array();
        $file = File::findorfail($target_id);
        if (in_array($file->practice_id, $practices))
            return true;
        else
            return false;
    }
}
// Teams
if (!function_exists('teams')) {
    function teams()
    {
        if (auth()->user()->can('assign team user'))
            $teams = Team::where('company_id', Auth::user()->company_id)->orderBy('name', 'ASC')->get();
        else
            $teams = auth()->user()->assigned_teams_array();
        return $teams;
    }
}
if (!function_exists('team_users')) {
    function team_users($team_id)
    {
        $team = Team::findorfail($team_id);
        $team_users = $team->assigned_users()->pluck("id");
        return json_decode(json_encode($team_users, true));
    }
}
if (!function_exists('get_teams_users')) {
    function get_teams_users()
    {
        $user_ids = [];
        $teams = teams();
        foreach ($teams as $key => $team)
            $user_ids = array_merge($user_ids, team_users($team->id));
        $user_ids = array_unique($user_ids);
        sort($user_ids);
        return $user_ids;
    }
}
if (!function_exists('get_tagsinput')) {
    function get_tagsinput($json)
    {
        if (!empty($json)) {
            $json = json_decode($json, true);
            $json = array_column($json, "value");
            $json = implode(",", $json);
            return $json;
        } else
            return $json;
    }
}
