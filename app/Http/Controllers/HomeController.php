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
use Illuminate\Support\Facades\DB;

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
            // Document Status
            $statuses = statuses("document");
            foreach ($statuses as $key => $status)
                $status->files_count =  $status->files()->count();
            $documents->name = json_decode(json_encode($statuses->pluck('name')), true);
            $documents->count = json_decode(json_encode($statuses->pluck('files_count')), true);
            // Users by status
            $user_ids = get_users()->pluck('id');
            $statuses = NULL;
            $statuses = statuses("user");
            foreach ($statuses as $key => $status)
                $status->users_count =  $status->users()->whereIn('users.id', $user_ids)->count();
            $users = $statuses;
            // Users by Designations
            $designations = designations();
            foreach ($designations as $key => $designation)
                $designation->users_count =  $designation->users()->whereIn('users.id', $user_ids)->count();
            // Tickets by status
            $statuses = Null;
            $statuses = statuses("ticket");
            foreach ($statuses as $key => $status)
                $status->tickets_count =  $status->tickets()->count();
            $tickets_by_status = $statuses;
            $ticket_chart['name'] = json_decode(json_encode($tickets_by_status->pluck('name')), true);
            $ticket_chart['count'] = json_decode(json_encode($statuses->pluck('tickets_count')), true);
            foreach (ticket_priorities() as $key => $priority)
                $tickets_by_priority[$priority[0]] = DB::table('tickets')->where('priority', $priority)->where('company_id', Auth::user()->company_id)->selectRaw('COUNT(priority) AS priority')->pluck('priority')[0];
            $departments = departments();
            foreach ($departments as $key => $department) {
                $department->external =  $department->tickets()->where('company_id', Auth::user()->company_id)->where('is_external', 1)->count();
                $department->internal =  $department->tickets()->where('company_id', Auth::user()->company_id)->where('is_external', 0)->count();
            }
            $departments->company_name = Auth::user()->company->name;
            return view('welcome', compact('data', 'documents', 'designations', 'users', 'tickets_by_status', 'ticket_chart', 'tickets_by_priority', 'departments'));
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
