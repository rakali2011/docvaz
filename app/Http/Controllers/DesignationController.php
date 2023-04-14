<?php

namespace App\Http\Controllers;

use App\Models\Designation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class DesignationController extends Controller
{
    function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission:add designation|delete designation|update designation|view designation', ['only' => ['index', 'store']]);
        $this->middleware('permission:add designation', ['only' => ['create', 'store']]);
        $this->middleware('permission:update designation', ['only' => ['edit', 'update']]);
        $this->middleware('permission:delete designation', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "designations";
        if (auth()->user()->hasRole('dev')) {
            $designations = Designation::where('company_id', '!=', 0)->orderBy('rank', 'ASC')->get();
        } else {
            $designations = Designation::where('company_id', Auth::user()->company->id)->orderBy('rank', 'ASC')->get();
        }
        return view('designations_management.index', compact('data', 'designations'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "designations";
        return view('designations_management.create', compact('data'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => ['required', 'string', Rule::unique('designations')->where(function ($query) use ($request) {
                return $query->where('company_id', Auth::user()->company->id);
            })],
        ]);
        $data["name"] = $request->name;
        if (auth()->user()->hasRole('dev'))
            $company_id = $request->company;
        else
            $company_id = Auth::user()->company->id;
        $data["company_id"] = $company_id;
        Designation::create($data);
        return redirect()->route('designations.index')->with('success', "Designation Created Successfully");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Designation  $designation
     * @return \Illuminate\Http\Response
     */
    public function show(Designation $designation)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Designation  $designation
     * @return \Illuminate\Http\Response
     */
    public function edit(Designation $designation)
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "designations";
        return view('designations_management.edit', compact('data', 'designation'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Designation  $designation
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Designation $designation)
    {
        $input["name"] = $request->name;
        $designation->update($input);
        return redirect()->route('designations.index')->with('success', "Designation Updated Successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Designation  $designation
     * @return \Illuminate\Http\Response
     */
    public function destroy(Designation $designation)
    {
        $designation->delete();
        return redirect()->route('designations.index')->with('success', 'Designation Deleted Successfully');
    }
    public function updateRank(Request $request)
    {
        $ids = $request->ids;
        DB::beginTransaction();
        // do all your updates here
        foreach ($ids as $key => $id) {
            DB::table('designations')->where('id', '=', $id)->update(['rank' => $key + 1]);
        }
        // when done commit
        DB::commit();
    }
}
