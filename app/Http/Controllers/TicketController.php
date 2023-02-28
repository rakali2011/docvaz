<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\Department;
use App\Models\Practice;
use App\Models\Ticket;
use App\Models\TicketAttachment;
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
        try {
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
                $client_id = isset($associated_client->pluck("id")[0]) ? $associated_client->pluck("id")[0] : 0;
                $team = $client_id > 0 ? User::findorfail($client_id)->assinged_teams() : "";
                $ticket["company_id"] = $company_id;
                $ticket["user_id"] = $user->id;
                $ticket["creator_name"] = $creator_name;
                $ticket["from"] = $request->from;
                $ticket["department_name"] = $department_name;
                $ticket["practice_id"] = $value;
                $ticket["practice_name"] = $practice_name;
                $ticket["team_id"] = isset($team[0]->id) ? $team[0]->id : 0;
                $ticket["team_name"] = isset($team[0]->name) ? $team[0]->name : "";
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
                if ($request->hasfile('files')) {
                    $files = $request->file('files');
                    foreach ($files as $key => $value) {
                        $attachment_info = $this->upload($value, 'ticket_attachments');
                        $attachment = new TicketAttachment;
                        $attachment->ticket_id = $id->id;
                        $attachment->name = $attachment_info['file_name'];
                        $attachment->org_name = $attachment_info['file_org_name'];
                        $attachment->path = $attachment_info['path'];
                        $attachment->ext = $attachment_info['ext'];
                        $attachment->size = $attachment_info['size'];
                        $attachment->save();
                    }
                }
            }
            $response['success'] = 1;
            $response['message'] = "Ticket Created Successfully";
            $response["route"] = route('tickets.index');
        } catch (\Throwable $th) {
            DB::rollback();
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
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
        dd($ticket);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function edit(Ticket $ticket)
    {
        dd($ticket->attachments);
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
    public function allTickets(Request $request)
    {
        $columns = ['id', 'response_at', 'created_at', 'creator', 'creator_name', 'practice_name', 'department_name', 'team_name', 'subject', 'priority', 'status', 'remarks'];
        $date_range = array(
            "from_date" => $request->input('from_date') != "" ? $request->input('from_date') . ' 00:00:00' : $request->input('from_date'),
            "to_date" => $request->input('to_date') != "" ? $request->input('to_date') . ' 23:59:59' : $request->input('to_date')
        );

        $filter = array(
            "practice_id" => $request->input('practice_id'),
            "status" => $request->input('status'),
            "pro_speciality" => $request->input('pro_speciality'),
            "pro_state" => $request->input('pro_state'),
        );

        $provider = new Provider;
        if (auth()->user()->hasRole('super') || auth()->user()->hasRole('manager') || auth()->user()->hasRole('provider')) {
            $totalData = $provider->count_providers($date_range, $filter);
        } else {
            $totalData = $provider->count_agent_providers($date_range, $filter);
        }

        $totalFiltered = $totalData;

        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');

        if (empty($request->input('search.value'))) {
            if (auth()->user()->hasRole('super') || auth()->user()->hasRole('manager') || auth()->user()->hasRole('provider')) {
                $providers = $provider->all_providers($date_range, $filter, $start, $limit, $order, $dir);
            } else {
                $providers = $provider->all_agent_providers($date_range, $filter, $start, $limit, $order, $dir);
            }
        } else {
            $search = $request->input('search.value');
            if (auth()->user()->hasRole('super') || auth()->user()->hasRole('manager') || auth()->user()->hasRole('provider')) {
                $providers = $provider->all_search_providers($date_range, $filter, $search, $start, $limit, $order, $dir);
            } else {
                $providers = $provider->all_search_agent_providers($date_range, $filter, $search, $start, $limit, $order, $dir);
            }
            if (auth()->user()->hasRole('super') || auth()->user()->hasRole('manager') || auth()->user()->hasRole('provider')) {
                $totalFiltered = $provider->count_search_providers($date_range, $filter, $search, $start, $limit, $order, $dir);
            } else {
                $totalFiltered = $provider->count_search_agent_providers($date_range, $filter, $search, $start, $limit, $order, $dir);
            }
        }

        $data = array();
        if (!empty($providers)) {
            foreach ($providers as $provider) {

                $status = $provider->status == 'active' ? 'checked' : '';
                $delete = route('provider.delete', $provider->id);
                $edit = route('provider.edit', $provider->id);
                $signup_status = "<span class='signup_status' >Unassigned</span>";
                foreach ($provider->assigned_users as  $assigned) {

                    if ($assigned->hasRole('agent') || $assigned->hasRole('lead')) {
                        $signup_status = "";
                        break;
                    } else {
                        $signup_status = "<span class='signup_status' >Unassigned</span>";
                    }
                }
                //$signup_status = "";
                //   $view='<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#favoritesModal">Add to Favorites</button>';
                $view = '<a href="#favoritesModal" title="Info" id="' . $provider->id . '"  data-toggle="modal" class="provider_detail_view"
   ><i class="fa fa-info-circle" aria-hidden="true"></i></a>&emsp;';

                $del = (auth()->user()->hasRole('provider') || auth()->user()->hasRole('provider-office')) ? "" : "<a onclick='return confirm(\"Are you sure to delete?\")' href='{$delete}' title='DELETE' ><i class='fa fa-times' aria-hidden='true'></i></a>&emsp;";
                $edi = (auth()->user()->hasRole('provider') || auth()->user()->hasRole('provider-office')) ? "" : "<a onclick='return confirm(\"Are you sure to update?\")' href='{$edit}' title='EDIT' ><i class='fa fa-pencil' aria-hidden='true'></i></a>&emsp;";
                $history = "<a href='#historyModal' title='History' id='" . $provider->id . "' data-toggle='modal' class='provider_history_view' ><i class='fa fa-history' aria-hidden='true'></i></a>&emsp;";
                $active = (auth()->user()->hasRole('provider') || auth()->user()->hasRole('provider-office')) ? "" :
                    '<label class="switch"><input type="checkbox" class="togBtn" id="' . $provider->id . '" ' . $status . ' ><div class="slider round"></span></div></label>';
                $nestedData['name'] = $provider->name . " " . $provider->middle_initial . " " . $provider->last_name;
                $nestedData['individual_npi'] = $provider->individual_npi;
                $nestedData['practice_name'] = isset($provider->practice->practice_name) ? '(' . $provider->practice->practice_code . ') ' . $provider->practice->practice_name : "";
                //                $nestedData['practice_name'] = $provider->practice_name;
                $nestedData['email'] = $provider->email;
                $nestedData['status'] = $provider->status;
                $nestedData['created_at'] = date("M j, Y", strtotime($provider->created_at));
                $nestedData['action'] = $view . $del . $edi . $history . $active;
                $data[] = $nestedData;
            }
        }

        $json_data = array(
            "draw" => intval($request->input('draw')),
            "recordsTotal" => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data" => $data
        );

        echo json_encode($json_data);
    }
}
