<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\Department;
use App\Models\Practice;
use App\Models\Ticket;
use App\Models\TicketCC;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TicketController extends Controller
{
    function __construct()
    {
        $this->middleware('permission:create ticket|delete ticket|update ticket|view ticket', ['only' => ['index', 'store']]);
        $this->middleware('permission:create ticket', ['only' => ['create', 'store']]);
        $this->middleware('permission:update ticket', ['only' => ['edit', 'update']]);
        $this->middleware('permission:delete ticket', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {


        $data['menu'] = "dmail-management";
        $data['sub_menu'] = "tickets";
        if (auth()->user()->hasRole('dev')) {
            $tickets = Ticket::where('company_id', '!=', 0)->orderBy('id', 'DESC')->get();
        } else {
            $tickets = Ticket::where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        }
        return view('tickets_management.index', compact('data', 'tickets'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['menu'] = "dmail-management";
        $data['sub_menu'] = "tickets";
        $user = User::find(auth()->user()->id);;
        if (auth()->user()->can('assign department user'))
            $departments = Department::where('company_id', $user->company_id)->orderBy('name', 'ASC')->get();
        else
            $departments = Auth::user()->assinged_departments();
        if (auth()->user()->can('assign practice user'))
            $practices = Practice::where('company_id', $user->company_id)->orderBy('name', 'ASC')->get();
        else
            $practices = Auth::user()->assinged_practices();
        $types = ["Query", "Other", "Info/Other"];
        sort($types);
        $priorities = ["Low", "Medium", "High", "Concerning"];
        sort($priorities);
        return view('tickets_management.create', compact('data', 'departments', 'practices', 'types', 'priorities'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user = Auth::user();
        $creator = $user->type == 3 ? "Provider" : Company::where('id', $user->company_id)->pluck("name")[0];
        $creator_name = $user->firstname . " " . $user->lastname;
        if (auth()->user()->hasRole('dev'))
            $company_id = $request->company;
        else
            $company_id = $user->company_id;
        $to_provider = $request->to_provider;
        foreach ($to_provider as $value) {
            $department_name = Department::where('id', $request->from)->pluck("name")[0];
            $practice = Practice::findorfail($value);
            $practice_name = $practice->name;
            $associated_client = $practice->associated_user(3);
            $client_id = $associated_client->pluck("id")[0];
            $team = User::findorfail($client_id)->assinged_teams();
            $ticket["company_id"] = $company_id;
            $ticket["user_id"] = $user->id;
            $ticket["creator_name"] = $creator_name;
            $ticket["from"] = $request->from;
            $ticket["department_name"] = $department_name;
            $ticket["practice_id"] = $value;
            $ticket["practice_name"] = $practice_name;
            $ticket["team_id"] = $team[0]->id;
            $ticket["team_name"] = $team[0]->name;
            $ticket["type"] = $request->type;
            $ticket["priority"] = $request->priority;
            $ticket["subject"] = $request->subject;
            $ticket["message"] = $request->message;
            $ticket["creator"] = $creator;
            $id = Ticket::create($ticket);
            $cc = isset($request->cc) ? $request->cc : [];
            foreach ($cc as $value) {
                $ticket_cc["ticket_id"] = $id->id;
                $ticket_cc["department_id"] = $value;
                TicketCC::create($ticket_cc);
            }
        }
        return redirect()->route('tickets.index')->with('success', "Ticket Created Successfully");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function show(Ticket $ticket)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function edit(Ticket $ticket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Ticket $ticket)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ticket $ticket)
    {
        //
    }
}
