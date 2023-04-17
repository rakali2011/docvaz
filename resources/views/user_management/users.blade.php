@extends('includes.main')
@section('content')
<link rel="stylesheet" href="{{ asset('assets/Multiselect/jquery.multiselect.css') }}">
<style>
    span.role {
        background-color: #e3e8ee;
        color: #333;
        border-radius: 3px;
        border: 1px solid #d0d7dd;
        padding: 5px;
        margin-right: 5px;
    }
</style>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12">
            <span class="mb-2 page-title menu-head">Users</span>
            @can('add user')
            <a class="btn btn-primary float-right" href="{{ route('add_user') }}">Create User</a>
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
                                        @role('dev')
                                        <div class="form-group col-md-2">
                                            <label for="company-filter"></label>
                                            <select name="company-filter" id="company-filter" class="form-control">
                                                <option value="">Select Company</option>
                                                @foreach (companies() as $company)
                                                <option value="{{ $company->id }}">{{ $company->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        @else
                                        <div class="form-group col-md-2">
                                            <label for="departments-filter"></label>
                                            <select name="departments-filter" id="departments-filter" class="form-control">
                                                <option value="">Select Departments</option>
                                                @foreach (departments() as $department)
                                                <option value="{{ $department->id }}">{{ $department->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="designation-filter"></label>
                                            <select name="designation-filter" id="designation-filter" class="form-control">
                                                <option value="">Select Designation</option>
                                                @foreach (designations() as $designation)
                                                <option value="{{ $designation->id }}">{{ $designation->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="status-filter"></label>
                                            <select name="status-filter" id="status-filter" class="form-control">
                                                <option value="">Select Status</option>
                                                @foreach (statuses('user') as $status)
                                                <option value="{{ $status->id }}">{{ $status->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="role-filter"></label>
                                            <select name="role-filter" id="role-filter" class="form-control">
                                                <option value="">Select Role</option>
                                                @foreach (roles() as $key => $role)
                                                <option value="{{ $key }}">{{ $role }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        @endrole
                                        <div class="form-group col-md-2">
                                            <label for="date_from"></label>
                                            <input type="text" name="date_from" id="date_from" class="form-control datepicker" placeholder="Date From">
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label for="date_to"></label>
                                            <input type="text" name="date_to" id="date_to" class="form-control datepicker" placeholder="Date To">
                                        </div>
                                        @role('dev')
                                        <div class="col-md-4 text-right" style="margin:auto;">
                                            <button type="submit" class="btn btn-sm btn-primary">Filter</button>
                                            <button type="button" class="btn btn-sm btn-primary" id="c_filter">Clear Filter</button>
                                        </div>
                                        @else
                                        <div class="col-md-12 text-right" style="margin:auto;">
                                            <button type="submit" class="btn btn-sm btn-primary">Filter</button>
                                            <button type="button" class="btn btn-sm btn-primary" id="c_filter">Clear Filter</button>
                                        </div>
                                        @endrole
                                    </form>
                                </div>
                            </div>
                            <table id="users-table" class="display" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Psudo Name</th>
                                        <th>Email</th>
                                        <th>Username</th>
                                        <th>Employee ID</th>
                                        <th>Designation</th>
                                        <th>Status</th>
                                        <th>Roles</th>
                                        <th>Departments</th>
                                        @role('dev')
                                        <th>Company Name</th>
                                        @endrole
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Psudo Name</th>
                                        <th>Email</th>
                                        <th>Username</th>
                                        <th>Employee ID</th>
                                        <th>Designation</th>
                                        <th>Status</th>
                                        <th>Roles</th>
                                        <th>Departments</th>
                                        @role('dev')
                                        <th>Company Name</th>
                                        @endrole
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
<div class="modal fade" id="assign-department-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form action="{{ route('update_user_departments') }}" method="post" id="assign-department-form">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="verticalModalTitle">Assign Department</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group col-12" id="assign-department-body"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn mb-2 btn-primary">
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="assign-document-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form action="{{ route('update_user_document_types') }}" method="post" id="assign-document-form">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="verticalModalTitle">Allow Document Types</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group col-12" id="assign-document-body"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn mb-2 btn-primary">
                </div>
            </form>
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
<div class="modal fade" id="assign-team-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form action="{{ route('update_user_teams') }}" method="post" id="assign-team-form">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="verticalModalTitle">Assign Team</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group col-12" id="assign-team-body"></div>
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
<script src="{{ asset('assets/Multiselect/jquery.multiselect.js') }}"></script>
<script>
    $(document).ready(function() {
        $('#users-table').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "{{ route('all_users') }}",
                "dataType": "json",
                "type": "POST",
                "data": {
                    _token: "{{csrf_token()}}",
                    'department_filter': function() {
                        return $("#departments-filter").val();
                    },
                    'designation_filter': function() {
                        return $("#designation-filter").val();
                    },
                    'company_filter': function() {
                        return $("#company-filter").val();
                    },
                    'status_filter': function() {
                        return $("#status-filter").val();
                    },
                    'role_filter': function() {
                        return $("#role-filter").val();
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
                    "data": "first_name",
                    "orderable": true
                },
                {
                    "data": "last_name",
                    "orderable": true
                },
                {
                    "data": "psudo_name",
                    "orderable": true
                },
                {
                    "data": "email",
                    "orderable": true
                },
                {
                    "data": "username",
                    "orderable": true
                },
                {
                    "data": "employee_id",
                    "orderable": true
                },
                {
                    "data": "designation_id",
                    "orderable": false
                },
                {
                    "data": "status",
                    "orderable": false
                },
                {
                    "data": "roles",
                    "orderable": false
                },
                {
                    "data": "departments",
                    "orderable": false
                },
                <?php if (Auth::user()->roles[0]->name === 'dev') : ?> {
                        "data": "company_name",
                        "orderable": false
                    },
                <?php endif; ?> {
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
    var ref = '';
    $(document).on('click', '.assign-department', function() {
        ref = $(this).attr('ref');
        $.ajax({
            type: "post",
            data: {
                ref: ref,
                _token: '{{ csrf_token() }}'
            },
            url: "{{ route('get_departments') }}",

            success: function(response) {
                if (response.success == 1) {
                    $('#assign-department-body').html(response.content);
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
        $('#assign-department-modal').modal('show');
    });
    $(document).on('click', '.assign-document', function() {
        ref = $(this).attr('ref');
        $.ajax({
            type: "post",
            data: {
                ref: ref,
                _token: '{{ csrf_token() }}'
            },
            url: "{{ route('get_document_types') }}",
            success: function(response) {
                if (response.success == 1) {
                    $('#assign-document-body').html(response.content);
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
        $('#assign-document-modal').modal('show');
    });
    $(document).on('click', '.assign-practice', function() {
        ref = $(this).attr('ref');
        $.ajax({
            type: "post",
            data: {
                ref: ref,
                _token: '{{ csrf_token() }}'
            },
            url: "{{ route('get_practices') }}",

            success: function(response) {
                if (response.success == 1) {
                    $('#assign-practice-body').html(response.content);
                    $(function() {
                        $('[name="user_practices[]"]').gs_multiselect();
                    });
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
    $(document).on('click', '.assign-team', function() {
        ref = $(this).attr('ref');
        $.ajax({
            type: "post",
            data: {
                ref: ref,
                _token: '{{ csrf_token() }}'
            },
            url: "{{ route('get_teams') }}",
            success: function(response) {
                if (response.success == 1) {
                    $('#assign-team-body').html(response.content);
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
        $('#assign-team-modal').modal('show');
    });
    var form2 = document.getElementById('assign-department-form');
    form2.addEventListener('submit', event => {
        event.preventDefault();
        let formData2 = new FormData(form2);
        formData2.append('ref', ref);
        fetch(form2.action, {
                method: "POST",
                body: formData2
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(data => {
                if (data.success == 1) {
                    $('#assign-department-modal').modal('hide');
                    $('#assign-department-body').html('');
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
    var form4 = document.getElementById('assign-document-form');
    form4.addEventListener('submit', event => {
        event.preventDefault();
        let formData2 = new FormData(form4);
        formData2.append('ref', ref);
        fetch(form4.action, {
                method: "POST",
                body: formData2
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(data => {
                if (data.success == 1) {
                    $('#assign-document-modal').modal('hide');
                    $('#assign-document-body').html('');
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
    var form3 = document.getElementById('assign-team-form');
    form3.addEventListener('submit', event => {
        event.preventDefault();
        let formData = new FormData(form3);
        formData.append('ref', ref);
        fetch(form3.action, {
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
                    $('#assign-team-modal').modal('hide');
                    $('#assign-team-body').html('');
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
            }).catch(error => console.error("There was a problem with the fetch operation:", error));
    });
    $('#filter-form [type="submit"]').on('click', function(e) {
        e.preventDefault();
        $('#users-table').DataTable().ajax.reload(null, false);
    });
    $('#c_filter').click(function() {
        $('select,input').val('');
        $('#users-table').DataTable().ajax.reload(null, false);
    });
</script>
@endpush

@endsection