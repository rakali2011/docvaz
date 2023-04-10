@extends('includes.main')
@section('content')

<style>
    .ar-time {
        background-image: url("{{ asset('assets/assets/images/response-time.svg') }}");
        background-color: none;
        background-repeat: no-repeat;
        font-size: 28px;
        font-weight: bolder;
        color: #628881;
        text-align: center;
        background-position: center;
        margin-top: 7px;
        height: 145px;
        padding-top: 12px;
        padding-left5px;
        padding-right: 40px;
        background: cover;
    }

    .ar-resp-time {
        background-image: url("{{ asset('assets/assets/images/resol-time-img.svg') }}");
        background-color: none;
        background-repeat: no-repeat;
        font-size: 27px;
        font-weight: bolder;
        color: #628881;
        text-align: center;
        background-position: center;
        margin-top: 10px;
        height: 160px;
        padding-top: 18px;
        padding-right: 41px;
        background: cover;
    }

    .p-5 {
        padding: 60px;
        margin-left: 30px;
    }

    .ct-chart-line .ct-label,
    .ct-chart-bar .ct-label {
        display: block;
        display: -webkit-box;
        display: -moz-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex
    }

    .card_menu {
        color: #000;

    }

    .card_menu .box {
        border-radius: 15px;
        padding-left: 20px !important;
    }

    .card_menu .box>span {
        background-color: #fff;
        color: #0a0c0d;
        border-radius: 20px;
        padding: 0px 10px 0px 10px;
        font-weight: 600;
    }

    img {
        height: 18px;
        width: 18px;
    }

    hr {
        border-color: #dddddd;
    }

    .table>thead>tr>th {
        font-size: 14px;
    }

    .table>tbody>tr>td {
        font-size: 12px;
    }

    .modal-dialog.modal-dialog-centered {
        max-width: 80vw;
    }

    main.main-content {
        background: #eef1f9 !important;
    }
