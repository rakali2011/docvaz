@extends('includes.main')
@section('content')
<style>
    .form-group {
        margin-top: 15px;
    }

    .form-check.form-check-inline {
        display: block;
    }

    [name="check-all"] {
        margin-left: 5px;
    }

    strong.btn-success {
        padding: 5px 5px 0 5px;
    }

    .form-check-label {
        margin-bottom: 0;
        font-size: 13px;
    }

    strong.btn-primary {
        padding: 0px 0px 0 5px;
        background-color: #e17e1b !important;
    }

    body {
        background-color: #fbfbfb;
    }

    h3 {
        font-weight: 600 !important;
        font-family: poppins, helvetica neue, Arial, sans-serif;
    }

    .card-body {
        margin: 0px;
        padding: 20px 0px 10px 5px;
    }

    .header_bg {
        background-color: #ff8000 !important;
    }

    .card-header {
        padding: 0.5rem 0.5rem 0.3rem 0.5rem;
    }

    .card-header>strong>label {
        color: #FFFFFF;
        font-size: 15px;
        font-weight: 700;
        margin: 0px !important;
        padding: 0px !important;

    }

    input[type="radio"],
    input[type="checkbox"] {
        float: right;
        margin: 0px !important;
        padding: 0px !important;
    }
</style>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12">
            <h2 class="page-title menu-head">{{(@$role) ? 'Update Role' : 'Add Role' }}</h2>
            <div class="card shadow mb-4">
                <form action="{{(@$role) ? route('update_role', ['id' => Crypt::encrypt($role->id)]) : route('post_role')  }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="card-body p-2 m-1">
                        <div class="row">
                            @role('dev')
                            <div class="col-md-4">
                                <div class="form-group mb-3">
                                    <label for="type">Company</label>
                                    <select class="form-control @error('company') is-invalid @enderror" name="company" id="company">
                                        @foreach (companies() as $item)
                                        <option value="{{ $item->id }}" {{(@$role) ? (@$role->company_id==$item->id ? 'selected' : '') : '' }}>{{ $item->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('company')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            @endrole
                            <div class="col-md-4">
                                <div class="form-group mb-3">
                                    <label for="name">Name</label>
                                    <input name="name" value="{{ (@$role)?@$role->display_name:old('name') }}" required type="text" id="name" class="form-control @error('name') is-invalid @enderror">
                                    @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 text-center p-3 m-2">
                                <strong class="p-2" style="background-color: #80d0dd !important;">Permissions:</strong>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="business">Business Info</label><input type="checkbox" name="check-all" id="business" {{ @$check_all["business"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="business")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input business','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label m-0 p-0">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="ticket">Ticket</label><input type="checkbox" name="check-all" id="ticket" {{ @$check_all["ticket"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="ticket")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input ticket','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="client">Client</label><input type="checkbox" name="check-all" id="client" {{ @$check_all["client"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="client")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input client','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="company--">Company</label><input type="checkbox" name="check-all" id="company--" {{ @$check_all["company"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="company")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input company--','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="user">User</label><input type="checkbox" name="check-all" id="user" {{ @$check_all["user"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="user")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input user','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="file">File</label><input type="checkbox" name="check-all" id="file" {{ @$check_all["file"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="file")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input file','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="role">Role</label><input type="checkbox" name="check-all" id="role" {{ @$check_all["role"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="role")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input role','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="team">Team</label><input type="checkbox" name="check-all" id="team" {{ @$check_all["team"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="team")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input team','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="department">Department</label><input type="checkbox" name="check-all" id="department" {{ @$check_all["department"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="department")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input department','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="designation">Designation</label><input type="checkbox" name="check-all" id="designation" {{ @$check_all["designation"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="designation")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input designation','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="document_type">Document Type</label><input type="checkbox" name="check-all" id="document_type" {{ @$check_all["document_type"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="document_type")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input document_type','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="status">Status</label><input type="checkbox" name="check-all" id="status" {{ @$check_all["status"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="status")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input status','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="practice">Practice</label><input type="checkbox" name="check-all" id="practice" {{ @$check_all["practice"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="practice")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input practice','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="reports">Reports</label><input type="checkbox" name="check-all" id="reports" {{ @$check_all["reports"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="reports")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input reports','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="notification">Notification</label><input type="checkbox" name="check-all" id="notification" {{ @$check_all["notification"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="notification")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input notification','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ $value->display_name }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="setting">Setting</label><input type="checkbox" name="check-all" id="setting" {{ @$check_all["setting"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="setting")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input setting','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 mb-1">
                                <div class="card">
                                    <div class="card-header header_bg">
                                        <strong><label for="activity">Activity</label><input type="checkbox" name="check-all" id="activity" {{ @$check_all["activity"] }}></strong>
                                    </div>
                                    <div class="card-body">
                                        @foreach($permissions as $value)
                                        @if($value->type=="activity")
                                        <div class="form-check form-check-inline">
                                            {{ Form::checkbox('permission[]', $value->id, in_array($value->id, @$assign_permissions) ? true : false, array('class' => 'form-check-input activity','id'=>$value->name)) }}
                                            <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->display_name)) }}</label>
                                        </div>
                                        @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <input type="submit" value="{{ (@$role) ? 'Update' : 'Save' }}" class="btn btn-success float-right">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection