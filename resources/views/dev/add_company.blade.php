@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">Add Company</h2>
      <div class="card shadow mb-4">
        @if (@$company)
        <form action="{{ route('update_company', ['id' => Crypt::encrypt($company->id)]) }}" method="POST" enctype="multipart/form-data">
          @else
          <form action="{{ route('post_company') }}" method="POST" enctype="multipart/form-data">
            @endif
            @csrf
            <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group mb-3">
                    <label for="name">Name</label>
                    <input name="name" value="{{ (@$company)?@$company->name:old('name') }}" required type="text" id="name" class="form-control @error('name') is-invalid @enderror">
                    @error('name')
                    <span class="invalid-feedback" role="alert">
                      <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group mb-3">
                    <label for="prefix">Prefix</label>
                    <input name="prefix" value="{{ (@$company)?@$company->prefix:old('prefix') }}" required type="text" id="prefix" class="form-control @error('prefix') is-invalid @enderror">
                    @error('prefix')
                    <span class="invalid-feedback" role="alert">
                      <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                  </div>
                </div>




                <div class="col-12">
                  <input type="submit" value="{{ (@$company)?'Update':'Save' }}" class="btn btn-success float-right">
                </div>
              </div>
            </div>
          </form>
      </div> <!-- / .card -->

    </div> <!-- .col-12 -->
  </div> <!-- .row -->
</div>

@endsection