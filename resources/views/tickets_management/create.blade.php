@extends('includes.main')
@section('content')
<style>
    .uppy-StatusBar.is-waiting {
        display: none;
    }

    .uppy-Dashboard:not(.uppy-size--md) .uppy-Dashboard-Item-preview {
        width: 35px;
        height: 35px;
    }
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title menu-head abc">Create New Ticket</h2>
            <!-- sdsadsad -->
            <div class="card shadow mb-4">
                {!! Form::open(array('route' => 'tickets.store','method'=>'POST','id'=>'create-ticket','enctype'=>'multipart/form-data')) !!}
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="row">
                                @role('dev')
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="company">Company</label>
                                        <select class="form-control @error('company') is-invalid @enderror" name="company" id="company">
                                            @foreach (companies() as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('company')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                @endrole
                                @if(Auth::user()->type==2)
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="from">From</label>
                                        <select name="from" id="from" class="form-control select2-multi @error('from') is-invalid @enderror">
                                            @foreach ($departments as $department)
                                            @if($department->parent_id==0)
                                            <optgroup label="{{ $department->name }}">
                                                <option value="{{ $department->id }}">{{ $department->name }}</option>
                                                @foreach ($departments as $dep)
                                                @if($department->id==$dep->parent_id)
                                                <option value="{{ $dep->id }}">{{ $dep->name }}</option>
                                                @endif
                                                @endforeach
                                            </optgroup>
                                            @endif
                                            @endforeach
                                        </select>
                                        @error('from')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="">To</label><br>
                                        <div class="form-check form-check-inline">
                                            <input type="radio" name="is_external" id="client" value="1" class="form-check-input" checked="checked">
                                            <label class="form-check-label" for="client">Client</label>
                                        </div>
                                        @can('external ticket')
                                        <div class="form-check form-check-inline">
                                            <input type="radio" name="is_external" id="company" value="0" class="form-check-input">
                                            <label class="form-check-label" for="company">{{ $company_name }}</label>
                                        </div>
                                        @endcan
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="to_provider">To</label>
                                        <div id="to_provider_div">
                                            <select name="to_provider" id="to_provider" class="form-control select2-multi @error('to_provider') is-invalid @enderror">
                                                @foreach ($practices as $item)
                                                <option value="{{ $item->id }}">{{ $item->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        @can('external ticket')
                                        <div id="to_department_div">
                                            <select name="to_department" id="to_department" class="form-control select2-multi @error('to_department') is-invalid @enderror">
                                                @foreach ($departments as $department)
                                                @if($department->parent_id==0)
                                                <optgroup label="{{ $department->name }}">
                                                    <option value="{{ $department->id }}">{{ $department->name }}</option>
                                                    @foreach ($departments as $dep)
                                                    @if($department->id==$dep->parent_id)
                                                    <option value="{{ $dep->id }}">{{ $dep->name }}</option>
                                                    @endif
                                                    @endforeach
                                                </optgroup>
                                                @endif
                                                @endforeach
                                            </select>
                                        </div>
                                        @endcan
                                        @error('to_provider')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                @endif
                                @if(Auth::user()->type==3)
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label for="to_provider">From</label>
                                        <select name="to_provider" id="to_provider" class="form-control @error('to_provider') is-invalid @enderror" required="required">
                                            @foreach ($practices as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('to_provider')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group mb-3">
                                        <label for="from">To Department</label>
                                        <select name="from" id="from" class="form-control @error('from') is-invalid @enderror">
                                            @foreach ($departments as $department)
                                            @if($department->parent_id==0)
                                            <optgroup label="{{ $department->name }}">
                                                <option value="{{ $department->id }}">{{ $department->name }}</option>
                                                @foreach ($departments as $dep)
                                                @if($department->id==$dep->parent_id)
                                                <option value="{{ $dep->id }}">{{ $dep->name }}</option>
                                                @endif
                                                @endforeach
                                            </optgroup>
                                            @endif
                                            @endforeach
                                        </select>
                                        @error('from')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group mb-3">
                                        <label for="share_to">Share To</label>
                                        <select name="share_to[]" id="share_to" class="form-control select2-multi @error('share_to') is-invalid @enderror" multiple="multiple">
                                            @foreach ($share_to as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('share_to')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                @endif
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="cc">CC</label>
                                        <select name="cc[]" id="cc" class="form-control select2-multi @error('cc') is-invalid @enderror" multiple="multiple">
                                            @foreach ($departments as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('cc')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="type">Type</label>
                                        <select name="type" id="type" class="form-control @error('type') is-invalid @enderror">
                                            @foreach (ticket_types() as $item)
                                            <option value="{{ $item }}">{{ $item }}</option>
                                            @endforeach
                                        </select>
                                        @error('type')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="priority">Priority</label>
                                        <select name="priority" id="priority" class="form-control @error('priority') is-invalid @enderror">
                                            @foreach (ticket_priorities() as $item)
                                            <option value="{{ $item }}">{{ $item }}</option>
                                            @endforeach
                                        </select>
                                        @error('priority')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group mb-3">
                                        <label for="subject">Subject</label>
                                        <input type="text" name="subject" id="subject" class="form-control @error('subject') is-invalid @enderror" value="{{ old('subject') }}" required="required">
                                        @error('subject')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="col-md-12">
                                <label for="">Attachments</label>
                                <div class="form-group mb-3">
                                    <div id="uppy"></div>
                                </div>
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
                        <div class="col-md-12">
                            <input type="submit" value="{{ 'Save' }}" class="btn btn-success float-right">
                        </div>
                    </div>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
</div>
@push('scripts')
<script src="{{ asset('assets/ckeditor/ckeditor.js') }}"></script>
<script>
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
    var importform = document.getElementById('create-ticket');
    importform.addEventListener('submit', event => {
        event.preventDefault();
        const files = uppy.getFiles();
        const formData = new FormData(importform);
        files.forEach(file => {
            formData.append('files[]', file.data);
        });
        var data = CKEDITOR.instances.message.getData();
        formData.append('message', data);
        fetch(importform.action, {
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
                    Swal.fire({
                        icon: 'success',
                        text: data.message,
                    });
                    uppy.reset();
                    window.location.replace(data.route);
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
        is_external();
    });
    $('[name="is_external"]').change(function() {
        is_external();
    });

    function is_external() {
        $('#to_department_div').hide();
        $('#to_provider_div').hide();
        if ($('[name="is_external"]:checked').val() == 1) {
            $('[for="to_provider"]').text('Client');
            $('#to_provider_div').show();
        } else {
            $('[for="to_provider"]').text('Department');
            $('#to_department_div').show();
        }
    }
</script>
@endpush
@endsection