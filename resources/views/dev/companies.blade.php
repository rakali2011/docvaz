@extends('includes.main')
@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <span class="mb-2 page-title menu-head">Companies</span>

        <a class="btn btn-primary float-right" href="{{ route('add_company') }}">Create Company</a>

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
                      <th>Prefix</th>

                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                        @foreach ($companies as $item)
                        <tr>
                            <td>{{ $item->name }}</td>
                            <td>{{ $item->prefix }}</td>
                            <td>
                            <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="text-muted sr-only">Action</span>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">

                            <a class="dropdown-item" href="{{ route('edit_company', ['id' => Crypt::encrypt($item->id)]) }}">Edit</a>

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
