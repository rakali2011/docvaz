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
        $teams = Auth::user()->assinged_teams();
        $files = new Collection();
        foreach ($practices as $key => $value) {
            $pro = $value->file->all();
            foreach ($pro as $key1 => $value1) {
                $value1->pname = $value->name;
                $files->push($value1);
            }
        }
        return view('files_management.files', compact('data', 'files', 'practices', 'teams'));
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
        // $id = $this->clean_id($id);
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
        $columns = ['org_name', 'practice_id', 'status', 'doc_type', 'ext', 'date', 'created_at'];
        $date_range = [
            "date_from" => $request->input('date_from_filter') != "" ? $request->input('date_from_filter') . ' 00:00:00' : $request->input('date_from_filter'),
            "date_to" => $request->input('date_to_filter') != "" ? $request->input('date_to_filter') . ' 23:59:59' : date("Y-m-d H:i:s")
        ];
        $filter = array(
            "team" => $request->input('team_filter'),
            "practice_id" => $request->input('practice_filter'),
            "status" => $request->input('status_filter'),
            "doc_type" => $request->input('doc_type_filter')
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = !empty($request->input('order.0.column')) ? $request->input('order.0.column') : 0;
        $order = $columns[$order];
        $dir = !empty($request->input('order.0.dir')) ? strtoupper($request->input('order.0.dir')) : "DESC";
        $search = $request->input('search.value');
        $file = new File();
        $totalData = $file->countTotal();
        $totalFiltered = $file->countFiltered($date_range, $filter, $search, $start, $limit, $order, $dir);
        $files = $file->getData($date_range, $filter, $search, $start, $limit, $order, $dir);
        $data = array();
        if (!empty($files)) {
            foreach ($files as $file) {
                $edit = '';
                $delete = '';
                if (auth()->user()->can('update file'))
                    $edit = '<a class="dropdown-item" href="' . route('edit_file', ['id' => $file->id]) . '">Edit</a>';
                if (auth()->user()->can('delete file')) {
                    $delete = '<form method="POST" action="' . route('delete_file', $file->id) . '" accept-charset="UTF-8" style="display:inline"><input name="_method" type="hidden" value="DELETE"><input name="_token" type="hidden" value="' . csrf_token() . '"><input class="dropdown-item" type="submit" value="Delete"></form>';
                }
                $practice = Practice::findorfail($file->practice_id);
                $nestedData['practice_id'] = $practice->name;
                $nestedData['org_name'] = $file->org_name;
                $nestedData['status'] = $file->status;
                $nestedData['doc_type'] = $file->doc_type;
                $nestedData['ext'] = $file->ext;
                $nestedData['date'] = $file->date;
                $nestedData['created_at'] = $file->created_at;
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
