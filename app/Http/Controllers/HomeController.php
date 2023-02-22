<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
        // $user = User::find(Auth::user()->id);
        // \DB::enableQueryLog();
        // $p=$user->projects;
        // dd(\DB::getQueryLog());
        // dd(Auth::user()->type);
        return view('welcome', compact('data'));
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
