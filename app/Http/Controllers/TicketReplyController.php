<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\Ticket;
use App\Models\TicketAttachment;
use App\Models\TicketReply;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TicketReplyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            $ticket_id = $request->ticket_id;
            $ticket = Ticket::findorfail($ticket_id);
            $department_old = $ticket->department_name;
            $department_new = "";
            if (!empty($request->refer_to))
                $this->validate($request, ['message' => 'required']);
            if (!empty($request->status) && $request->status == $ticket->status)
                $this->validate($request, ['message' => 'required']);
            if (!empty($request->priority) && $request->priority == $ticket->priority)
                $this->validate($request, ['message' => 'required']);

            if (!empty($request->refer_to)) {
                $ticket->department_id = $request->refer_to;
                $department_new = Department::where('id', $request->refer_to)->pluck("name")[0];
                $ticket->department_name = $department_new;
            }
            if (!empty($request->status))
                $ticket->status = $request->status;
            if (!empty($request->priority))
                $ticket->priority = $request->priority;
            $ticket->save();
            if (!empty($request->message)) {
                $ticket_reply = new TicketReply();
                $ticket_reply->ticket_id = $ticket_id;
                $ticket_reply->user_id = Auth::user()->id;
                $ticket_reply->creator_name = Auth::user()->firstname . " " . Auth::user()->lastname;
                $ticket_reply->message = addslashes($request->message);
                $ticket_reply->is_refered = 0;
                $ticket_reply->save();
                $reply_id = $ticket_reply->id;
                if ($request->hasfile('files')) {
                    $files = $request->file('files');
                    foreach ($files as $key => $value) {
                        $attachment_info = $this->upload($value, 'ticket_attachments');
                        $attachment = new TicketAttachment;
                        $attachment->ticket_id = $ticket_id;
                        $attachment->reply_id = $reply_id;
                        $attachment->type = 1;
                        $attachment->name = $attachment_info['file_name'];
                        $attachment->org_name = $attachment_info['file_org_name'];
                        $attachment->path = $attachment_info['path'];
                        $attachment->ext = $attachment_info['ext'];
                        $attachment->size = $attachment_info['size'];
                        $attachment->save();
                    }
                }
            }
            if (!empty($request->refer_to)) {
                $ticket_reply = new TicketReply();
                $ticket_reply->ticket_id = $ticket_id;
                $ticket_reply->user_id = Auth::user()->id;
                $ticket_reply->creator_name = Auth::user()->firstname . " " . Auth::user()->lastname;
                $ticket_reply->message = '<p class="text-center text-danger mb-0 font-weight-bold">This ticket is forwarded from ' . $department_old . ' to ' . $department_new . '</p>';
                $ticket_reply->is_refered = 1;
                $ticket_reply->save();
            }
            DB::commit();
            $response['success'] = 1;
            $response['message'] = "Reply Created Successfully";
        } catch (\Throwable $th) {
            DB::rollback();
            $response['success'] = 0;
            $response['message'] = "Message field is required.";
        }
        return response()->json($response);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TicketReply  $ticketReply
     * @return \Illuminate\Http\Response
     */
    public function show(TicketReply $ticketReply)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TicketReply  $ticketReply
     * @return \Illuminate\Http\Response
     */
    public function edit(TicketReply $ticketReply)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TicketReply  $ticketReply
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TicketReply $ticketReply)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TicketReply  $ticketReply
     * @return \Illuminate\Http\Response
     */
    public function destroy(TicketReply $ticketReply)
    {
        //
    }
}
