<?php

use App\Models\Company;
use App\Models\User;

if (!function_exists('companies')) {
    function companies()
    {
        $companies = Company::where('status', 1)->get();
        return $companies;
    }
}
function ticket_statuses()
{
    return ["Open", "Inprocess", "Closed", "Reopen", "Onhold", "Waiting Approval", "Rejected"];
}
function get_ticket_status($status = 0)
{
    $statuses = ["Open", "Inprocess", "Closed", "Reopen", "Onhold", "Waiting Approval", "Rejected"];
    return $statuses[$status];
}
function ticket_types()
{
    $types = ["Query", "Other", "Info/Other"];
    sort($types);
    return $types;
}
function ticket_priorities()
{
    $priorities = ["Low", "Medium", "High", "Concerning"];
    sort($priorities);
    return $priorities;
}
