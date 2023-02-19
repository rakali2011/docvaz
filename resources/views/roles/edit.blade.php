@extends('includes.main')
@section('content')
<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-left">
            <h2>Edit Role</h2>
        </div>
        <div class="pull-right">
            <a class="btn btn-primary" href="{{ route('roles.index') }}"> Back</a>
        </div>
    </div>
</div>
@if (count($errors) > 0)
<div class="alert alert-danger">
    <strong>Whoops!</strong> There were some problems with your input.<br><br>
    <ul>
        @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
        @endforeach
    </ul>
</div>
@endif
{!! Form::model($role, ['method' => 'PATCH','route' => ['roles.update', $role->id]]) !!}
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Name:</strong>
            {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
        </div>
    </div>
    <style>
        .form-group {
            margin-top: 15px;
        }
    </style>
    <div class="col-xs-12 col-sm-12 col-md-12 text-center" style="margin-bottom:20px;">
        <strong class="btn-primary" style="padding: 5px;">Permissions:</strong>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">Activity</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="activity")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">Application</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="application")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">Document</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="document")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">Payer</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="payer")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">Practice</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="practice")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">Provider</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="provider")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-md-12"></div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">Report</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="reports")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">Role</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="role")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">Team</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="team")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-success" style="padding: 5px;">User</strong>
        <div class="form-group">
            @foreach($permission as $value)
            @if($value->type=="user")
            <div class="form-check form-check-inline">
                {{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'form-check-input','id'=>$value->name)) }}
                <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
            </div>
            @endif
            @endforeach
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12 text-center">
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</div>
{!! Form::close() !!}
@endsection