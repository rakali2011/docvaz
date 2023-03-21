<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Practice;
use App\Models\File;
use App\Models\Status;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;
use Exception;
use Illuminate\Database\Eloquent\Collection;

class FileController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function show($id)
    {
        if (auth()->user()->can('view file')) {
            $id = $this->clean_id($id);
            $document = File::findOrFail($id);
            $file = storage_path() . "/app/" . $document->path;
            return Response::file($file);
        } else {
            return abort(403);
        }
    }
    public function files()
    {
        $data = array();
        $data['menu'] = "files-management";
        $data['sub_menu'] = "files";
        $practices = Auth::user()->assinged_practices();
        $files = new Collection();
        foreach ($practices as $key => $value) {
            $pro = $value->file->all();
            foreach ($pro as $key1 => $value1) {
                $value1->pname = $value->name;
                $files->push($value1);
            }
        }
        return view('files_management.files', compact('data', 'files'));
    }
    public function import()
    {
        $data['menu'] = "files-management";
        $data['sub_menu'] = "import";
        if (auth()->user()->hasRole('dev')) {
            $practices = Practice::orderBy('id', 'DESC')->get();
        } else {
            $practices = Auth::user()->assinged_practices();
        }
        return view('files_management.import', compact('data', 'practices'));
    }
    function edit_file($id)
    {
        $id = $this->clean_id($id);
        $file = File::findOrFail($id);
        $data['menu'] = "files-management";
        $data['sub_menu'] = "import";
        if (auth()->user()->hasRole('dev')) {
            $practices = Practice::orderBy('id', 'DESC')->get();
        } else {
            $practices = Auth::user()->assinged_practices();
        }
        return view('files_management.update', compact('data', 'practices', 'file'));
    }
    public function post_file(Request $req)
    {
        $response = array();
        DB::beginTransaction();
        try {
            $req->validate([
                'status' => 'required'
            ]);
            $practice = $this->clean_id($req->practice);
            if ($req->hasfile('files')) {
                $files = $req->file('files');
                foreach ($files as $key => $value) {
                    $date = date('m-Y');
                    $file_info = $this->upload($value, 'files/' . $date);
                    $file = new File;
                    $file->practice_id = $practice;
                    $file->user_id = Auth::user()->id;
                    $file->status = $req->status;
                    $file->name = $file_info['file_name'];
                    $file->org_name = $file_info['file_org_name'];
                    $file->path = $file_info['path'];
                    $file->ext = $file_info['ext'];
                    $file->size = $file_info['size'];
                    $file->save();
                }
                DB::commit();
                $response['success'] = 1;
                $response['message'] = "Files Imported Successfully";
            } else {
                throw new Exception("Choose Files");
            }
        } catch (\Throwable $th) {
            DB::rollback();
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
    public function update_file(Request $req, $id = '')
    {
        if ($id) {
            $id = $this->clean_id($id);
        }
        DB::beginTransaction();
        try {
            $req->validate([
                'status' => 'required'
            ]);
            $file = File::findorfail($id);
            $file->status = $req->status;
            $file->doc_type = $req->doc_type;
            $file->save();
            DB::commit();
            $response['success'] = 1;
            $response['message'] = "File Updated Successfully";
        } catch (\Throwable $th) {
            DB::rollback();
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
    public function allFiles(Request $request)
    {
        $columns = ['practice_id', 'name', 'status', 'doc_type', 'ext', 'date', 'created_at'];
        $date_range = [
            "from_date" => $request->input('from_date') != "" ? $request->input('from_date') . ' 00:00:00' : $request->input('from_date'),
            "to_date" => $request->input('to_date') != "" ? $request->input('to_date') . ' 23:59:59' : $request->input('to_date')
        ];
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
        $ticket = new File();
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
}
