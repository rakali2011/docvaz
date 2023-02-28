@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <span class="mb-2 page-title menu-head">Tickets</span>
      @can('create ticket')
      <a class="btn btn-primary float-right" href="{{ route('tickets.create') }}">Create Ticket</a>
      @endcan
      <p class="card-text"></p>
      <div class="row my-4">
        <div class="col-md-12">
          <div class="card shadow">
            <div class="card-body">
              <!-- table -->
              <table class="table datatables" id="tickets">
                <thead>
                  <tr>
                    <th>Ticket#</th>
                    <th>Response</th>
                    <th>Created</th>
                    <th>Creator</th>
                    <th>User Name</th>
                    <th>Practice</th>
                    <th>Department</th>
                    <th>Team</th>
                    <th>Subject</th>
                    <th>Priority</th>
                    <th>Status</th>
                    <th>Remarks</th>
                    @role('dev')
                    <th>Company</th>
                    @endrole
                    <th>Action</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@push('scripts')
<script src="{{ asset('assets/DataTable-1.12.1/js/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('assets/DataTable-1.12.1/js/dataTables.buttons.min.js') }}"></script>
<script src="{{ asset('assets/DataTable-1.12.1/js/jszip.min.js') }}"></script>
<script src="{{ asset('assets/DataTable-1.12.1/js/pdfmake.min.js') }}"></script>
<script src="{{ asset('assets/DataTable-1.12.1/js/vfs_fonts.js') }}"></script>
<script src="{{ asset('assets/DataTable-1.12.1/js/buttons.html5.min.js') }}"></script>
<script src="{{ asset('assets/DataTable-1.12.1/js/buttons.print.min.js') }}"></script>
<script src="{{ asset('assets/DataTable-1.12.1/js/buttons.colVis.min.js') }}"></script>
<script>
  $(document).ready(function() {
    $('#tickets').DataTable({
      "processing": true,
      "serverSide": true,
      "ajax": {
        "url": "{{ route('all_tickets') }}",
        "dataType": "json",
        "type": "POST",
        "data": {
          _token: "{{csrf_token()}}",
          'from_date': function() {
            return $("#from_date").val();
          },
          'to_date': function() {
            return $("#to_date").val();
          },
          'practice_id': function() {
            return $("#practice").val();
          },
          'status': function() {
            return $("#status").val();
          },
          'pro_speciality': function() {
            return $("#pro_speciality").val();
          },
          'pro_state': function() {
            return $("#pro_state").val();
          }
        }
      },
      "columns": [{
          "data": "id",
          "orderable": false
        },
        {
          "data": "response_at",
          "orderable": false
        },
        {
          "data": "created_at",
          "orderable": false
        },
        {
          "data": "creator",
          "orderable": false
        },
        {
          "data": "creator_name",
          "orderable": false
        },
        {
          "data": "practice_name",
          "orderable": false
        },
        {
          "data": "department_name",
          "orderable": false
        },
        {
          "data": "team_name",
          "orderable": false
        },
        {
          "data": "subject",
          "orderable": false
        },
        {
          "data": "priority",
          "orderable": false
        },
        {
          "data": "status",
          "orderable": false
        },
        {
          "data": "remarks",
          "orderable": false
        },
        {
          "data": "action",
          "orderable": false
        },
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
</script>
@endpush
@endsection