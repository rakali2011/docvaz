<?php

namespace App\Http\Controllers;

use App\Models\DocumentType;
use App\Models\User;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use phpDocumentor\Reflection\Types\Null_;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // $role1 = Role::create(['name' => 'bmb-admin','company_id' => 2,'display_name' => 'admin']);
        // $roles = Role::where('company_id',1)->get();
        // dd($roles);
        // Auth::user()->assignRole('bme-admin');
        // exit;

        $data = array();
        $data['menu'] = 'dashboard';
        $data['sub_menu'] = 'dashboard';
        if (auth()->user()->hasRole('dev')) {
            return view('welcome-dev', compact('data'));
        } else {
            // Documents
            $documents = document_types();
            $total = 0;
            foreach ($documents as $key => $document) {
                $document->files_count =  $document->files()->count();
                $total += $document->files_count;
            }
            $documents->total = $total;
            // Document Statistics
            $statuses = statuses("document");
            foreach ($statuses as $key => $status)
                $status->files_count =  $status->files()->count();
            $donut_name = json_decode(json_encode($statuses->pluck('name')), true);
            $donut_value = json_decode(json_encode($statuses->pluck('files_count')), true);
            // Users by status
            $statuses = NULL;
            $statuses = statuses("user");
            foreach ($statuses as $key => $status)
                $status->users_count =  $status->users()->count();
            $users = $statuses;
            // Users by Designations
            $designations = designations();
            foreach ($designations as $key => $designation)
                $designation->users_count =  $designation->users()->count();


            $statuses = Null;
            $statuses = statuses("ticket");
            foreach ($statuses as $key => $status)
                $status->tickets_count =  $status->tickets()->count();


            return view('welcome', compact('data', 'documents', 'donut_name', 'donut_value', 'designations', 'users'));
        }
    }

    public function files()
    {
        return view('files');
    }
    public function upload_files(Request $req)
    {
        dd($req->all());
        $images = $req->images;
        foreach ($images as $key => $value) {
            dd($value);
        }
        $files = $req->file('images');
        // dd($files);
        // loop through the files and save them
        $resp = array();
        foreach ($files as $file) {
            // dd($file->getClientOriginalName());
            $resp[] = $this->upload($file, 'test');
        }
        dd($resp);
    }
}
