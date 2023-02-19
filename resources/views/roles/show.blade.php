@extends('includes.main')
@section('content')
<style>
    .form-group {
        margin-top: 15px;
    }
</style>
<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-left">
            <h2> Show Role</h2>
        </div>
        <div class="pull-right">
            <a class="btn btn-primary" href="{{ route('roles.index') }}"> Back</a>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Name:</strong>
            {{ $role->name }}
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12 text-center" style="margin-bottom:20px;">
        <strong class="btn-primary" style="padding: 5px;">Permissions:</strong>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">Activity</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="activity")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">Application</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="application")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">Document</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="document")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">Payer</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="payer")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">Practice</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="practice")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">Provider</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="provider")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
    <div class="col-md-12"></div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">Report</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="reports")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">Role</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="role")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">Team</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="team")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-2">
        <strong class="btn-primary" style="padding: 5px;">User</strong>
        <div class="form-group">
            @if(!empty($rolePermissions))
            @foreach($rolePermissions as $value)
            @if($value->type=="user")
            <label class="label label-success">{{ ucwords(str_replace("-"," ",$value->name)) }}<br></label>
            @endif
            @endforeach
            @endif
        </div>
    </div>
</div>
@endsection