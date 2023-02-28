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
function ticket_statuses($status = 0)
{
    $statuses = ["Open", "Inprocess", "Closed", "Reopen", "Onhold", "Waiting Approval", "Rejected"];
    return $statuses[$status];
}
