@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">{{(@$user) ? 'Update User' : 'Create New User' }}</h2>
      <div class="card shadow mb-4">
        <form action="{{(@$user) ? route('update_user', ['id' => Crypt::encrypt(@$user->id)]) : route('post_user')  }}" method="POST">
          @csrf
          <div class="card-body">
            <div class="row">
              @role('dev')
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="company">Company</label>
                  <select class="form-control @error('company') is-invalid @enderror" name="company" id="company">
                    @foreach (companies() as $company)
                    <option value="{{ $company->id }}" {{ old('company', @$user->company_id) == $company->id ? 'selected=selected' : '' }}>{{ $company->name }}</option>
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
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="firstname">First Name</label>
                  <input name="firstname" type="text" id="firstname" class="form-control @error('firstname') is-invalid @enderror" value="{{ old('firstname', @$user->firstname) }}">
                  @error('firstname')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="lastname">Last Name</label>
                  <input name="lastname" type="text" id="lastname" class="form-control @error('lastname') is-invalid @enderror" value="{{ old('lastname', @$user->lastname) }}">
                  @error('lastname')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="psudo_name">Psudo Name</label>
                  <input name="psudo_name" type="text" id="psudo_name" class="form-control @error('psudo_name') is-invalid @enderror" value="{{ old('psudo_name', @$user->psudo_name) }}">
                  @error('psudo_name')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="employee_id">Employee ID</label>
                  <input name="employee_id" min="0" type="number" id="employee_id" class="form-control @error('employee_id') is-invalid @enderror" value="{{ old('employee_id', @$user->employee_id) }}">
                  @error('employee_id')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="email">Email</label>
                  <input name="email" type="email" id="email" class="form-control @error('email') is-invalid @enderror" value="{{ old('email', @$user->email) }}">
                  @error('email')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="username">Username</label>
                  <input name="username" type="text" id="username" class="form-control @error('username') is-invalid @enderror" value="{{ old('username', @$user->username) }}">
                  @error('username')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              @can('assign role')
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="email">Role</label>
                  {!! Form::select('roles[]', $roles,$userRole, array('class' => 'form-control select2-multi','multiple')) !!}
                  @error('role')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              @endcan
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="teams">Team</label>
                  <select name="teams[]" id="teams" class="form-control @error('teams') is-invalid @enderror select2-multi" multiple="multiple">
                    @foreach ($teams as $team)
                    @if (old('teams'))
                    <option value="{{ $team->id }}" {{ in_array($team->id, old('teams')) ? 'selected=selected' : '' }}>{{ $team->name }}</option>
                    @else
                    <option value="{{ $team->id }}" {{ in_array($team->id, $assigned_teams) ? 'selected=selected' : '' }}>{{ $team->name }}</option>
                    @endif
                    @endforeach
                  </select>
                  @error('teams')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="timezone">Timezone</label>
                  <select name="timezone" id="timezone" class="form-control @error('timezone') is-invalid @enderror">
                    @foreach (timezones() as $key => $timezone)
                    <option value="{{ $key }}" {{ old('timezone', @$user->timezone) == $key ? 'selected=selected' : '' }}>{{ $timezone }}</option>
                    @endforeach
                  </select>
                  @error('timezone')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="status">Status</label>
                  <select class="form-control @error('practice') is-invalid @enderror" name="status" id="status">
                    <option value="">--Please Select--</option>
                    @foreach (statuses('user') as $status)
                    <option value="{{ $status->id }}" {{ old('status', @$user->status) == $status->id ? 'selected=selected' : '' }}>{{ $status->name }}</option>
                    @endforeach
                  </select>
                  @error('status')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="designation">Designation</label>
                  <select class="form-control @error('practice') is-invalid @enderror" name="designation" id="designation">
                    <option value="">--Please Select--</option>
                    @foreach (designations() as $designation)
                    <option value="{{ $designation->id }}" {{ old('designation', @$user->designation_id) == $designation->id ? 'selected=selected' : '' }}>{{ $designation->name }}</option>
                    @endforeach
                  </select>
                  @error('status')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              @if(!@$user)
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="password">Password</label>
                  <input name="password" type="password" id="password" class="form-control @error('password') is-invalid @enderror" value="{{ old('password') }}">
                  @error('password')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="password_confirmation">Confirm Password</label>
                  <input name="password_confirmation" type="password" id="password_confirmation" class="form-control" value="{{ old('password_confirmation') }}">
                </div>
              </div>
              @endif
              <div class="col-12">
                <input type="submit" value="{{ (@$user)?'Update':'Create' }}" class="btn btn-success float-right">
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection