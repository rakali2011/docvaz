<?php

namespace App\Http\Controllers;

use App\Models\DocumentType;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DocumentTypeController extends Controller
{
    function __construct()
    {
        $this->middleware('permission:add document type|delete document type|update document type|view document type', ['only' => ['index', 'store']]);
        $this->middleware('permission:add document type', ['only' => ['create', 'store']]);
        $this->middleware('permission:update document type', ['only' => ['edit', 'update']]);
        $this->middleware('permission:delete document type', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "document_types";
        if (auth()->user()->hasRole('dev')) {
            $document_types = DocumentType::where('company_id', '!=', 0)->orderBy('id', 'DESC')->get();
        } else {
            $document_types = DocumentType::where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        }
        return view('document_types_management.index', compact('data', 'document_types'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "document_types";
        return view('document_types_management.create', compact('data'));
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
            'name' => 'required'
        ]);
        $data["name"] = $request->name;
        if (auth()->user()->hasRole('dev'))
            $company_id = $request->company;
        else
            $company_id = Auth::user()->company->id;
        $data["company_id"] = $company_id;
        DocumentType::create($data);
        return redirect()->route('document_types.index')->with('success', "Document Type Created Successfully");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DocumentType  $documentType
     * @return \Illuminate\Http\Response
     */
    public function show(DocumentType $documentType)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\DocumentType  $documentType
     * @return \Illuminate\Http\Response
     */
    public function edit(DocumentType $documentType)
    {
        $data['menu'] = "general-management";
        $data['sub_menu'] = "document_types";
        return view('document_types_management.edit', compact('data', 'documentType'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DocumentType  $documentType
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DocumentType $documentType)
    {
        $input["name"] = $request->name;
        $documentType->update($input);
        return redirect()->route('document_types.index')->with('success', "Document Type Updated Successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DocumentType  $documentType
     * @return \Illuminate\Http\Response
     */
    public function destroy(DocumentType $documentType)
    {
        $documentType->delete();
        return redirect()->route('document_types.index')->with('success', 'Document Type Deleted Successfully');
    }
    public function get_document_types(Request $request)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($request->ref);
            $user = User::find($user_id);
            if (auth()->user()->can('assign department user')) {
                $document_types = DocumentType::where('company_id', $user->company_id)->orderBy('name', 'ASC')->get();
            } else {
                $document_types = Auth::user()->assinged_document_types();
            }
            $assigned_document_types = $user->assinged_document_types_array();
            $response['success'] = 1;
            $select = $this->multiselect($document_types, $assigned_document_types, 'user_document_types[]', 'User Documents');
            $response['content'] = $select;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = $th->getMessage();
        }
        return response()->json($response);
    }
}
