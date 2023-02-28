@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <h2 class="page-title menu-head">Create Ticket</h2>
      <div class="card shadow mb-4">
        {!! Form::open(array('route' => 'tickets.store','method'=>'POST','id'=>'create-ticket','enctype'=>'multipart/form-data')) !!}
        <div class="card-body">
          <div class="row">
            @role('dev')
            <div class="col-md-4">
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
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="from">From</label>
                <select name="from" id="from" class="form-control select2-multi @error('from') is-invalid @enderror">
                  @foreach ($departments as $item)
                  <option value="{{ $item->id }}">{{ $item->name }}</option>
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
                <label for="to_provider">To Provider</label>
                <select name="to_provider[]" id="to_provider" class="form-control select2-multi @error('to_provider') is-invalid @enderror" multiple="multiple" required="required">
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
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="type">Type</label>
                <select name="type" id="type" class="form-control @error('type') is-invalid @enderror">
                  @foreach ($types as $item)
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
            <div class="col-md-4">
              <div class="form-group mb-3">
                <label for="priority">Priority</label>
                <select name="priority" id="priority" class="form-control @error('priority') is-invalid @enderror">
                  @foreach ($priorities as $item)
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
            <div class="col-md-12">
              <label for="">Attachments</label>
              <div class="form-group mb-3">
                <div id="uppy"></div>
              </div>
            </div>
            <div class="col-md-12">
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
    // access the files data selected by uppy
    const files = uppy.getFiles();
    // Create a FormData object
    const formData = new FormData(importform);

    // Append the files to the FormData object
    files.forEach(file => {
      formData.append('files[]', file.data);
    });
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
</script>
@endpush
@endsection