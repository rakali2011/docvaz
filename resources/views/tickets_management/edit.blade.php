@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <h2 class="page-title menu-head">Update Ticket</h2>
      <div class="card shadow mb-4">
        {!! Form::model($ticket, ['method' => 'PATCH','route' => ['tickets.update', $ticket->id]]) !!}
        <div class="card-body">
          <div class="row">
            <div class="col-md-12">
              <div class="form-group mb-3">
                <label for="message">Message</label>
                <textarea name="message" id="message" class="form-control @error('message') is-invalid @enderror" rows="10" required="required">{{ $ticket->message }}</textarea>
                @error('message')
                <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
                </span>
                @enderror
              </div>
            </div>
            <div class="col-md-12">
              <input type="submit" value="{{ 'Update' }}" class="btn btn-success float-right">
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
</script>
@endpush
@endsection