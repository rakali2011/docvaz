@extends('includes.main')
@section('content')
<style>
  label {
    margin-bottom: 0 !important;
  }

  .modal-dialog {
    max-width: 85%;
  }

  span.concerning,
  span.high {
    color: #f55145 !important;
  }

  span.medium {
    color: #db9a00 !important;
  }

  span.low {
    color: #79af3a !important;
  }

  input.concerning,
  input.high,
  input.medium,
  input.low {
    color: #fff !important;
  }

  input.concerning,
  input.high {
    background-color: #f55145 !important;
  }

  input.medium {
    background-color: #db9a00 !important;
  }

  input.low {
    background-color: #79af3a !important;
  }
</style>
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
<div class="modal fade" id="ticket-replies-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <form action="{{ route('ticket_replies.store') }}" method="POST" id="ticket-replies-form" enctype="multipart/form-data">
        @csrf
        <div class="modal-header">
          <h6 class="modal-title mr-3" id="title"></h6>
          <h6 class="modal-title mr-3" id="ticket-number"></h6>
          <h6 class="modal-title mr-3" id="ticket-status"></h6>
          <h6 class="modal-title" id="ticket-date--"></h6>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group col-12" id="ticket-replies-body">
            <div class="row">
              <div class="form-group col-md-5">
                <label>Practice</label>
                <input type="text" id="practice" class="form-control" value="" disabled="disabled">
              </div>
              <div class="form-group col-md-3">
                <label>Sender</label>
                <input type="text" id="sender" class="form-control" value="" disabled="disabled">
              </div>
              <div class="form-group col-md-2">
                <label>Type</label>
                <input type="text" id="type" class="form-control" value="" disabled="disabled">
              </div>
              <div class="form-group col-md-2">
                <label>Priority</label>
                <input type="text" id="priority" class="form-control" value="" disabled="disabled">
              </div>
              <div class="form-group col-md-5">
                <label>Subject</label>
                <input type="text" id="subject" class="form-control" value="" disabled="disabled">
              </div>
              @if(Auth::user()->type==3)
              <div class="form-group col-md-3">
                <label>Share To</label>
                <select name="share_to[]" id="share_to" class="form-control select2-multi" multiple="multiple">
                  @foreach (share_to()["share_to"] as $item)
                  <option value="{{ $item->id }}">{{ $item->name }}</option>
                  @endforeach
                </select>
              </div>
              @endif
              @if(Auth::user()->type==2)
              <div class="form-group col-md-3">
                <label for="refer_to">Refer To</label>
                <select name="refer_to" id="refer_to" class="form-control">
                  <option value="">--Please Select--</option>
                  @foreach ($departments as $item)
                  <option value="{{ $item->id }}">{{ $item->name }}</option>
                  @endforeach
                </select>
              </div>
              @endif
              <div class="form-group col-md-2">
                <label for="status">Status</label>
                <select name="status" id="status" class="form-control">
                  <option value="">--Please Select--</option>
                  @foreach (ticket_statuses() as $key => $item)
                  <option value="{{ $key }}">{{ $item }}</option>
                  @endforeach
                </select>
              </div>
              <div class="form-group col-md-2">
                <label for="priority--">Priority</label>
                <select name="priority" id="priority--" class="form-control">
                  <option value="">--Please Select--</option>
                  @foreach (ticket_priorities() as $key => $item)
                  <option value="{{ $item }}">{{ $item }}</option>
                  @endforeach
                </select>
              </div>
              <style>
                #priority {
                  text-align: center;
                  padding-bottom: 3px;
                }

                #message-container {
                  background-color: #e9ecef;
                  overflow-y: scroll;
                  min-height: 250px;
                  max-height: 250px;
                  padding: 15px;
                }

                .reply {
                  padding-top: 15px;
                }

                .reply .col-md-8 {
                  overflow-wrap: break-word;
                  margin-bottom: 12px
                }

                strong.text-main {
                  padding: 10px;
                  color: white;
                  background-color: #177dcb;
                }

                .icon {
                  margin-right: 8px;
                  width: 25px;
                  border-radius: 20px;
                  margin-bottom: -1px;
                }

                .reply .col-md-8 span {
                  color: darkgray;
                  margin-left: 10px;
                  font-size: 12px;
                }

                .reply-container {
                  margin-top: 15px;
                }
              </style>
              <div class="form-group col-md-12">
                <label>Message</label>
                <div id="message-container">
                  <div id="ticket-message"></div>
                  <p id="ticket-date"></p>
                  <div id="ticket-replies"></div>
                </div>
              </div>
              <div class="col-md-12">
                <label for="">Attachments</label>
                <div class="form-group mb-3">
                  <div id="uppy"></div>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group mb-3">
                  <label for="message">Message</label>
                  <textarea name="message" id="message" class="form-control @error('message') is-invalid @enderror" rows="10" required="required">{{ old('message') }}</textarea>
                  @error('message')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
            </div>
          </div>
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
<script src="{{ asset('assets/ckeditor/ckeditor.js') }}"></script>
<script>
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
  var ref = '';
  $(document).on('click', '.ticket-replies', function() {
    ref = $(this).attr('ref');
    $.ajax({
      type: "post",
      data: {
        id: ref,
        _token: '{{ csrf_token() }}'
      },
      url: "{{ route('get_ticket') }}",
      success: function(response) {
        console.log(response);
        if (response.success == 1) {
          $('#ticket-replies-form')[0].reset();
          CKEDITOR.instances.message.setData('');
          $('#title').text(response.content.department_name);
          $('#ticket-number').text(response.content.id);
          $('#ticket-status').text(response.content.status);
          $('#ticket-date--').text(response.content.created_at);
          $('#practice').val(response.content.practice_name);
          $('#sender').val(response.content.department_name);
          $('#type').val(response.content.type);
          $('#priority').val(response.content.priority);
          $('#priority').removeClass('concerning');
          $('#priority').removeClass('high');
          $('#priority').removeClass('low');
          $('#priority').removeClass('medium');
          $('#priority').addClass(response.content.priority.toLowerCase());
          $('#subject').val(response.content.subject);
          $('#ticket-message').html(response.content.message);
          $('#ticket-date').html(response.content.created_at);
          $("select#status option:contains('" + response.content.status + "')").attr("selected", "selected");
          $('#priority-- option[value="' + response.content.priority + '"]').attr("selected", "selected");
          $('#refer_to option[value="' + response.content.department_id + '"]').remove();
          var replies = '';
          $.each(response.content.replies, function(key, value) {
            color = key % 2 == 0 ? '#fffaf0' : '#e9ecef';
            if (value.is_refered)
              replies += '<div class="row reply" style="background:' + color + ';"><div class="col-md-12"><div class="reply-container">' + value.message + '<p class="text-center">' + value.creator_name + '<br>' + value.created_at + '</p></div></div></div>';
            else
              replies += '<div class="row reply" style="background:' + color + ';"><div class="col-md-8"><strong class="text-main"><img class="icon" src="https://docuhub.com/chat/user-icon.png">' + value.creator_name + '</strong><span>' + value.created_at + '</span><div class="reply-container">' + value.message + '</div></div></div>';
          });
          $('#ticket-replies').html(replies);
          $('#share_to').select2('destroy');
          $('#share_to option:selected').removeAttr('selected');
          $.each(response.content.ccs, function(key, value) {
            if (value.resource_type) {
              $('#share_to option[value="' + value.resource_id + '"]').attr("selected", "selected");
            }
          });
          $('#share_to').select2();
        } else {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: response.message,
          });
        }
      }
    });
    $('#ticket-replies-modal').modal('show');
  });
  CKEDITOR.replace('message');
  var uptarg = document.getElementById('uppy');
  const uppy = Uppy.Core({
    autoProceed: false,
    restrictions: {
      allowedFileTypes: ['image/*', 'application/pdf', '.pdf', '.doc', '.docx', '.xls', '.xlsx', '.csv', '.tsv', '.ppt', '.pptx', '.pages', '.odt', '.rtf', '.hl7', '.zip']
    }
  }).use(Uppy.Dashboard, {
    target: uptarg,
    inline: true,
    showLinkToFileUploadResult: false,
    showProgressDetails: false,
    width: '100%',
    height: 210,
    proudlyDisplayPoweredByUppy: false,
  });
  var form = document.getElementById('ticket-replies-form');
  form.addEventListener('submit', event => {
    event.preventDefault();
    let formData = new FormData(form);
    var data = CKEDITOR.instances.message.getData();
    formData.append('ticket_id', ref);
    formData.append('message', data);
    const files = uppy.getFiles();
    files.forEach(file => {
      formData.append('files[]', file.data);
    });
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
          $('#ticket-replies-modal').modal('hide');
          $('#ticket-replies-form')[0].reset();
          CKEDITOR.instances.message.setData('');
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
</script>
@endpush
@endsection