</style>
{{-- <h3>Dashboard</h3>--}}
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="row align-items-center ">
                <div class="col">
                    {{-- <h2 class="h5 page-title">Welcome!</h2>--}}
                </div>
                <div class="col-auto">
                    <form class="form-inline">
                        <div class="form-group d-none d-lg-inline">
                            <label for="reportrange" class="sr-only">Date Ranges</label>
                            <div id="reportrange" class="px-2 py-2">
                                <span style="color: #0a0c0d;" class="small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-sm"><span class="fe fe-refresh-ccw fe-16 text-muted"></span></button>
                            <button type="button" class="btn btn-sm mr-2"><span class="fe fe-filter fe-16 text-muted"></span></button>
                        </div>
                    </form>
                </div>
            </div>
            {{--DOCUMENT PORTION--}}
            <div id="document_toggle" class="document_toggle">
                <h4>Document Portal</h4>
            </div>
            <div class="row mb-2-p-0">
                <div class="col-lg-12 col-md-12">
                    <div class="card shadow mb-3" style="background:aliceblue;">
                        <div class="card-header shadow text-center">
                            <h5>Documents</h5>
                        </div>
                        <div class="card-body shadow p-4 card_menu">
                            <div class="row">
                                @foreach($documents as $key => $document)
                                <div class="col-lg-3 box col-mg-3 p-2 m-2 document-type" data-id="{{ $document->id }}" style="background-color: #b1cfffd9">{{ $document->name }}<span class="float-right">{{ $document->files_count }}</span></div>
                                @endforeach
                                <div class="col-lg-3 box col-mg-3 p-2 m-2" style="background-color: #b1cfffd9">Total<span class="float-right">{{ $documents->total }}</span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="card shadow" style="background:aliceblue;">
                        <div class="card-header shadow text-center">
                            <h5>Document Status</h5>
                        </div>
                        <div class="card-body p-2 position-relative">
                            <div class="chartbox mr-4">
                                <div id="donutChart"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="card shadow mb-3" style="background:aliceblue;">
                        <div class="card-header shadow text-center">
                            <h5>Users</h5>
                        </div>
                        <div class="card-body shadow p-4 card_menu">
                            <div class="row">
                                <div class="col-4">
                                    @foreach($users as $key => $user)
                                    <div class="box p-2 m-2 user-designation" data-id="{{ $user->id }}" style="background-color: #b1cfffd9">{{ $user->name }}<span class="float-right">{{ $user->users_count }}</span></div>
                                    @endforeach
                                </div>
                                <div class="col-8">
                                    @foreach($designations as $key => $designation)
                                    <div class="box p-2 m-2 user-designation" data-id="{{ $designation->id }}" style="background-color: #b1cfffd9">{{ $designation->name }}<span class="float-right">{{ $designation->users_count }}</span></div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{--D-MAIL PORTION--}}
            <div id="dmail_toggle" class="dmail_toggle" style="margin-bottom: 30px;">
                <h4> D-Mail (Secure Messaging Channel) </h4>
            </div>
            <div class="row grid-margin mb-2 shadow">
                <div class="col-12">
                    <div class="card shadow card-statistics">
                        <div class="card-body">
                            <div class="d-flex flex-column flex-md-row align-items-center justify-content-between">
                                <div class="statistics-item">
                                    <p>
                                        <img src="{{asset('assets/assets/images/open.svg') }}" class="f-right">
                                        Open
                                    </p>
                                    <h5>540</h5>
                                </div>
                                <div class="statistics-item">
                                    <p>
                                        <img src="{{asset('assets/assets/images/inprogress.svg') }}" class="f-right">
                                        Inprocess
                                    </p>
                                    <h5>123</h5>
                                </div>
                                <div class="statistics-item">
                                    <p>
                                        <img src="{{asset('assets/assets/images/closed-tickets.svg') }}" class="f-right">
                                        Closed
                                    </p>
                                    <h5>350</h5>
                                </div>
                                <div class="statistics-item">
                                    <p>
                                        <img src="{{asset('assets/assets/images/on-hold.svg') }}" class="f-right">

                                        Onhold
                                    </p>
                                    <h5>75</h5>
                                </div>
                                <div class="statistics-item">
                                    <p>
                                        <img src="{{asset('assets/assets/images/on-hold.svg') }}" class="f-right">
                                        Reopen
                                    </p>
                                    <h5>90</h5>
                                </div>
                                <div class="statistics-item">
                                    <p>
                                        <img src="{{asset('assets/assets/images/overdue.svg') }}" class="f-right">
                                        Reopen
                                    </p>
                                    <h5>25</h5>
                                </div>
                                <div class="statistics-item">
                                    <p>
                                        <img src="{{asset('assets/assets/images/overdue.svg') }}" class="f-right">
                                        Overdue
                                    </p>
                                    <h5>750</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row grid-margin mb-2 shadow">
                <div class="col-md-6 col-lg-6 mb-3">
                    <div class="card chart-cover clock-cover" style="border-bottom: none;">
                        <div class="card-header shadow">
                            <h5 class="text-center">Recent Statistics</h5>
                        </div>
                        <div class="card-body">
                            <div class="row items-align-baseline">
                                <div class="col-lg-6 col-sm-12 col-md-6 col-xs-12">
                                    <div class="chart-box" align="center">
                                        <div class="chartbox mr-4">
                                            <div id="donutChart2"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12 col-md-6 col-xs-12">
                                    <div class="chart-box mx-3" align="center">
                                        <div class="row" style="padding-bottom: 0;">
                                            <div class="img-clock">
                                                <div class="ar-time responsive" alt="open-tickets">
                                                    <div class="clock-text">
                                                        <p class="p-5">2:05</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="mb-0 m-3 text-center" style="color: #000000 !important;"><strong class="mb-0 text-center text-uppercase">Avg. Response Time</strong></p>
                                </div>
                            </div>
                        </div> <!-- .card-body -->
                    </div> <!-- .card -->
                </div> <!-- .col -->
                <div class="col-md-3 col-lg-3 mb-3">
                    <div class="card shadow">
                        <div class="card-header shadow">
                            <h5 class="card-title text-center">Resolution Statics</h5>
                        </div>
                        <div class="card-body my-n2">
                            <div class="row" style="padding-bottom: 0;">
                                <div class="img-clock">
                                    <div class="ar-resp-time responsive" alt="open-tickets">
                                        <div class="clock-text">
                                            <p class="p-5">51:05</p>
                                        </div>
                                    </div>
                                </div>
                                <p class="mb-0 p-3 text-center" style="color: #000000 !important;"><strong class="mb-0 text-uppercase">Average Resolution Time</strong></p>
                            </div>
                        </div>
                    </div>
                </div> <!-- Striped rows -->
                <div class="col-md-3 col-lg-3 mb-3">
                    <div class="card shadow">
                        <div class="card-header shadow">
                            <h5 class="card-title text-center">Ticket Priority</h5>
                        </div>
                        <div class="card-body my-n2">
                            <div id="columnChart2"></div>
                        </div>
                    </div>
                </div> <!-- Striped rows -->
                <div class="col-md-12 col-lg-12 mb-3">
                    <div class="card shadow">
                        <div class="card-header shadow">
                            <h5 class="text-center">Ticket Send to / Received From</h5>
                        </div>
                        <div class="card-body shadow card_menu">
                            <div class="row">
                                <div class="col-lg-2 col-md-2 col-sm-12 box pt-3 m-2" style="background-color: #fdaa57; ">
                                    <h6 class="text-center">Coding</h6>
                                    <hr class="m-1">
                                    <p>My<b class="float-right">10</b></p>
                                    <p>BellMedEx<b class="float-right">0</b></p>
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12 box pt-3 m-2" style="background-color: #fdaa57; ">
                                    <h6 class="text-center">Patient Help Desk</h6>
                                    <hr class="m-1">
                                    <p>My<b class="float-right">8</b></p>
                                    <p>BellMedEx<b class="float-right">4</b></p>
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12 box pt-3 m-2" style="background-color: #fdaa57; ">
                                    <h6 class="text-center">Client Relation Dept</h6>
                                    <hr class="m-1">
                                    <p>My<b class="float-right">6</b></p>
                                    <p>BellMedEx<b class="float-right">4</b></p>
                                </div>

                                <div class="col-lg-2 col-md-2 col-sm-12 box pt-3 m-2" style="background-color: #fdaa57; ">
                                    <h6 class="text-center">Sales</h6>
                                    <hr class="m-1">
                                    <p>My<b class="float-right">4</b></p>
                                    <p>BellMedEx<b class="float-right">8</b></p>
                                </div>

                                <div class="col-lg-2 col-md-2 col-sm-12 box pt-3 m-2" style="background-color: #fdaa57; ">
                                    <a data-toggle="modal" id="smallButton" data-target="#smallModal" title="show">
                                        <h6 class="text-center">Billing</h6>
                                    </a>
                                    <hr class="m-1">
                                    <p>My<b class="float-right">1</b></p>
                                    <p>BellMedEx<b class="float-right">4</b></p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 box pt-3 m-2" style="background-color: #fdaa57; ">
                                    <h6 class="text-center">System Support</h6>
                                    <hr class="m-1">
                                    <p>My<b class="float-right">4</b></p>
                                    <p>BellMedEx<b class="float-right">6</b></p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 box pt-3 m-2" style="background-color: #fdaa57; ">
                                    <h6 class="text-center">Accounts Payable / Invoicing</h6>
                                    <hr class="m-1">
                                    <p>My<b class="float-right">5</b></p>
                                    <p>BellMedEx<b class="float-right">0</b></p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 box pt-3 m-2" style="background-color: #fdaa57; ">
                                    <h6 class="text-center">Credentialing / Enrollment</h6>
                                    <hr class="m-1">
                                    <p>My<b class="float-right">3</b></p>
                                    <p>BellMedEx<b class="float-right">1</b></p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div> <!-- Striped rows -->
            </div>
        </div>
        <!-- .col-12 -->
    </div>
    <!-- .row -->
