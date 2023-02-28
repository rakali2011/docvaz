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
              <table id="tickets-table" class="display" style="width:100%">
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
                    <th>Action</th>
                  </tr>
                </thead>
                <tfoot>
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
<div class="modal fade" id="assign-practice-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <form action="{{ route('update_user_practices') }}" method="post" id="assign-practice-form">
        @csrf
        <div class="modal-header">
          <h5 class="modal-title" id="verticalModalTitle">Assign Practices</h5>
          <input type="hidden" name="type" value="client">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group col-12" id="assign-practice-body"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Close</button>
          <input type="submit" class="btn mb-2 btn-primary">
        </div>
      </form>
    </div>
  </div>
</div>
@push('scripts')
<script>
  var ref = '';
  $(document).on('click', '.assign-practice', function() {
    ref = $(this).attr('ref');
    $.ajax({
      type: "post",
      data: {
        id: ref,
        _token: '{{ csrf_token() }}'
      },
      url: "{{ route('get_practices') }}",
      success: function(response) {
        if (response.success == 1) {
          $('#assign-practice-body').html(response.content);
          $('.select2-multi').select2({
            theme: 'bootstrap4',
          });
        } else {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: response.message,
          });
        }
      }
    });
    $('#assign-practice-modal').modal('show');
  });
  var form = document.getElementById('assign-practice-form');
  form.addEventListener('submit', event => {
    event.preventDefault();
    let formData = new FormData(form);
    formData.append('ref', ref);
    fetch(form.action, {
        method: "POST",
        body: formData
      })
      .then(response => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();

      })
      .then(data => {
        if (data.success == 1) {
          $('#assign-practice-modal').modal('hide');
          $('#assign-practice-body').html('');
          ref = "";
          Swal.fire({
            icon: 'success',
            text: data.message,
          });
        } else {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: data.message,
          });
        }
      })
      .catch(error => console.error("There was a problem with the fetch operation:", error));
  });
  $(document).ready(function() {
    $('#tickets-table').DataTable({
      "processing": true,
      "serverSide": true,
      "ajax": {
        "url": "{{ route('all_tickets') }}",
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
          "data": "team_name",
          "orderable": true
        },
        {
          "data": "subject",
          "orderable": true
        },
        {
          "data": "priority",
          "orderable": true
        },
        {
          "data": "status",
          "orderable": false
        },
        {
          "data": "remarks",
          "orderable": true
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