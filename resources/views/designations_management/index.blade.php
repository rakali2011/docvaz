@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <span class="mb-2 page-title menu-head">Designations</span>
      @can('add designation')
      <a class="btn btn-primary float-right" href="{{ route('designations.create') }}">Create Designation</a>
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
                    @role('dev')
                    <th>Company</th>
                    @endrole
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($designations as $item)
                  <tr>
                    <td>{{ $item->name }}</td>

                    @role('dev')
                    <td>{{ @$item->company->name }}</td>
                    @endrole
                    <td>
                      <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="text-muted sr-only">Action</span>
                      </button>
                      <div class="dropdown-menu dropdown-menu-right">
                        @can('update designation')
                        <a class="dropdown-item" href="{{ route('designations.edit',$item->id) }}">Edit</a>
                        @endcan
                        @can('delete designation')
                        {!! Form::open(['method' => 'DELETE','route' => ['designations.destroy', $item->id],'style'=>'display:inline']) !!}
                        {!! Form::submit('Delete', ['class' => 'dropdown-item']) !!}
                        {!! Form::close() !!}
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