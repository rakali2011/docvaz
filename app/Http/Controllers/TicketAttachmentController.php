<?php

namespace App\Http\Controllers;

use App\Models\TicketAttachment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class TicketAttachmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\TicketAttachment  $ticketAttachment
     * @return \Illuminate\Http\Response
     */
    public function show(TicketAttachment $ticketAttachment)
    {
        if (ownership($ticketAttachment->ticket_id)) {
            $file = storage_path() . "/app/" . $ticketAttachment->path;
            return Response::file($file);
        } else {
            return abort(403);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TicketAttachment  $ticketAttachment
     * @return \Illuminate\Http\Response
     */
    public function edit(TicketAttachment $ticketAttachment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TicketAttachment  $ticketAttachment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TicketAttachment $ticketAttachment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TicketAttachment  $ticketAttachment
     * @return \Illuminate\Http\Response
     */
    public function destroy(TicketAttachment $ticketAttachment)
    {
        //
    }
}
