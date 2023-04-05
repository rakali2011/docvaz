@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <span class="mb-2 page-title menu-head">Audits</span>
      <p class="card-text"></p>
      <div class="row my-4">
        <div class="col-md-12">
          <div class="card shadow">
            <div class="card-body">
              <div class="card mb-3">
                <div class="card-body background-panel">
                  <form action="" id="filter-form" class="row">
                    <div class="form-group col-md-2">
                      <label for="user"></label>
                      <select name="user" id="user" class="form-control">
                        <option value="">Select User</option>
                        @foreach (users() as $key => $user)
                        <option value="{{ $user->id }}">{{ $user->firstname.' '.$user->lastname }}</option>
                        @endforeach
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <label for="event"></label>
                      <select name="event" id="event" class="form-control">
                        <option value="">Select Event</option>
                        <option value="created">Created</option>
                        <option value="deleted">Deleted</option>
                        <option value="restored">Restored</option>
                        <option value="updated">Updated</option>
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <label for="date_from"></label>
                      <input name="date_from" id="date_from" class="form-control datepicker" placeholder="Date From">
                    </div>
                    <div class="form-group col-md-2">
                      <label for="date_to"></label>
                      <input name="date_to" id="date_to" class="form-control datepicker" placeholder="Date To">
                    </div>
                    <div class="col-md-12 text-right">
                      <button type="submit" class="btn btn-sm btn-primary">Filter</button>
                      <button type="button" class="btn btn-sm btn-primary" id="c_filter">Clear Filter</button>
                    </div>
                  </form>
                </div>
              </div>
              <div style="width:100% !important;overflow-x:auto;">
                <table id="files-table" class="display" style="width:100%;">
                  <thead>
                    <tr>
                      <th>User</th>
                      <th>Event</th>
                      <th>Auditable Type</th>
                      <th>Auditable ID</th>
                      <th>Old Values</th>
                      <th>New Values</th>
                      <th>IP Address</th>
                      <th>User Agent</th>
                      <th>Created At</th>
                      <th>Updated At</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>User</th>
                      <th>Event</th>
                      <th>Auditable Type</th>
                      <th>Auditable ID</th>
                      <th>Old Values</th>
                      <th>New Values</th>
                      <th>IP Address</th>
                      <th>User Agent</th>
                      <th>Created At</th>
                      <th>Updated At</th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@push('scripts')
<script>
  $(document).ready(function() {
    $('#files-table').DataTable({
      "processing": true,
      "serverSide": true,
      "ajax": {
        "url": "{{ route('get_audits') }}",
        "dataType": "json",
        "type": "POST",
        "data": {
          _token: "{{csrf_token()}}",
          'user_filter': function() {
            return $("#user").val();
          },
          'event_filter': function() {
            return $("#event").val();
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
          "data": "user_id",
          "orderable": true
        },
        {
          "data": "event",
          "orderable": false
        },
        {
          "data": "auditable_type",
          "orderable": false
        },
        {
          "data": "auditable_id",
          "orderable": false
        },
        {
          "data": "old_values",
          "orderable": true
        },
        {
          "data": "new_values",
          "orderable": true
        },
        {
          "data": "ip_address",
          "orderable": true
        },
        {
          "data": "user_agent",
          "orderable": false
        },
        {
          "data": "created_at",
          "orderable": false
        },
        {
          "data": "updated_at",
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
      // "drawCallback": function(settings) {
      //   provider_detail_event();
      //   provider_history_event();
      //   provider_activate_event();
      // }
    });
  });


  $('#filter-form [type="submit"]').on('click', function(e) {
    e.preventDefault();
    $('#files-table').DataTable().ajax.reload(null, false);
  });
  $('#c_filter').click(function() {
    $('select').val('');
    $('input').val('');
    $('#files-table').DataTable().ajax.reload(null, false);
  });
</script>
@endpush
@endsection