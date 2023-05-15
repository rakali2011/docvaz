@extends('includes.main')
@section('content')
<style>
    .tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
    }

    .tabcontent {
        display: none;
        padding: 6px 12px;
        border: 1px solid #ccc;
        border-top: none;
    }

    .tabcontent .card-body {
        border: 1px solid #ccc;
    }

    .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        transition: 0.3s;
    }

    .tab button:hover {
        background-color: #ddd;
    }

    .tab .active {
        background-color: #ccc;
    }

    .tabcontent {
        display: none;
        padding: 6px 12px;

        border: 1px solid #ccc;
        border-top: none;
    }
</style>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="row align-items-center ">
                <div class="col">
                    <!-- <h2 class="h5 page-title">Welcome!</h2> -->
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
            <div id="document_toggle" class="document_toggle">
                <h4>Dev Dashboard</h4>
                <div class="row">
                    <div class="col-md-12">
                        <div class="tab">
                            @foreach(companies() as $key => $company)
                            @if($key==0)
                            <button type="button" class="tablinks active" onclick="openCity(event, '{{ $company->prefix }}')" data-id="{{ $company->id }}" data-status="false">{{ $company->name }}</button>
                            @else
                            <button type="button" class="tablinks" onclick="openCity(event, '{{ $company->prefix }}')" data-id="{{ $company->id }}" data-status="false">{{ $company->name }}</button>
                            @endif
                            @endforeach
                        </div>
                        @foreach(companies() as $key => $company)
                        @if($key==0)
                        <div id="{{ $company->prefix }}" class="tabcontent" style="display: block;">
                            <div class="card-body">
                                <div class="row"></div>
                            </div>
                        </div>
                        @else
                        <div id="{{ $company->prefix }}" class="tabcontent" style="display: none;">
                            <div class="card-body">
                                <div class="row"></div>
                            </div>
                        </div>
                        @endif
                        @endforeach
                    </div>
                    <div class="col-md-6"></div>
                </div>
            </div>
        </div>
    </div>
</div>
@push('scripts')
<script>
    function openCity(evt, cityName) {
        var i, tabcontent, tablinks, company_id;
        company_id = evt.target.getAttribute("data-id");
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace("active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
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
            }
        });
    }
</script>
@endpush
@endsection