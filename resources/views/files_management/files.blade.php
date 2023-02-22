@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <span class="mb-2 page-title menu-head">Files</span>
      @can('import file')
      <a class="btn btn-primary float-right" href="{{ route('import') }}">Create File</a>
      @endcan
      <p class="card-text"></p>
      <div class="row my-4">
        <!-- Small table -->
        <div class="col-md-12">
          <div class="card shadow">
            <div class="card-body">
              <!-- table -->
              <table class="table datatables" id="dataTable-1">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Practice Name</th>
                    @role('dev')
                    <th>Company</th>
                    @endrole
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($files as $item)
                  <tr>
                    <td><a href="{{ route('file', ['id' => Crypt::encrypt($item->id)]) }}" target="_blank" rel="noopener noreferrer">{{ $item->org_name }}</a></td>
                    <td>{{ $item->pname }}</td>
                    @role('dev')
                    <td>{{ @$item->company->name }}</td>
                    @endrole
                    <td>
                      <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="text-muted sr-only">Action</span>
                      </button>
                      <div class="dropdown-menu dropdown-menu-right">
                        @can('update file')
                        <a class="dropdown-item" href="{{ route('edit_file', ['id' => Crypt::encrypt($item->id)]) }}">Edit</a>
                        @endcan
                      </div>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div> <!-- simple table -->
      </div> <!-- end section -->
    </div> <!-- .col-12 -->
  </div> <!-- .row -->
</div>

@endsection