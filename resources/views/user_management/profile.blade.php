@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">Profile</h2>
      <div class="card shadow mb-4">
        <form action="{{ route('update_profile') }}" method="POST">
          @csrf
          <div class="card-body">
            <div class="row">
              <div class="col-md-4">
                <div class="form-group mb-3">
                  <label for="firstname">First Name</label>
                  <input name="firstname" required type="text" id="firstname" class="form-control @error('firstname') is-invalid @enderror" value="{{ (@$user)?@$user->firstname:old('firstname') }}">
                  @error('firstname')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group mb-3">
                  <label for="lastname">Last Name</label>
                  <input name="lastname" required type="text" id="lastname" class="form-control @error('lastname') is-invalid @enderror" value="{{ (@$user)?@$user->lastname:old('lastname') }}">
                  @error('lastname')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group mb-3">
                  <label for="email">Email</label>
                  <input name="email" required type="email" id="email" disabled="disabled" class="form-control @error('email') is-invalid @enderror" value="{{ (@$user)?@$user->email:old('email') }}">
                  @error('email')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-12">
                <input type="submit" value="{{ (@$user)?'Update':'Save' }}" class="btn btn-success float-right">
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

@endsection