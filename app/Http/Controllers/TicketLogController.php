<?php

namespace App\Http\Controllers;

use App\Models\TicketLog;
use Illuminate\Http\Request;

class TicketLogController extends Controller
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
     * @param  \App\Models\TicketLog  $ticketLog
     * @return \Illuminate\Http\Response
     */
    public function show(TicketLog $ticketLog)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\TicketLog  $ticketLog
     * @return \Illuminate\Http\Response
     */
    public function edit(TicketLog $ticketLog)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\TicketLog  $ticketLog
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TicketLog $ticketLog)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\TicketLog  $ticketLog
     * @return \Illuminate\Http\Response
     */
    public function destroy(TicketLog $ticketLog)
    {
        //
    }
}
