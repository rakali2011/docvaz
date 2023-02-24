@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">Change Password</h2>
      <div class="card shadow mb-4">
        <form action="{{ route('update_password')  }}" method="POST">
          @csrf
          <div class="card-body">
            <div class="row">
              <div class="col-md-4">
                <div class="form-group mb-3">
                  <label for="current_password">Current Password</label>
                  <input type="password" name="current_password" id="current_password" class="form-control @error('current_password') is-invalid @enderror" value="{{ old('current_password') }}">
                  @error('current_password')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group mb-3">
                  <label for="new_password">New Password</label>
                  <input type="password" name="new_password" id="new_password" class="form-control @error('new_password') is-invalid @enderror" value="{{ old('new_password') }}">
                  @error('new_password')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group mb-3">
                  <label for="new_confirm_password">New Confirm Password</label>
                  <input type="password" name="new_confirm_password" id="new_confirm_password" class="form-control @error('new_confirm_password') is-invalid @enderror" value="{{ old('new_confirm_password') }}">
                  @error('new_confirm_password')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-12">
                <input type="submit" value="{{ 'Update' }}" class="btn btn-success float-right">
              </div>
            </div>
          </div>
        </form>
      </div> <!-- / .card -->

    </div> <!-- .col-12 -->
  </div> <!-- .row -->
</div>

@endsection