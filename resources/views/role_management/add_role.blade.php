@extends('includes.main')
@section('content')
<style>
  .form-group {
    margin-top: 15px;
  }

  .form-check.form-check-inline {
    display: block;
  }
</style>
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">Add Role</h2>
      <div class="card shadow mb-4">
        <form action="{{ route('post_role') }}" method="POST" enctype="multipart/form-data">
          @csrf
          <div class="card-body">
            <div class="row">
              @role('dev')
              <div class="col-md-6">
                <div class="form-group mb-3">
                  <label for="type">Company</label>
                  <select class="form-control @error('company') is-invalid @enderror" name="company" id="company">

                    @foreach (companies() as $item)
                    <option value="{{ $item->id }}">{{ $item->name }}</option>
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
              <div class="col-md-6">
                <div class="form-group mb-3">
                  <label for="name">Name</label>
                  <input name="name" value="{{ old('name') }}" required type="text" id="name" class="form-control @error('name') is-invalid @enderror">
                  @error('name')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-xs-12 col-sm-12 col-md-12 text-center" style="margin-bottom:20px;">
                <strong class="btn-primary" style="padding: 5px;">Permissions:</strong>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Activity</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="activity")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Application</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="application")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Client</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="client")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Department</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="department")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Document</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="document")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Payer</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="payer")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Practice</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="practice")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Provider</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="provider")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Report</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="reports")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Role</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="role")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Team</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="team")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">Ticket</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="ticket")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>
              <div class="col-xs-6 col-sm-6 col-md-3">
                <strong class="btn-success" style="padding: 5px;">User</strong>
                <div class="form-group">
                  @foreach($permissions as $value)
                  @if($value->type=="user")
                  <div class="form-check form-check-inline">
                    {{ Form::checkbox('permission[]', $value->id, false, array('class' => 'form-check-input','id'=>$value->name)) }}
                    <label for="{{ $value->name }}" class="form-check-label">{{ ucwords(str_replace("-"," ",$value->name)) }}</label>
                  </div>
                  @endif
                  @endforeach
                </div>
              </div>



              <div class="col-12">
                <input type="submit" value="{{ 'Save' }}" class="btn btn-success float-right">
              </div>
            </div>
          </div>
        </form>
      </div> <!-- / .card -->

    </div> <!-- .col-12 -->
  </div> <!-- .row -->
</div>

@endsection