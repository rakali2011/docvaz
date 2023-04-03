@extends('includes.main')
@section('content')
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <span class="mb-2 page-title menu-head">Departments</span>
      @can('add department')
      <a class="btn btn-primary float-right" href="{{ route('add_department') }}">Create Department</a>
      @endcan
      <p class="card-text"></p>
      <div class="row my-4">
        <div class="col-md-12">
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

            table {
              font-family: arial, sans-serif;
              border-collapse: collapse;
              width: 100%;
            }

            td,
            th {
              border: 1px solid #dddddd;
              padding: 8px;
            }

            /*Change color to gray*/
            tr:nth-child(even) {
              background-color: #dddddd;
            }

            .actived a {
              color: green
            }

            .actived a:hover {
              font-weight: bold
            }

            .deactivated a {
              color: red
            }

            .deactivated a:hover {
              font-weight: bold
            }

            .available {
              color: green;
            }

            .disable {
              color: red;
              font-weight: bold
            }

            .intraining {
              color: blue;
              font-weight: bold
            }

            .vacation {
              font-weight: bold
            }
          </style>
          <div class="w3-animate-opacity">
            <div class="tab">
              @foreach($departments as $key => $department)
              @if($department->pareint_id==0)
              <button class="tablinks {{ $key==0 ? 'active' : '' }}" onclick="openCity(event, 'dept-{{ $department->id }}')">{{ ucwords($department->name) }}</button>
              @endif
              @endforeach
            </div>
            @foreach($departments as $key => $department)
            <div id="dept-{{ $department->id }}" class="tabcontent" {{ $key==0 ? 'style=display:block!important' : '' }}>
              <table class="w3-animate-opacity">
                <tr>
                  <th>Name</th>
                  <th>Action</th>
                </tr>
                @foreach($departments as $index => $depart)
                @if($department->id==$depart->parent_id || $department->id==$depart->id)
                <tr>
                  <td>{{ $depart->name }}</td>
                  <td>
                    @can('update department')
                    <a class="btn btn-sm btn-primary" href="{{ route('edit_department', ['id' => Crypt::encrypt($depart->id)]) }}">Edit</a>
                    @endcan
                    @can('delete departmen')
                    {!! Form::open(['method' => 'DELETE','route' => ['statuses.destroy', $depart->id],'style'=>'display:inline']) !!}
                    {!! Form::submit('Delete', ['class' => 'btn btn-sm btn-danger']) !!}
                    {!! Form::close() !!}
                    @endcan
                  </td>
                </tr>
                @endif
                @endforeach
              </table>
            </div>
            @endforeach
          </div>
        </div>
      </div>
    </div> <!-- .col-12 -->
  </div> <!-- .row -->
</div>
@push('scripts')
<script>
  function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
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
  }

  function defaultStatus(id, type) {
    console.log(id + type);
    $.ajax({
      type: "POST",
      url: "{{ route('default_status') }}",
      data: {
        id,
        type,
        _token: '{{ csrf_token() }}'
      },
      dataType: "JSON",
      success: function(response) {
        console.log(response);
      }
    });
  }
</script>
@endpush
@endsection