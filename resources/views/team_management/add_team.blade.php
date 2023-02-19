@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">{{(@$team) ? 'Update Team' : 'Add Team' }}</h2>
      <div class="card shadow mb-4">
        <form action="{{(@$team) ? route('update_team', ['id' => Crypt::encrypt($team->id)]) : route('post_team')  }}" method="POST" enctype="multipart/form-data">
          @csrf
          <div class="card-body">
            <div class="row">
              @role('dev')
              <div class="col-md-6">
                <div class="form-group mb-3">
                  <label for="company">Company</label>
                  <select class="form-control @error('company') is-invalid @enderror" name="company" id="company">

                    @foreach (companies() as $item)
                    <option value="{{ $item->id }}" {{(@$team) ? (@$team->company_id==$item->id ? 'selected' : '') : '' }}>{{ $item->name }}</option>
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
                  <input name="name" value="{{ (@$team)?@$team->name:old('name') }}" required type="text" id="name" class="form-control @error('name') is-invalid @enderror">
                  @error('name')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-12">
                <input type="submit" value="{{ (@$team)?'Update':'Save' }}" class="btn btn-success float-right">
              </div>
            </div>
          </div>
        </form>
      </div> <!-- / .card -->

    </div> <!-- .col-12 -->
  </div> <!-- .row -->
</div>

@endsection