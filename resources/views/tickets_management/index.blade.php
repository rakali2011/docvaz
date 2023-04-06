@extends('includes.main')
@section('content')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

  i.fa.fa-flag.grey {
    color: grey;
  }

  i.fa.fa-flag.orange {
    color: orange;
  }

  .uppy-Dashboard-progressindicators {
    display: none;
  }

  .uppy-size--xl .uppy-Dashboard-Item {
    width: 50px;
    height: 50px;
  }

  .uppy-size--xl .uppy-Dashboard-Item-preview {
    height: 50px;
  }

  .uppy-Dashboard-Item-previewIconWrap {
    height: 30px;
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
              <div class="card mb-3">
                <div class="card-body shadow background-panel">
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
                      <label for="status-filter"></label>
                      <select name="status" id="status-filter" class="form-control">
                        <option value="">Select Status</option>
                        @foreach (statuses('ticket') as $status)
                        <option value="{{ $status->id }}">{{ $status->name }}</option>
                        @endforeach
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <label for="department"></label>
                      <select name="department" id="department" class="form-control">
                        <option value="">Select Department</option>
                        @foreach ($departments as $department)
                        <option value="{{ $department->id }}">{{ $department->name }}</option>
                        @endforeach
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <label for="priority_f"></label>
                      <select name="priority_f" id="priority_f" class="form-control">
                        <option value="">Select Priority</option>
                        @foreach (ticket_priorities() as $priority)
                        <option value="{{ $priority }}">{{ $priority }}</option>
                        @endforeach
                      </select>
                    </div>
                    <div class="form-group col-md-2">
                      <label for="created_by"></label>
                      <select name="created_by" id="created_by" class="form-control">
                        <option value="">Select Created By</option>
                        <option value="Client">Client</option>
                        <option value="{{ $company_name }}">{{ $company_name }}</option>
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
                    <div class="col-md-2 d-flex align-items-center">
                      <label class="imp-lab" for="flaged">Flaged:</label>
                      <input type="checkbox" name="flaged" id="flaged" value="1" class="ml-2">
                    </div>
                    <div class="col-md-6 text-right" style="margin:auto;">
                      <button type="submit" class="btn btn-sm btn-primary">Filter</button>
                      <button type="button" class="btn btn-sm btn-primary" id="c_filter">Clear Filter</button>
                    </div>
                  </form>
                </div>
              </div>
              <table id="tickets-table" class="display" style="width:100%">
                <thead>
                  <tr>
                    <th>Ticket#</th>
                    <th>Response</th>
                    <th>Created</th>
                    <th>Creator</th>
                    <th>User Name</th>
                    <th>To</th>
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
                    <th>To</th>
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
                <label>To</label>
                <input type="text" id="practice-name" class="form-control" value="" disabled="disabled">
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
                  @foreach (statuses('ticket') as $key => $item)
                  <option value="{{ $item->id }}">{{ $item->name }}</option>
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
                <label id="remarks">Ticket Forward Remarks</label>
                <textarea name="remarks" id="remarks" class="form-control"></textarea>
              </div>
              <div class="form-group col-md-12">
                <label>Message</label>
                <i class="fa fa-flag grey" id="important" data-id="0" style="cursor:pointer;font-size:16px;margin-left:10px;" onclick="flag(this);"></i>
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
  function refer_to() {
    if ($('#refer_to').val() != "")
      $('#remarks').parent('.form-group.col-md-12').show();
    else
      $('#remarks').parent('.form-group.col-md-12').hide();
  }
  $('#refer_to').change(function() {
    refer_to();
  });
  $(document).ready(function() {
    refer_to();
    $('#tickets-table').DataTable({
      "processing": true,
      "serverSide": true,
      "ajax": {
        "url": "{{ route('all_tickets') }}",
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
            return $("#status-filter").val();
          },
          'department_filter': function() {
            return $("#department").val();
          },
          'priority_filter': function() {
            return $("#priority_f").val();
          },
          'created_by_filter': function() {
            return $("#created_by").val();
          },
          'date_from_filter': function() {
            return $("#date_from").val();
          },
          'date_to_filter': function() {
            return $("#date_to").val();
          },
          'flag_filter': function() {
            return $("#flaged:checked").val();
          }
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
          $('#practice-name').val('');
          $('#ticket-replies-form')[0].reset();
          CKEDITOR.instances.message.setData('');
          $('#important').removeClass('orange');
          $('#important').removeClass('grey');
          if (response.content.flag == 1)
            $('#important').addClass('orange');
          else
            $('#important').addClass('grey');
          $('#important').attr('data-id', response.content.id);
          $('#title').text(response.content.department_name);
          $('#ticket-number').text(response.content.id);
          $('#ticket-status').text(response.content.status);
          $('#ticket-date--').text(response.content.created_at);
          $('#practice-name').val(response.content.target_name);
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
            else {
              attachments = '';
              $.each(response.content.attachments, function(index, attachment) {
                if (attachment.reply_id == value.id && attachment.type == 1) {
                  var id = attachment.id;
                  var url = "{{ route('ticket_attachments.show', ':id') }}";
                  url = url.replace(':id', id);
                  attachments += '<a href="' + url + '" target="_blank" rel="noopener noreferrer" class="mr-2">' + attachment.org_name + '</a>';
                }
              });
              replies += '<div class="row reply" style="background:' + color + ';"><div class="col-md-8"><strong class="text-main"><img class="icon" src="https://docuhub.com/chat/user-icon.png">' + value.creator_name + '</strong><span>' + value.created_at + '</span><div class="reply-container">' + value.message + attachments + '</div></div></div>';
            }
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
          // Swal.fire({
          //   icon: 'success',
          //   text: data.message,
          // });
          $('#tickets-table').DataTable().ajax.reload(null, false);
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

  function flag(element) {
    id = $(element).data('id');
    if (id != "") {
      $.ajax({
        type: "POST",
        url: "{{ route('ticket_flag') }}",
        data: {
          _token: "{{csrf_token()}}",
          id: id,
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
    } else {
      return false;
    }
  }
  $('#filter-form [type="submit"]').on('click', function(e) {
    e.preventDefault();
    $('#tickets-table').DataTable().ajax.reload(null, false);
  });
  $('#c_filter').click(function() {
    $('#team,#practice,#status,#department,#priority_f,#created_by,#date_from,#date_to').val('');
    $('#flaged').prop('checked', false);
    $('#tickets-table').DataTable().ajax.reload(null, false);
  });
</script>
@endpush
@endsection