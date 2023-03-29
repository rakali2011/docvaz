<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\Department;
use App\Models\Practice;
use App\Models\Ticket;
use App\Models\TicketAttachment;
use App\Models\TicketCC;
use App\Models\TicketLog;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use stdClass;

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
        if (auth()->user()->hasRole('dev'))
            $tickets = Ticket::where('company_id', '!=', 0)->orderBy('id', 'DESC')->get();
        else
            $tickets = Ticket::where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        if (auth()->user()->can('assign department user'))
            $departments = Department::where('company_id', auth()->user()->company_id)->orderBy('name', 'ASC')->get();
        else
            $departments = Auth::user()->assinged_departments();
        $practices = Auth::user()->assinged_practices();
        $teams = Auth::user()->assinged_teams();
        $company_name = Company::where('id', Auth::user()->company_id)->pluck("name")[0];
        return view('tickets_management.index', compact('data', 'tickets', 'departments', 'practices', 'teams', 'company_name'));
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

        $share_to = share_to();
        $practices = $share_to["practices"];
        $share_to = $share_to["share_to"];
        $company_name = Company::where('id', Auth::user()->company_id)->pluck("name")[0];
        return view('tickets_management.create', compact('data', 'departments', 'practices', 'share_to', 'company_name'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $user = Auth::user();
            $creator = $user->type == 3 ? "Client" : Company::where('id', $user->company_id)->pluck("name")[0];
            if (auth()->user()->hasRole('dev'))
                $company_id = $request->company;
            else
                $company_id = $user->company_id;
            if ($request->is_external)
                $to_provider = is_array($request->to_provider) ? $request->to_provider : explode(",", $request->to_provider);
            else
                $to_provider = is_array($request->to_department) ? $request->to_department : explode(",", $request->to_department);
            foreach ($to_provider as $value) {
                $practice = Practice::findorfail($value);
                $associated_client = $practice->associated_user(3);
                $client_id = isset($associated_client->pluck("id")[0]) ? $associated_client->pluck("id")[0] : 0;
                $team = $client_id > 0 ? User::findorfail($client_id)->assinged_teams() : "";
                $ticket["company_id"] = $company_id;
                $ticket["user_id"] = $user->id;
                $ticket["user_type"] = $user->type;
                $ticket["department_id"] = $request->from;
                $ticket["target_id"] = $value;
                $ticket["team_id"] = isset($team[0]->id) ? $team[0]->id : 0;
                $ticket["type"] = $request->type;
                $ticket["priority"] = $request->priority;
                $ticket["subject"] = $request->subject;
                $ticket["message"] = addslashes($request->message);
                $ticket["creator"] = $creator;
                $ticket["is_external"] = $request->is_external;
                $id = Ticket::create($ticket);
                $cc = isset($request->cc) ? $request->cc : [];
                foreach ($cc as $value) {
                    $ticket_cc["ticket_id"] = $id->id;
                    $ticket_cc["resource_id"] = $value;
                    $ticket_cc["resource_type"] = 0;
                    TicketCC::create($ticket_cc);
                }
                $share_to = isset($request->share_to) ? $request->share_to : [];
                foreach ($share_to as $value) {
                    $ticket_cc["ticket_id"] = $id->id;
                    $ticket_cc["resource_id"] = $value;
                    $ticket_cc["resource_type"] = 1;
                    TicketCC::create($ticket_cc);
                }
                if ($request->hasfile('files')) {
                    $files = $request->file('files');
                    foreach ($files as $key => $value) {
                        $attachment_info = $this->upload($value, 'ticket_attachments');
                        $attachment = new TicketAttachment;
                        $attachment->ticket_id = $id->id;
                        $attachment->reply_id = 0;
                        $attachment->type = 0;
                        $attachment->name = $attachment_info['file_name'];
                        $attachment->org_name = $attachment_info['file_org_name'];
                        $attachment->path = $attachment_info['path'];
                        $attachment->ext = $attachment_info['ext'];
                        $attachment->size = $attachment_info['size'];
                        $attachment->save();
                    }
                }
                $user_ids = get_department_practice_users($value, $request->from);
                foreach ($user_ids["department_users"] as $user_id) {
                    TicketLog::where("ticket_id", $id->id)->where("user_id", $user_id)->where("seen", 1)->delete();
                    $ticket_log = new TicketLog();
                    $ticket_log->ticket_id = $id->id;
                    $ticket_log->user_id = $user_id;
                    $ticket_log->seen = 0;
                    $ticket_log->save();
                }
            }
            DB::commit();
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
        // dd($ticket);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function edit(Ticket $ticket)
    {
        $data['menu'] = "dmail-management";
        $data['sub_menu'] = "tickets";
        return view('tickets_management.edit', compact('data', 'ticket'));
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
        $input["message"] = $request->message;
        $ticket->update($input);
        return redirect()->route('tickets.index')->with('success', "Ticket Updated Successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ticket $ticket)
    {
        $ticket->delete();
        return redirect()->route('tickets.index')->with('success', 'Ticket Deleted Successfully');
    }
    public function allTickets(Request $request)
    {
        $columns = ['id', 'response_at', 'created_at', 'creator', 'creator_name', 'practice_name', 'department_name', 'team_name', 'subject', 'priority', 'status', 'remarks'];
        $date_range = [
            "date_from" => $request->input('date_from_filter') != "" ? $request->input('date_from_filter') . ' 00:00:00' : $request->input('date_from_filter'),
            "date_to" => $request->input('date_to_filter') != "" ? $request->input('date_to_filter') . ' 23:59:59' : date("Y-m-d H:i:s")
        ];
        $filter = array(
            "team_id" => $request->input('team_filter'),
            "target_id" => $request->input('practice_filter'),
            "department_id" => $request->input('department_filter'),
            "status" => $request->input('status_filter'),
            "priority" => $request->input('priority_filter'),
            "creator" => $request->input('created_by_filter'),
            "flag" => $request->input('flag_filter'),
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = !empty($request->input('order.0.column')) ? $request->input('order.0.column') : 0;
        $order = $columns[$order];
        $dir = !empty($request->input('order.0.dir')) ? strtoupper($request->input('order.0.dir')) : "DESC";
        $search = $request->input('search.value');
        $ticket = new Ticket();
        $totalData = $ticket->countTotalTickets();
        $totalFiltered = $ticket->countFilteredTickets($date_range, $filter, $search, $start, $limit, $order, $dir);
        $tickets = $ticket->allTickets($date_range, $filter, $search, $start, $limit, $order, $dir);
        $data = array();
        if (!empty($tickets)) {
            foreach ($tickets as $ticket) {
                $ticket = $ticket->load("replies");
                $to_time = strtotime(date("Y-m-d H:is"));
                $from_time = strtotime($ticket->created_at);
                $difference = round(abs($to_time - $from_time) / 60, 2);
                $edit = '';
                $delete = '';
                if (auth()->user()->can('update ticket') && count($ticket->replies) == 0)
                    $edit = '<a class="dropdown-item" href="' . route('tickets.edit', $ticket->id) . '">Edit</a>';
                if (auth()->user()->can('delete ticket')) {
                    $delete = '<form method="POST" action="' . route('tickets.destroy', $ticket->id) . '" accept-charset="UTF-8" style="display:inline"><input name="_method" type="hidden" value="DELETE"><input name="_token" type="hidden" value="' . csrf_token() . '"><input class="dropdown-item" type="submit" value="Delete"></form>';
                }
                if ($ticket->is_external) {
                    $practice = Practice::findorfail($ticket->target_id);
                    $name = isset($practice->name) ? $practice->name : "";
                } else {
                    $department = Department::findorfail($ticket->target_id);
                    $name = isset($department->name) ? $department->name : "";
                }
                $nestedData['id'] = '<a class="ticket-replies" ref="' . $ticket->id . '" href="javascript:void(0)">' . $ticket->id . '</a>';
                $nestedData['response_at'] = $ticket->response_at;
                $nestedData['created_at'] = $ticket->created_at;
                $nestedData['creator'] = $ticket->creator;
                $nestedData['creator_name'] = $ticket->user_id;
                $nestedData['practice_name'] = $name;
                $nestedData['department_name'] = $ticket->department_id;
                $nestedData['team_name'] = $ticket->team_id;
                $nestedData['subject'] = $ticket->subject;
                $nestedData['priority'] = '<span class="' . strtolower($ticket->priority) . '">' . $ticket->priority . '</span>';
                $nestedData['status'] = $ticket->status;
                $nestedData['remarks'] = $ticket->remarks;
                $nestedData['action'] = '<button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="text-muted sr-only">Action</span></button><div class="dropdown-menu dropdown-menu-right">' . $edit . $delete . '</div>';
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
    public function getTicket(Request $request)
    {
        $response = array();
        try {
            $id = $request->id;
            $ticket = Ticket::find($id);
            $ticket = $ticket->load("attachments")->load("ccs")->load("replies");
            $response['success'] = 1;
            $response['content'] = $ticket;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = "Something Went Wrong Try Again";
        }
        return response()->json($response);
    }
    public function ticketFlag(Request $request)
    {
        $response = array();
        try {
            $ticket = Ticket::find($request->id);
            if ($ticket->flag)
                $ticket->flag = 0;
            else
                $ticket->flag = 1;
            $ticket->save();
            $response['success'] = 1;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = "Something Went Wrong Try Again";
        }
        return response()->json($response);
    }
}
