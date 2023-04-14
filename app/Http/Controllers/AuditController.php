<?php

namespace App\Http\Controllers;

use App\Models\Audit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuditController extends Controller
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
        $data['menu'] = "report-management";
        $data['sub_menu'] = "audits";
        $practices = Auth::user()->assigned_practices();
        $teams = Auth::user()->assigned_teams();
        return view('reports_management.audits', compact('data', 'practices', 'teams'));
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
            "date_from" => $request->input('date_from_filter') != "" ? date("Y-m-d", strtotime($request->input('date_from_filter'))) . ' 00:00:00' : $request->input('date_from_filter'),
            "date_to" => $request->input('date_to_filter') != "" ? date("Y-m-d", strtotime($request->input('date_to_filter'))) . ' 23:59:59' : date("Y-m-d H:i:s")
        ];
        $filter = [
            "user_id" => $request->input('user_filter'),
            "event" => $request->input('event_filter')
        ];
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = !empty($request->input('order.0.column')) ? $request->input('order.0.column') : 0;
        $order = $columns[$order];
        $dir = !empty($request->input('order.0.dir')) ? strtoupper($request->input('order.0.dir')) : "DESC";
        $search = $request->input('search.value');
        $audit = new Audit();
        $totalData = $audit->countTotal();
        $totalFiltered = $audit->countFiltered($date_range, $filter, $search);
        $audits = $audit->getData($date_range, $filter, $search, $start, $limit, $order, $dir);
        $data = array();
        if (!empty($audits)) {
            foreach ($audits as $audit) {
                $count = 0;
                $old_values = "";
                foreach (json_decode($audit->old_values) as $key => $old_value) {
                    $old_values .= ucwords($key) . ":<b>$old_value</b>&nbsp;";
                    if ($count % 2 == 1) {
                        $old_values .= "<br>";
                    }
                    $count++;
                }
                $new_values = "";
                foreach (json_decode($audit->new_values) as $key => $new_value) {
                    $new_values .= ucwords($key) . ":<b>$new_value</b>&nbsp;";
                    if ($count % 2 == 1) {
                        $new_values .= "<br>";
                    }
                    $count++;
                }
                $nestedData['user_id'] = $audit->user_id;
                $nestedData['event'] = $audit->event;
                $nestedData['auditable_type'] = $audit->auditable_type;
                $nestedData['auditable_id'] = $audit->auditable_id;
                $nestedData['old_values'] = $old_values;
                $nestedData['new_values'] = $new_values;
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
