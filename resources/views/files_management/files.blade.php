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
                  @foreach ($files as $key=> $file)
                  <tr>
                    <td><a href="{{ route('file', ['id' => Crypt::encrypt($file->id)]) }}" target="_blank" rel="noopener noreferrer">{{ $file->org_name }}</a></td>
                    <td>{{ $file->pname }}</td>
                    @role('dev')
                    <td>{{ @$item->company->name }}</td>
                    @endrole
                    <td>
                      <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="text-muted sr-only">Action</span>
                      </button>
                      <div class="dropdown-menu dropdown-menu-right">
                        @can('update file')
                        <a class="dropdown-item" href="{{ route('edit_file', ['id' => Crypt::encrypt($file->id)]) }}">Edit</a>
                        @endcan
                      </div>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
              <table id="files-table" class="display" style="width:100%">
                <thead>
                  <tr>
                    <th>Practice</th>
                    <th>File Name</th>
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
                    <th>Practice</th>
                    <th>File Name</th>
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
          _token: "{{csrf_token()}}"
        }
      },
      "columns": [{
          "data": "id",
          "orderable": true
        },
        {
          "data": "response_at",
          "orderable": true
        },
        {
          "data": "created_at",
          "orderable": true
        },
        {
          "data": "creator",
          "orderable": true
        },
        {
          "data": "creator_name",
          "orderable": true
        },
        {
          "data": "practice_name",
          "orderable": true
        },
        {
          "data": "department_name",
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
</script>
@endpush
@endsection