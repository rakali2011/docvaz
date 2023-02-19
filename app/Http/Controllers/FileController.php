<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Practice;
use App\Models\UserPractice;
use App\Models\File;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests\PostPractice;
use Illuminate\Support\Facades\DB;
use Exception;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Eloquent\Collection;

class FileController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
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
        // dd(Auth::user()->isOnline());
        $data['menu'] = "files-management";
        $data['sub_menu'] = "import";
        if (auth()->user()->hasRole('dev')) {
            $practices = Practice::orderBy('id', 'DESC')->get();
        } else {
            $practices = Auth::user()->assinged_practices();
        }
        return view('files_management.import', compact('data', 'practices'));
    }

    public function post_file(Request $req)
    {
        $response = array();
        DB::beginTransaction();
        try {

            $practice = $this->clean_id($req->practice);

            if ($req->hasfile('files')) {
                $files = $req->file('files');
                // dd($files);
                foreach ($files as $key => $value) {
                    $date = date('m-Y');
                    $file_info = $this->upload($value, 'files/' . $date);
                    $file = new File;
                    $file->name = $file_info['file_name'];
                    $file->ext = $file_info['ext'];
                    $file->org_name = $file_info['file_org_name'];
                    $file->size = $file_info['size'];
                    $file->path = $file_info['path'];
                    $file->practice_id = $practice;
                    $file->user_id = Auth::user()->id;
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
        // dd($response);
        return response()->json($response);
    }
}
