<?php

namespace App\Http\Controllers;;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
        $user_ids = get_departments_users();
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
                $document->files_count =  $document->files()->whereIn('files.user_id', $user_ids)->count();
                $total += $document->files_count;
            }
            $documents->total = $total;
            // Document Status
            $statuses = statuses("document");
            foreach ($statuses as $key => $status)
                $status->files_count =  $status->files()->whereIn('files.user_id', $user_ids)->count();
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
            $departments_ids = departments()->pluck('id');
            $practices_ids = get_assigned_practices();
            $statuses = Null;
            $statuses = statuses("ticket");
            foreach ($statuses as $key => $status)
                $status->tickets_count =  $status->tickets()->whereIn('tickets.department_id', $departments_ids)->whereIn('tickets.target_id', $practices_ids)->count();
            $tickets_by_status = $statuses;
            $ticket_chart['name'] = json_decode(json_encode($tickets_by_status->pluck('name')), true);
            $ticket_chart['count'] = json_decode(json_encode($statuses->pluck('tickets_count')), true);
            foreach (ticket_priorities() as $key => $priority)
                $tickets_by_priority[$priority[0]] = DB::table('tickets')->where('priority', $priority)->where('company_id', Auth::user()->company_id)->whereIn('tickets.department_id', $departments_ids)->whereIn('tickets.target_id', $practices_ids)->selectRaw('COUNT(priority) AS priority')->pluck('priority')[0];
            $departments = departments();
            foreach ($departments as $key => $department) {
                $department->client =  $department->tickets()->where('company_id', Auth::user()->company_id)->where('creator', 'Client')->whereIn('tickets.department_id', $departments_ids)->whereIn('tickets.target_id', $practices_ids)->count();
                $department->company =  $department->tickets()->where('company_id', Auth::user()->company_id)->where('creator', Auth::user()->company->name)->whereIn('tickets.department_id', $departments_ids)->whereIn('tickets.target_id', $practices_ids)->count();
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
