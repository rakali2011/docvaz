<?php

namespace App\Http\Controllers;

use App\Models\Link;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LinkController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = array();
        $data['menu'] = 'general-management';
        $data['sub_menu'] = 'links';
        $links = [];
        if (auth()->user()->can('create link'))
            $links = Link::orderBy('id', 'DESC')->get();
        return view('link_management.index', compact('data', 'links'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['menu'] = 'general-management';
        $data['sub_menu'] = 'links';
        return view('link_management.create', compact('data'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $link = new Link;
        $link->company_id = Auth::user()->company->id;
        $link->user_id = Auth::user()->company->id;
        $link->token = md5(time());
        $link->link =  route('practice_info_form', $link->token);
        $link->provider_name = $request->name;
        $link->expired_at = date('Y-m-d H:i:s', strtotime("+{$request->expired_at} hours"));;
        $link->save();
        return redirect()->route('links.index')->with('success', "Link Created Successfully");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Link  $link
     * @return \Illuminate\Http\Response
     */
    public function show(Link $link)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Link  $link
     * @return \Illuminate\Http\Response
     */
    public function edit(Link $link)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Link  $link
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Link $link)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Link  $link
     * @return \Illuminate\Http\Response
     */
    public function destroy(Link $link)
    {
        //
    }
}
