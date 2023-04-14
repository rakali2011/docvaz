<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission:update company setting|delete company setting|update company setting|view company setting', ['only' => ['index', 'store']]);
        $this->middleware('permission:update company setting', ['only' => ['create', 'store']]);
        $this->middleware('permission:create company setting', ['only' => ['edit', 'update']]);
        $this->middleware('permission:delete company setting', ['only' => ['destroy']]);
    }
    public function index()
    {
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['menu'] = "";
        $data['sub_menu'] = "";
        return view('company_management.create', compact('data'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $setting["company_id"] = Auth::user()->company_id;
        $setting["type"] = $request->type;
        if ($request->type == "smtp") {
            $setting["host"] = $request->host;
            $setting["username"] = $request->username;
            $setting["password"] = $request->password;
            $setting["port"] = $request->port;
            $setting["enc_type"] = $request->enc_type;
        } elseif ($request->type == "wasabi") {
            $setting["region"] = $request->region;
            $setting["version"] = $request->version;
            $setting["endpoint"] = $request->endpoint;
            $setting["wkey"] = $request->wkey;
            $setting["secret_key"] = $request->secret_key;
        }
        if (Setting::where("company_id", Auth::user()->company_id)->where('type', $setting["type"])->count())
            DB::table('settings')->where("company_id", Auth::user()->company_id)->where('type', $setting["type"])->update($setting);
        else
            Setting::create($setting);
        return redirect()->route('settings.create')->with('success', "Setting Updated Successfully");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function show(Setting $setting)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function edit(Setting $setting)
    {
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Setting $setting)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function destroy(Setting $setting)
    {
        //
    }
    public function getSetting(Request $request)
    {
        $response = array();
        try {
            $setting = Setting::where("company_id", Auth::user()->company_id)->where('type', $request->type)->get();
            $setting = isset($setting[0]) ? $setting[0] : $setting;
            $response['success'] = 1;
            $response['content'] = $setting;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = "Something Went Wrong Try Again";
        }
        return response()->json($response);
    }
}
