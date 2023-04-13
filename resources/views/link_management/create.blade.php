@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row">
    <div class="col-12">
      <h2 class="page-title menu-head">Add Link</h2>
      <div class="card shadow mb-4">
        {!! Form::open(array('route' => 'links.store','method'=>'POST')) !!}
        <div class="card-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group mb-3">
                <label for="name">Provider Name</label>
                <input name="name" value="{{ old('name') }}" type="text" id="name" class="form-control @error('name') is-invalid @enderror">
                @error('name')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group mb-3">
                <label for="name">Expired At</label>
                <select name="expired_at" id="expired_at" class="form-control">
                  <?php for ($hour = 1; $hour <= 24; $hour++) : ?>
                    <option value="{{ $hour }}">{{ $hour }}</option>
                  <?php endfor; ?>
                </select>
                @error('name')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-12">
              <input type="submit" value="{{ 'Save' }}" class="btn btn-success float-right">
            </div>
          </div>
        </div>
        {!! Form::close() !!}
      </div>
    </div>
  </div>
</div>

@endsection