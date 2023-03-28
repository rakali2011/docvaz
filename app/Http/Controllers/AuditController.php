<?php

namespace App\Http\Controllers;

use App\Models\Audit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuditController extends Controller
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
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
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
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\status  $status
     * @return \Illuminate\Http\Response
     */
    public function destroy(Status $status)
    {
    }
    public function audits(Request $request)
    {
        $columns = ['user_id', 'event', 'auditable_type', 'auditable_id', 'old_values', 'new_values', 'ip_address', 'user_agent', 'created_at', 'updated_at'];
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
        $audit = new Audit();
        $totalData = $audit->countTotal();
        $totalFiltered = $audit->countFiltered($date_range, $filter, $search, $start, $limit, $order, $dir);
        $audits = $audit->getData($date_range, $filter, $search, $start, $limit, $order, $dir);
        $data = array();
        if (!empty($audits)) {
            foreach ($audits as $audit) {
                $nestedData['user_id'] = $audit->user_id;
                $nestedData['event'] = $audit->event;
                $nestedData['auditable_type'] = $audit->auditable_type;
                $nestedData['auditable_id'] = $audit->auditable_id;
                $nestedData['old_values'] = $audit->old_values;
                $nestedData['new_values'] = $audit->new_values;
                $nestedData['ip_address'] = $audit->ip_address;
                $nestedData['user_agent'] = $audit->user_agent;
                $nestedData['created_at'] = $audit->created_at;
                $nestedData['updated_at'] = $audit->updated_at;
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
