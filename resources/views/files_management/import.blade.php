@extends('includes.main')
@section('content')
<style>
  .uppy-Dashboard-progressindicators {
    display: none;
  }
</style>
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">{{ (@$file) ? 'Update File' : 'Import Files' }}</h2>
      <div class="card shadow mb-4">
        <form action="{{ (@$file) ? route('update_file', ['id' => Crypt::encrypt(@$file->id)]) : route('post_file')  }}" id="import-files" method="POST" enctype="multipart/form-data">
          @csrf
          <div class="card-body">
            <div class="row">
              @if(!@$file)
              <div class="col-md-6">
                <div class="form-group mb-3">
                  <label for="practice">Practice</label>
                  <select class="form-control select2-multi @error('practice') is-invalid @enderror" name="practice[]" multiple="practice" id="practice">
                    @foreach ($practices as $item)
                    <option value="{{ Crypt::encrypt($item->id) }}" {{(@@$file) ? (@@$file->practice_id==$item->id ? 'selected' : '') : '' }}>{{ $item->name }}</option>
                    @endforeach
                  </select>
                  @error('practice')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              @endif
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="date">Date</label>
                  <input name="date" type="date" id="date" class="form-control @error('date') is-invalid @enderror" value="{{ (@$file)?@$file->date:old('date') }}">
                  @error('date')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="status">Status</label>
                  <select class="form-control @error('practice') is-invalid @enderror" name="status" id="status">
                    <option value="">--Please Select--</option>
                    @foreach (statuses('document') as $status)
                    <option value="{{ $status->id }}" {{(@$file) ? (@$file->status==$status->id ? 'selected' : '') : '' }}>{{ $status->name }}</option>
                    @endforeach
                  </select>
                  @error('status')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group mb-3">
                  <label for="doc_type">Doc Type</label>
                  <select class="form-control @error('practice') is-invalid @enderror" name="doc_type" id="doc_type">
                    <option value="">--Please Select--</option>
                    @foreach (document_types() as $document_type)
                    <option value="{{ $document_type->id }}" {{(@$file) ? (@$file->document_type==$document_type->id ? 'selected' : '') : '' }}>{{ $document_type->name }}</option>
                    @endforeach
                  </select>
                  @error('doc_type')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              @if(!@$file)
              <div class="col-md-12">
                <div class="form-group mb-3">
                  <div id="uppy"></div>
                </div>
              </div>
              @endif
              <div class="col-12">
                <input type="submit" value="{{ 'Save' }}" class="btn btn-success float-right">
              </div>
            </div>
          </div>
        </form>
      </div> <!-- / .card -->

    </div> <!-- .col-12 -->
  </div> <!-- .row -->
</div>
@push('scripts')
<script>
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
  var importform = document.getElementById('import-files');
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