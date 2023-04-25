@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <span class="mb-2 page-title menu-head">Practices</span>
      @can('add practice')
      <a class="btn btn-primary float-right" href="{{ route('add_practice') }}">Create Practice</a>

      @endcan
      <p class="card-text"></p>
      <div class="row my-4">
        <!-- Small table -->
        <div class="col-md-12">
          <div class="card shadow">
            <div class="card-body">
              <div class="card mb-3">
                <div class="card-body shadow background-panel">
                  <form action="" id="filter-form" class="row">
                    <div class="form-group col-md-2">
                      <label for="status-filter"></label>
                      <select name="status-filter" id="status-filter" class="form-control">
                        <option value="">Select Status</option>
                        @foreach (statuses('practice') as $status)
                        <option value="{{ $status->id }}">{{ $status->name }}</option>
                        @endforeach
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <label for="date_from"></label>
                      <input type="text" name="date_from" id="date_from" class="form-control datepicker" placeholder="Date From">
                    </div>
                    <div class="form-group col-md-2">
                      <label for="date_to"></label>
                      <input type="text" name="date_to" id="date_to" class="form-control datepicker" placeholder="Date To">
                    </div>
                    <div class="col-md-6 text-right" style="margin:auto;">
                      <button type="submit" class="btn btn-sm btn-primary">Filter</button>
                      <button type="button" class="btn btn-sm btn-primary" id="c_filter">Clear Filter</button>
                    </div>
                  </form>
                </div>
              </div>
              <table id="practices-table" class="display" style="width:100%">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Created At</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Created At</th>
                    <th>Action</th>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div> <!-- simple table -->
      </div> <!-- end section -->
    </div> <!-- .col-12 -->
  </div> <!-- .row -->
</div>
@push('scripts')
<script>
  $(document).ready(function() {
    $('#practices-table').DataTable({
      "processing": true,
      "serverSide": true,
      "ajax": {
        "url": "{{ route('all_practices') }}",
        "dataType": "json",
        "type": "POST",
        "data": {
          _token: "{{csrf_token()}}",
          'status_filter': function() {
            return $("#status-filter").val();
          },
          'date_from_filter': function() {
            return $("#date_from").val();
          },
          'date_to_filter': function() {
            return $("#date_to").val();
          },
        }
      },
      "columns": [{
          "data": "name",
          "orderable": true
        },
        {
          "data": "status",
          "orderable": true
        },
        {
          "data": "created_at",
          "orderable": true
        },
        {
          "data": "action",
          "orderable": false
        }
      ],
      dom: 'Bfrtip',
      lengthMenu: [
        [10, 50, 500, 1000],
        ['10 Rows', '50 Rows', '500 Rows', '1000 Rows']
      ],
      buttons: [
        //{ extend: 'pdf', text: '<i class="fas fa-file-pdf fa-1x" aria-hidden="true"> Export in PDF</i>' },
        //{ extend: 'csv', text: '<i class="fas fa-file-csv fa-1x"> Export in CSV</i>'},
        {
          extend: 'excel',
          text: '<i class="fas fa-file-excel" aria-hidden="true"> Export in EXCEL</i>'
        },
        'pageLength'
      ],
    });
  });
  $('#filter-form [type="submit"]').on('click', function(e) {
    e.preventDefault();
    $('#practices-table').DataTable().ajax.reload(null, false);
  });
  $('#c_filter').click(function() {
    $('select,input').val('');
    $('#practices-table').DataTable().ajax.reload(null, false);
  });
</script>
@endpush
@endsection