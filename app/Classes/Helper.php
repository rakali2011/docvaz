<?php

use Illuminate\Support\Facades\Auth;
use App\Models\Company;
use App\Models\Practice;
use App\Models\User;

if (!function_exists('companies')) {
    function companies()
    {
        $companies = Company::where('status', 1)->get();
        return $companies;
    }
}
if (!function_exists('ticket_statuses')) {
    function ticket_statuses()
    {
        return ["Open", "Inprocess", "Closed", "Reopen", "Onhold", "Waiting Approval", "Rejected"];
    }
}
if (!function_exists('get_ticket_status')) {
    function get_ticket_status($status = 0)
    {
        $statuses = ["Open", "Inprocess", "Closed", "Reopen", "Onhold", "Waiting Approval", "Rejected"];
        return $statuses[$status];
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
