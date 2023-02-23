<?php

namespace App\Http\Controllers;

use App\Models\Status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class StatusController extends Controller
{
    function __construct()
    {
        $this->middleware('permission:add status|delete status|update status|view status', ['only' => ['index', 'store']]);
        $this->middleware('permission:add status', ['only' => ['create', 'store']]);
        $this->middleware('permission:update status', ['only' => ['edit', 'update']]);
        $this->middleware('permission:delete status', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "statues";
        if (auth()->user()->hasRole('dev')) {
            $statues = Status::where('company_id', '!=', 0)->orderBy('id', 'DESC')->get();
        } else {
            $statues = Status::where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        }
        return view('statuses_management.index', compact('data', 'statues'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "statues";
        return view('statuses_management.create', compact('data'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'type' => 'required',
        ]);
        $data["name"] = $request->name;
        $data["type"] = $request->type;
        if (auth()->user()->hasRole('dev')) {
            $company_id = $request->company;
        } else {
            $company_id = Auth::user()->company->id;
        }
        $data["company_id"] = $company_id;
        Status::create($data);
        return redirect()->route('statuses.index')->with('success', "Status Created Successfully");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\status  $status
     * @return \Illuminate\Http\Response
     */
    public function show(Status $status)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\status  $status
     * @return \Illuminate\Http\Response
     */
    public function edit(Status $status)
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "statues";
        return view('statuses_management.edit', compact('data', 'status'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\status  $status
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Status $status)
    {
        $input["name"] = $request->name;
        $status->update($input);
        return redirect()->route('statuses.index')->with('success', "Status Updated Successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\status  $status
     * @return \Illuminate\Http\Response
     */
    public function destroy(Status $status)
    {
        $status->delete();
        return redirect()->route('statuses.index')->with('success', 'Status Deleted Successfully');
    }
}
