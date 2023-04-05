@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <span class="mb-2 page-title menu-head">Files</span>
      @can('import file')
      <a class="btn btn-sm btn-primary float-right" href="{{ route('import') }}">Import File</a>
      @endcan
      <p class="card-text"></p>
      <div class="row my-4">
        <!-- Small table -->
        <div class="col-md-12">
          <div class="card shadow">
            <div class="card-body">
              <div class="card mb-3">
                <div class="card-body">
                  <form action="" id="filter-form" class="row">
                    <div class="form-group col-md-2">
                      <label for="team"></label>
                      <select name="team" id="team" class="form-control">
                        <option value="">Select Team</option>
                        @foreach ($teams as $key=> $team)
                        <option value="{{ $team->id }}">{{ $team->name }}</option>
                        @endforeach
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <label for="practice"></label>
                      <select name="practice" id="practice" class="form-control">
                        <option value="">Select Practice</option>
                        @foreach ($practices as $key=> $practice)
                        <option value="{{ $practice->id }}">{{ $practice->name }}</option>
                        @endforeach
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <label for="status"></label>
                      <select name="status" id="status" class="form-control">
                        <option value="">Select Status</option>
                        @foreach (statuses('document') as $status)
                        <option value="{{ $status->id }}">{{ $status->name }}</option>
                        @endforeach
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <label for="doc_type"></label>
                      <select name="doc_type" id="doc_type" class="form-control">
                        <option value="">Select Doc Type</option>
                        @foreach (document_types() as $document_type)
                        <option value="{{ $document_type->id }}">{{ $document_type->name }}</option>
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
                    <div class="col-md-12 text-right">
                      <button type="submit" class="btn btn-sm btn-primary">Filter</button>
                      <button type="button" class="btn btn-sm btn-primary" id="c_filter">Clear Filter</button>
                    </div>
                  </form>
                </div>
              </div>
              <table id="files-table" class="display" style="width:100%">
                <thead>
                  <tr>
                    <th>File Name</th>
                    <th>Practice</th>
                    <th>Status</th>
                    <th>Doc Type</th>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Upload Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>File Name</th>
                    <th>Practice</th>
                    <th>Status</th>
                    <th>Doc Type</th>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Upload Date</th>
                    <th>Action</th>
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
@push('scripts')
<script>
  $(document).ready(function() {
    $('#files-table').DataTable({
      "processing": true,
      "serverSide": true,
      "ajax": {
        "url": "{{ route('all_files') }}",
        "dataType": "json",
        "type": "POST",
        "data": {
          _token: "{{csrf_token()}}",
          'team_filter': function() {
            return $("#team").val();
          },
          'practice_filter': function() {
            return $("#practice").val();
          },
          'status_filter': function() {
            return $("#status").val();
          },
          'doc_type_filter': function() {
            return $("#doc_type").val();
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
          "data": "org_name",
          "orderable": true
        },
        {
          "data": "practice_id",
          "orderable": false
        },
        {
          "data": "status",
          "orderable": false
        },
        {
          "data": "doc_type",
          "orderable": false
        },
        {
          "data": "ext",
          "orderable": true
        },
        {
          "data": "date",
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
    $('#files-table').DataTable().ajax.reload(null, false);
  });
</script>
@endpush
@endsection