</div>
<!-- .container-fluid -->
<!-- small modal -->
<div class="modal fade" id="smallModal" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="text-center">Billing</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="smallBody">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 m-0">
                        <div class="card p-2 pt-3 m-0 box" style="background-color: #fdaa57; ">
                            <h6 class="text-center">Claim Submission</h6>
                            <hr class="m-1">
                            <p>My<b class="float-right">10</b></p>
                            <p>BellMedEx<b class="float-right">0</b></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 m-0">
                        <div class="card p-2 pt-3 m-0 box" style="background-color: #fdaa57; ">
                            <h6 class="text-center">Benefits / Eligibility</h6>
                            <hr class="m-1">
                            <p>My<b class="float-right">10</b></p>
                            <p>BellMedEx<b class="float-right">0</b></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 m-0">
                        <div class="card p-2 pt-3 m-0 box" style="background-color: #fdaa57; ">
                            <h6 class="text-center">Payment Posting</h6>
                            <hr class="m-1">
                            <p>My<b class="float-right">10</b></p>
                            <p>BellMedEx<b class="float-right">0</b></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 m-0">
                        <div class="card p-2 pt-3 m-0 box" style="background-color: #fdaa57; ">
                            <h6 class="text-center">Authorization</h6>
                            <hr class="m-1">
                            <p>My<b class="float-right">10</b></p>
                            <p>BellMedEx<b class="float-right">0</b></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 m-0">
                        <div class="card p-2 pt-3 m-0 box" style="background-color: #fdaa57; ">
                            <h6 class="text-center">Financial Report</h6>
                            <hr class="m-1">
                            <p>My<b class="float-right">10</b></p>
                            <p>BellMedEx<b class="float-right">0</b></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 m-0">
                        <div class="card p-2 pt-3 m-0 box" style="background-color: #fdaa57; ">
                            <h6 class="text-center">Aging / Account Receivable</h6>
                            <hr class="m-1">
                            <p>My<b class="float-right">10</b></p>
                            <p>BellMedEx<b class="float-right">0</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="file-listing" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form action="" method="POST" id="filter-form">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="verticalModalTitle">Files</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="doc_type">
                    <div class="form-group col-12">
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
                <div class="modal-footer">
                    <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
