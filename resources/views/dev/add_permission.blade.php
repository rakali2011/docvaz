@extends('includes.main')
@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <h2 class="page-title menu-head">Add Permission</h2>
        <div class="card shadow mb-4">
        <form action="{{ route('post_permission') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group mb-3">
                    <label for="name">Name</label>
                    <input name="name" value="{{ old('name') }}" required type="text" id="name" class="form-control @error('name') is-invalid @enderror" >
                    @error('name')
                      <span class="invalid-feedback" role="alert">
                          <strong>{{ $message }}</strong>
                      </span>
                    @enderror
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
