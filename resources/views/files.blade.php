@extends('includes.main')
@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <span class="mb-2 page-title menu-head">Departments</span>
        @can('add department')
        <a class="btn btn-primary float-right" href="{{ route('add_department') }}">Create Department</a>

        @endcan
        <p class="card-text"></p>
        <div class="row my-4">
          <!-- Small table -->
          <div class="col-md-12">
            <div class="card shadow">
                <div class="card-header">
                    <strong>Uppy</strong>
                  </div>
              <div class="card-body">
                <form id="form" action="{{ route('upload') }}" enctype="multipart/form-data" method="POST">
                @csrf

                <div id="uppy"></div>
                <input type="submit" value="submit">
                </form>

              </div>
            </div>
          </div> <!-- simple table -->
        </div> <!-- end section -->
      </div> <!-- .col-12 -->
    </div> <!-- .row -->
</div>
<script>

</script>
<style>
    .uppy-Dashboard-progressindicators {
    display: none;
}
</style>
@endsection
