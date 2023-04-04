<?php

use Illuminate\Support\Facades\Auth;
use App\Models\Company;
use App\Models\Department;
use App\Models\Designation;
use App\Models\DocumentType;
use App\Models\Practice;
use App\Models\Status;
use App\Models\User;

if (!function_exists('companies')) {
    function companies()
    {
        $companies = Company::where('status', 1)->get();
        return $companies;
    }
}
if (!function_exists('designations')) {
    function designations()
    {
        return Designation::where('company_id', Auth::user()->company_id)->orderBy('name', 'ASC')->get();
    }
}
if (!function_exists('get_designation')) {
    function get_designation($designation_id)
    {
        $designation = Designation::findorfail($designation_id);
        return $designation->name;
    }
}
if (!function_exists('document_types')) {
    function document_types()
    {
        return DocumentType::where('company_id', Auth::user()->company_id)->orderBy('name', 'ASC')->get();
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
function get_users()
{
    $users = [];
    if (auth()->user()->can("view user")) {
        $users = User::where('company_id', Auth::user()->company_id)->where('type', 2)->get();
    } else if (auth()->user()->can("view his own users")) {
        $rank = auth()->user()->designation()->first()->rank;
        $departments = auth()->user()->assinged_departments();
        foreach ($departments as $key => $department) {
            $assinged_users = $department->assinged_users();
            foreach ($assinged_users as $index => $user) {
                if ($rank < $user->designation()->first()->rank && $user->type == 2) {
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
        $practices = Auth::user()->assinged_practices();
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
function get_assinged_practices()
{
    $practices = Auth::user()->assinged_practices()->pluck("id");
    return $practices;
}
function get_assigned_teams_user_ids($team_id = NULL)
{
    $user_ids = [];
    $assinged_teams = auth()->user()->assinged_teams();
    foreach ($assinged_teams as $key => $team) {
        if ($team->id != $team_id && $team_id != NULL)
            continue;
        $assinged_users = json_decode(json_encode($team->assinged_users()->pluck("id")), true);
        $user_ids = array_merge($user_ids, $assinged_users);
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
        $assinged_users = $practice->assinged_users();
        $practice_users = $assinged_users->pluck("id");
        foreach ($assinged_users as $key => $user) {
            $departments = $user->departments()->get()->pluck("id");
            foreach ($departments as $index => $department)
                if ($department == $department_id)
                    array_push($department_users, $user->id);
        }
    } else {
        $department = Department::findorfail($to_id);
        $department_users = $department->assinged_users()->pluck("id");
    }
    $response["department_users"] = json_decode(json_encode($department_users), true);
    $response["practice_users"] = json_decode(json_encode($practice_users), true);
    return $response;
}
