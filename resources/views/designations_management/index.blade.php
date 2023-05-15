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
                <tbody id="items-1">
                  <?php $order = false; ?>
                  @can('set order designation')
                  <?php $order = true; ?>
                  @endcan
                  @foreach ($designations as $item)
                  <tr <?= $order == true ? 'id="item-' . $item->id . '" data-id="' . $item->id . '"' : ''; ?>>
                    <td><?= $order == true ? '<i class="fe fe-move mr-2"></i>' : ''; ?>{{ $item->name }}</td>
                    @role(' dev') <td>{{ @$item->company->name }}</td>
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
@push('scripts')
<script src="{{ asset('assets/Sortable-1.10.2/Sortable.js') }}"></script>
<script src="{{ asset('assets/Sortable-1.10.2/jquery-sortable.js') }}"></script>
<script>
  // List 1
  $('#items-1').sortable({
    group: 'list',
    animation: 200,
    ghostClass: 'ghost',
    onSort: reportActivity,
  });
  // Report when the sort order has changed
  function reportActivity() {
    var sort1 = $('#items-1').sortable('toArray');
    $.ajax({
      type: "POST",
      url: "{{ route('update_rank') }}",
      data: {
        _token: "{{csrf_token()}}",
        ids: sort1,
      },
      cache: false,
      dataType: "JSON",
      success: function(response) {
        console.log(response);
        $('#important').toggleClass('grey');
        $('#important').toggleClass('orange');
        // $('#ticket_listing').DataTable().ajax.reload(null, true);
      }
    });
  };
</script>
@endpush
@endsection