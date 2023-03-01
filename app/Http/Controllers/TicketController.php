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
        if (auth()->user()->hasRole('dev'))
            $tickets = Ticket::where('company_id', '!=', 0)->orderBy('id', 'DESC')->get();
        else
            $tickets = Ticket::where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        if (auth()->user()->can('assign department user'))
            $departments = Department::where('company_id', auth()->user()->company_id)->orderBy('name', 'ASC')->get();
        else
            $departments = Auth::user()->assinged_departments();
        return view('tickets_management.index', compact('data', 'tickets', 'departments'));
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
        return view('tickets_management.create', compact('data', 'departments', 'practices'));
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
                $ticket["message"] = addslashes($request->message);
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
        dd($ticket);
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
        $ticket->delete();
        return redirect()->route('tickets.index')->with('success', 'Ticket Deleted Successfully');
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
                $edit = '';
                $delete = '';
                if (auth()->user()->can('update ticket'))
                    $edit = '<a class="dropdown-item" href="' . route('tickets.edit', $ticket->id) . '">Edit</a>';
                if (auth()->user()->can('delete ticket')) {
                    $delete = '<form method="POST" action="' . route('tickets.destroy', $ticket->id) . '" accept-charset="UTF-8" style="display:inline"><input name="_method" type="hidden" value="DELETE"><input name="_token" type="hidden" value="' . csrf_token() . '"><input class="dropdown-item" type="submit" value="Delete"></form>';
                }
                $nestedData['id'] = '<a class="ticket-replies" ref="' . $ticket->id . '" href="javascript:void(0)">' . $ticket->id . '</a>';
                $nestedData['response_at'] = !empty($ticket->response_at) ? date("M j, y, h:i A", strtotime($ticket->response_at)) : "";
                $nestedData['created_at'] = $ticket->created_at;
                $nestedData['creator'] = $ticket->creator;
                $nestedData['creator_name'] = $ticket->creator_name;
                $nestedData['practice_name'] = $ticket->practice_name;
                $nestedData['department_name'] = $ticket->department_name;
                $nestedData['team_name'] = $ticket->team_name;
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
            $ticket = $ticket->load("replies")->load("attachments");
            $response['success'] = 1;
            $response['content'] = $ticket;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = "Something Went Wrong Try Again";
        }
        return response()->json($response);
    }
}
