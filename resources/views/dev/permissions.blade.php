@extends('includes.main')
@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <span class="mb-2 page-title menu-head">Permissions</span>
        <a class="btn btn-primary float-right" href="{{ route('add_permission') }}">Create Permission</a>

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
                    </tr>
                  </thead>
                  <tbody>
                        @foreach ($permissions as $item)
                        <tr>
                            <td>{{ $item->name }}</td>

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
