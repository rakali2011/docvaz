@extends('includes.main')
@section('content')
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
            </div>
        </div>
    </div>
</div>
@endsection