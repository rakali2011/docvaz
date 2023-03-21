<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Practice;
use App\Models\File;
use App\Models\FilePractice;
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
        $practices = Auth::user()->assinged_practices()->load("file");
        // $files = new Collection();
        // foreach ($practices as $key => $value) {
        //     $pro = $value->file->all();
        //     foreach ($pro as $key1 => $value1) {
        //         $value1->pname = $value->name;
        //         $files->push($value1);
        //     }
        // }
        return view('files_management.files', compact('data', 'practices'));
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
        $status = json_decode(json_encode(Status::where('company_id', Auth::user()->company->id)->where('type', 'document')->orderBy('name', 'ASC')->pluck("name")), true);
        return view('files_management.update', compact('data', 'practices', 'file', 'status'));
    }
    public function post_file(Request $req)
    {
        $response = array();
        DB::beginTransaction();
        try {
            $req->validate(['status' => 'required']);
            if ($req->hasfile('files')) {
                $files = $req->file('files');
                foreach ($files as $key => $value) {
                    $date = date('m-Y');
                    $file_info = $this->upload($value, 'files/' . $date);
                    $file = new File;
                    $file->user_id = Auth::user()->id;
                    $file->status = $req->status;
                    $file->name = $file_info['file_name'];
                    $file->org_name = $file_info['file_org_name'];
                    $file->path = $file_info['path'];
                    $file->ext = $file_info['ext'];
                    $file->size = $file_info['size'];
                    $file->date = $req->date;
                    $file->doc_type = $req->doc_type;
                    $file->save();
                    $file_id = $file->id;
                    foreach ($req->practice as $index => $practice_id) {
                        $file_practice = new FilePractice;
                        $file_practice->file_id = $file_id;
                        $file_practice->practice_id = $this->clean_id($practice_id);
                        $file_practice->save();
                    }
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
    public function all_files()
    {
    }
}
