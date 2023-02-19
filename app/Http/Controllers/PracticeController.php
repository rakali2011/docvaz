<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Practice;
use App\Models\UserPractice;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests\PostPractice;
use Illuminate\Support\Facades\DB;
use Exception;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;

class PracticeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function practices()
    {
        $data['menu'] = "client-management";
        $data['sub_menu'] = "practices";

        if (auth()->user()->hasRole('dev')) {
            $practices = Practice::orderBy('id', 'DESC')->get();
        } else {
            $practices = Practice::where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        }

        return view('practice_management.practices', compact('data', 'practices'));
    }

    public function add_practice()
    {
        $data['menu'] = "client-management";
        $data['sub_menu'] = "practices";
        return view('practice_management.add_practice', compact('data'));
    }
    public function edit_practice($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "client-management";
        $data['sub_menu'] = "practices";
        $practice = Practice::findorfail($id);
        return view('practice_management.add_practice', compact('data', 'practice'));
    }

    public function post_practice(PostPractice $req)
    {
        // dd($req->all());
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
            } else {
                $company_id = Auth::user()->company->id;
            }

            $practice = new Practice;
            $practice->name = $req->name;

            $practice->company_id = $company_id;

            $practice->save();
            DB::commit();
            return redirect()->route('practices')->with('success', "Practice Created Successfully");
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function update_practice(PostPractice $req, $id = "")
    {
        if ($id) {
            $id = $this->clean_id($id);
        }
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
            } else {
                $company_id = Auth::user()->company->id;
            }
            $practice = Practice::findorfail($id);
            $practice->name = $req->name;
            $practice->company_id = $company_id;
            $practice->save();
            DB::commit();
            return redirect()->route('practices')->with('success', "Practice Updated Successfully");
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function get_practices(Request $req)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($req->ref);
            $user = User::find($user_id);
            if (auth()->user()->can('assign practice user')) {
                // if (auth()->user()->hasRole('dev') || auth()->user()->hasRole('super admin') || auth()->user()->hasRole('admin')) {
                $practices = Practice::where('status', 1)->where('company_id', $user->company_id)->orderBy('name', 'ASC')->get();
            } else {
                $practices = Auth::user()->assinged_practices();
            }
            $assigned_practices = $user->assinged_practices_array();

            $response['success'] = 1;
            $response['role'] = auth()->user()->getRoleNames();

            $select = $this->multiselect($practices, $assigned_practices, 'user_practices[]', 'User Practices');
            $response['content'] = $select;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = "Something Went Wrong Try Again";

            // $response['message'] = $th->getMessage();
            //throw $th;
        }
        return response()->json($response);
    }
    public function update_user_practices(Request $req)
    {
        // dd($req->user_practices);
        $response = array();
        DB::beginTransaction();
        try {
            $user_id = $this->clean_id($req->ref);
            $practices = $req->user_practices;
            $clean_ids = array();
            if ($practices) {
                foreach ($practices as $key => $value) {
                    $p_id = $this->clean_id($value);
                    array_push($clean_ids, $p_id);
                    $check_exist = UserPractice::where('user_id', $user_id)
                        ->where('practice_id', $p_id)->first();
                    if (!$check_exist) {
                        $user_practice = new UserPractice();
                        $user_practice->user_id = $user_id;
                        $user_practice->practice_id = $p_id;
                        $user_practice->type = 1;
                        $user_practice->user_type = 1;
                        $user_practice->save();
                    }
                }
            }


            $del_assignmennt = UserPractice::whereNotIn('practice_id', $clean_ids)->where('user_id', $user_id)->delete();
            DB::commit();
            $response['success'] = 1;
            $response['message'] = "Updated Successfully";
        } catch (\Throwable $th) {
            DB::rollback();
            $response['success'] = 0;
            // $response['message'] = "Something Went Wrong Try Again";
            $response['message'] = $th->getMessage();
        }

        return response()->json($response);
    }
}
