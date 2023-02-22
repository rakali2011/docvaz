<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\PostClient;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ClientController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function clients()
    {
        $data['menu'] = "client-management";
        $data['sub_menu'] = "clients";

        if (auth()->user()->hasRole('dev')) {
            $clients = User::where('company_id', '!=', 0)->where('type', 3)->orderBy('id', 'DESC')->get();
        } else {
            $clients = User::where('company_id', '!=', 0)
                ->where('company_id', Auth::user()->company->id)
                ->where('type', 3)
                ->orderBy('firstname', 'ASC')->get();
        }
        return view('user_management.clients', compact('data', 'clients'));
    }
    public function add_client()
    {
        $data['menu'] = "client-management";
        $data['sub_menu'] = "clients";
        return view('user_management.add_client', compact('data'));
    }
    public function edit_client($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "client-management";
        $data['sub_menu'] = "clients";
        $user = User::findorfail($id);
        return view('user_management.add_client', compact('data', 'user'));
    }
    public function post_client(PostClient $req)
    {
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
            } else {
                $company_id = Auth::user()->company->id;
            }
            $user = new User;
            $user->firstname = $req->firstname;
            $user->lastname = $req->lastname;
            $user->email = $req->email;
            $user->company_id = $company_id;
            $user->password = Hash::make($req->password);
            $user->type = 3;
            $user->save();
            DB::commit();
            return redirect()->route('clients')->with('success', "Client Created Successfully");
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->withInput()->with('error', $th->getMessage());
        }
    }
    public function update_client(PostClient $req, $id = '')
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
            $this->validate($req, [
                'email' => 'required|email|unique:users,email,' . $id,
            ]);
            $user = User::findorfail($id);
            $user->firstname = $req->firstname;
            $user->lastname = $req->lastname;
            $user->email = $req->email;
            $user->company_id = $company_id;
            $user->save();
            DB::commit();
            return redirect()->route('clients')->with('success', "User Updated Successfully");
        } catch (\Exception $e) {
            return back()->withInput()->with('error', $e->getMessage());
        }
    }
}
