@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">Company Settings</h2>
      <div class="card shadow mb-4">
        {!! Form::open(array('route' => 'settings.store','method'=>'POST')) !!}
        <div class="card-body">
          <div class="row">
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="type">Type</label>
                <select name="type" id="type" class="form-control @error('type') is-invalid @enderror" required="required">
                  <option value="">--Please Select--</option>
                  <option value="smtp" {{ @$setting->type=='smtp' ? 'selected' : '' }}>SMTP</option>
                  <option value="wasabi" {{ @$setting->type=='wasabi' ? 'selected' : '' }}>Wasabi</option>
                </select>
                @error('type')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 smtp">
              <div class="form-group mb-3">
                <label for="host">Host</label>
                <input type="text" name="host" id="host" class="form-control @error('host') is-invalid @enderror" value="{{ @$setting->host }}">
                @error('host')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 smtp">
              <div class="form-group mb-3">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" class="form-control @error('username') is-invalid @enderror" value="{{ @$setting->username }}">
                @error('username')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 smtp">
              <div class="form-group mb-3">
                <label for="password">Password</label>
                <input type="text" name="password" id="password" class="form-control @error('password') is-invalid @enderror" value="{{ @$setting->password }}">
                @error('password')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 smtp">
              <div class="form-group mb-3">
                <label for="port">Port</label>
                <input type="text" name="port" id="port" class="form-control @error('port') is-invalid @enderror" value="{{ @$setting->port }}">
                @error('port')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 smtp">
              <div class="form-group mb-3">
                <label for="enc_type">Enc Type</label>
                <input type="text" name="enc_type" id="enc_type" class="form-control @error('enc_type') is-invalid @enderror" value="{{ @$setting->enc_type }}">
                @error('enc_type')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 wasabi">
              <div class="form-group mb-3">
                <label for="region">Region</label>
                <input type="text" name="region" id="region" class="form-control @error('region') is-invalid @enderror" value="{{ @$setting->region }}">
                @error('region')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 wasabi">
              <div class="form-group mb-3">
                <label for="version">Version</label>
                <input type="text" name="version" id="version" class="form-control @error('version') is-invalid @enderror" value="{{ @$setting->version }}">
                @error('version')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 wasabi">
              <div class="form-group mb-3">
                <label for="endpoint">Endpoint</label>
                <input type="text" name="endpoint" id="endpoint" class="form-control @error('endpoint') is-invalid @enderror" value="{{ @$setting->endpoint }}">
                @error('endpoint')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 wasabi">
              <div class="form-group mb-3">
                <label for="wkey">Key</label>
                <input type="text" name="wkey" id="wkey" class="form-control @error('wkey') is-invalid @enderror" value="{{ @$setting->wkey }}">
                @error('wkey')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-4 wasabi">
              <div class="form-group mb-3">
                <label for="secret_key">Secret Key</label>
                <input type="text" name="secret_key" id="secret_key" class="form-control @error('secret_key') is-invalid @enderror" value="{{ @$setting->secret_key }}">
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
  </div>
</div>
@push('scripts')
<script>
  $(document).ready(function() {
    $('.smtp').hide();
    $('.wasabi').hide();
  });
  $('#type').change(function(e) {
    type = $(this).val();
    $('.smtp').hide();
    $('.wasabi').hide();
    if (type == "smtp") {
      $('.smtp').show();
    } else if (type == "wasabi") {
      $('.wasabi').show();
    }
    $.ajax({
      type: "POST",
      url: "{{ route('get_setting') }}",
      data: {
        _token: "{{csrf_token()}}",
        type: type,
      },
      cache: false,
      dataType: "JSON",
      success: function(response) {
        console.log(response);
        $('#host').val(response.content.host);
        $('#username').val(response.content.username);
        $('#password').val(response.content.password);
        $('#port').val(response.content.port);
        $('#enc_type').val(response.content.enc_type);
        $('#region').val(response.content.region);
        $('#version').val(response.content.version);
        $('#endpoint').val(response.content.endpoint);
        $('#wkey').val(response.content.wkey);
        $('#secret_key').val(response.content.secret_key);
      }
    });
  });

  function flag(element) {

    if (id != "") {

    } else {
      return false;
    }
  }
</script>
@endpush
@endsection