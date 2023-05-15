@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">SMTP</h2>
      <div class="card shadow mb-4">
        {!! Form::open(array('route' => 'settings.store','method'=>'POST')) !!}
        <div class="card-body">
          <div class="row">
            <input type="hidden" name="type" value="smtp" class="form-control">
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="host">Host</label>
                <input type="text" name="host" id="host" class="form-control @error('host') is-invalid @enderror" value="{{ old('host', @$smtp->host) }}">
                @error('host')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" class="form-control @error('username') is-invalid @enderror" value="{{ old('username', @$smtp->username) }}">
                @error('username')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="password">Password</label>
                <input type="text" name="password" id="password" class="form-control @error('password') is-invalid @enderror" value="{{ old('password', @$smtp->password) }}">
                @error('password')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="port">Port</label>
                <input type="text" name="port" id="port" class="form-control @error('port') is-invalid @enderror" value="{{ old('port', @$smtp->port) }}">
                @error('port')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="enc_type">Enc Type</label>
                <input type="text" name="enc_type" id="enc_type" class="form-control @error('enc_type') is-invalid @enderror" value="{{ old('enc_type', @$smtp->enc_type) }}">
                @error('enc_type')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-12">
              <input type="submit" value="Update" class="btn btn-success float-right">
            </div>
          </div>
        </div>
        {!! Form::close() !!}
      </div>
    </div>
    <div class="col-12">
      <h2 class="page-title menu-head">Wasabi</h2>
      <div class="card shadow mb-4">
        {!! Form::open(array('route' => 'settings.store','method'=>'POST')) !!}
        <div class="card-body">
          <div class="row">
            <input type="hidden" name="type" value="wasabi" class="form-control">
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="region">Region</label>
                <input type="text" name="region" id="region" class="form-control @error('region') is-invalid @enderror" value="{{ old('region', @$wasabi->region) }}">
                @error('region')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="version">Version</label>
                <input type="text" name="version" id="version" class="form-control @error('version') is-invalid @enderror" value="{{ old('version', @$wasabi->version) }}">
                @error('version')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="endpoint">Endpoint</label>
                <input type="text" name="endpoint" id="endpoint" class="form-control @error('endpoint') is-invalid @enderror" value="{{ old('endpoint', @$wasabi->endpoint) }}">
                @error('endpoint')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="wkey">Key</label>
                <input type="text" name="wkey" id="wkey" class="form-control @error('wkey') is-invalid @enderror" value="{{ old('wkey', @$wasabi->wkey) }}">
                @error('wkey')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="secret_key">Secret Key</label>
                <input type="text" name="secret_key" id="secret_key" class="form-control @error('secret_key') is-invalid @enderror" value="{{ old('secret_key', @$wasabi->secret_key) }}">
                @error('secret_key')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-12">
              <input type="submit" value="Update" class="btn btn-success float-right">
            </div>
          </div>
        </div>
        {!! Form::close() !!}
      </div>
    </div>
    <div class="col-12">
      <h2 class="page-title menu-head">Tickets</h2>
      <div class="card shadow mb-4">
        {!! Form::open(array('route' => 'settings.store','method'=>'POST')) !!}
        <div class="card-body">
          <div class="row">
            <input type="hidden" name="type" value="ticket" class="form-control">
            <div class="col-md-4">
              <div class="form-group">
                <label class="col-form-label d-block" for="ticket_review">Required Ticket Review</label>
                <div class="form-check form-check-inline">
                  <input type="checkbox" name="ticket_review" id="ticket_review" value="1" class="form-check-input" {{  @($ticket->ticket_review == 1 ? ' checked' : '') }}>
                  <label for="ticket_review" class="form-check-label"></label>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <label class="col-form-label d-block" for="ticke_approval">Required Ticket Approval</label>
                <div class="form-check form-check-inline">
                  <input type="checkbox" name="ticke_approval" id="ticke_approval" value="1" class="form-check-input" {{  (@$ticket->ticke_approval == 1 ? ' checked' : '') }}>
                  <label for="ticke_approval" class="form-check-label"></label>
                </div>
              </div>
            </div>
            <div class="col-12">
              <input type="submit" value="Update" class="btn btn-success float-right">
            </div>
          </div>
        </div>
        {!! Form::close() !!}
      </div>
    </div>
  </div>
</div>
@endsection