@push('scripts')
<script>
    // display a modal (small modal)
    $(document).on('click', '#smallButton', function(event) {
        event.preventDefault();
        let href = $(this).attr('data-attr');
        $.ajax({
            url: href,
            beforeSend: function() {
                $('#loader').show();
            },
            // return the result
            success: function(result) {
                $('#smallModal').modal("show");
                $('#smallBody').html(result).show();
            },
            complete: function() {
                $('#loader').hide();
            },
            error: function(jqXHR, testStatus, error) {
                console.log(error);
                alert("Page " + href + " cannot open. Error:" + error);
                $('#loader').hide();
            },
            timeout: 8000
        })
    });
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
    $('.document-type').click(function() {
        id = $(this).data('id');
        $('#doc_type').val(id);
        $('#files-table').DataTable().ajax.reload(null, false);
        $('#file-listing').modal('show');
    });
    // Document Statistics
    var donutchart,
        donutChartOptions = {
            series: <?= json_encode($donut_value); ?>,
            chart: {
                type: "donut",
                height: 250,
                zoom: {
                    enabled: !1
                }
            },
            theme: {
                mode: colors.chartTheme
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: "40%"
                    },
                    expandOnClick: !1
                }
            },
            labels: <?= json_encode($donut_name); ?>,
            legend: {
                position: "bottom",
                fontFamily: base.defaultFontFamily,
                fontWeight: 400,
                labels: {
                    colors: colors.mutedColor,
                    useSeriesColors: !1
                },
                horizontalAlign: "left",
                fontFamily: base.defaultFontFamily,
                markers: {
                    width: 10,
                    height: 10,
                    strokeWidth: 0,
                    strokeColor: "#fff",
                    radius: 6,
                },
                itemMargin: {
                    horizontal: 5,
                    vertical: 2
                },
                onItemClick: {
                    toggleDataSeries: !0
                },
                onItemHover: {
                    highlightDataSeries: !0
                },
            },
            stroke: {
                colors: [colors.borderColor],
                width: 1
            },
            fill: {
                opacity: 1,
                colors: chartColors
            },
        },
        donutchartCtn = document.querySelector("#donutChart");
    donutchartCtn &&
        (donutchart = new ApexCharts(donutchartCtn, donutChartOptions)).render();
</script>
@endpush
@endsection