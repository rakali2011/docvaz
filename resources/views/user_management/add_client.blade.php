@extends('includes.main')
@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12">
            <h2 class="page-title menu-head">{{(@$user) ? 'Update Client' : 'Create New Client' }}</h2>
            <div class="card shadow mb-4">
                <form action="{{(@$user) ? route('update_client', ['id' => Crypt::encrypt($user->id)]) : route('post_client')  }}" method="POST">
                    @csrf
                    <div class="card-body">
                        <div class="row">
                            @role('dev')
                            <div class="col-md-3">
                                <div class="form-group mb-3">
                                    <label for="company">Company</label>
                                    <select class="form-control @error('company') is-invalid @enderror" name="company" id="company">
                                        @foreach (companies() as $company)
                                        <option value="{{ $company->id }}" {{(@$user) ? (@$user->company_id==$company->id ? 'selected' : '') : '' }}>{{ $company->name }}</option>
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
                                    <input name="firstname" required type="text" id="firstname" class="form-control @error('firstname') is-invalid @enderror" value="{{ (@$user)?@$user->firstname:old('firstname') }}">
                                    @error('firstname')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div> <!-- /.col -->
                            <div class="col-md-3">
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
                            <div class="col-md-3">
                                <div class="form-group mb-3">
                                    <label for="email">Email</label>
                                    <input name="email" required type="email" id="email" class="form-control @error('email') is-invalid @enderror" value="{{ (@$user)?@$user->email:old('email') }}">
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
                                    <input name="username" type="username" id="username" class="form-control @error('username') is-invalid @enderror" value="{{ (@$user)?@$user->username:old('username') }}">
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
                                    <label for="team">Team</label>
                                    <select name="team" id="team" class="form-control @error('team') is-invalid @enderror" required="required">
                                        @foreach ($teams as $team)
                                        <option value="{{ $team->id }}" {{ in_array($team->id,$assigned_teams)?'selected':'' }}>{{ $team->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('team')
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
                                        <option value="{{ $key }}" {{(@$user) ? (@$user->timezone==$timezone ? 'selected' : '') : '' }}>{{ $timezone }}</option>
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
                                        @foreach (statuses('client') as $status)
                                        <option value="{{ $status->id }}" {{(@$user) ? (@$user->status==$status->id ? 'selected' : '') : '' }}>{{ $status->name }}</option>
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
                                    <input name="password" type="password" id="password" class="form-control @error('password') is-invalid @enderror" value="{{ old('password') }}" {{ (@$user) ? '' : 'required="required="' }}>
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
                                    <input name="password_confirmation" type="password" id="password_confirmation" class="form-control" value="{{ old('password_confirmation') }}" {{ (@$user) ? '' : 'required="required="' }}>
                                </div>
                            </div>

                            @endif
                            <div class="col-12">
                                <input type="submit" value="{{ (@$user)?'Update':'Create' }}" class="btn btn-success float-right">
                            </div>
                        </div>
                    </div>
                </form>
            </div> <!-- / .card -->

        </div> <!-- .col-12 -->
    </div> <!-- .row -->
</div>

@endsection