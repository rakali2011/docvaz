<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="favicon.ico">
  <title>Docuhub - Dashboard</title>
  @livewireStyles
  @include('includes.header_scripts')
  <style>
    .nav-heading {
      text-align: center;
      width: 100%;
      font-weight: bold;
      color: black !important;
    }

    th {
      font-weight: bold;
      color: black !important;
    }

    .menu-head {
      color: #001a4e;
      font-weight: 700;
      font-size: 1.75rem;
    }

    .nav-active {
      background: #f8f9fa;
      color: #1b68ff !important;
    }
  </style>
</head>

<body class="vertical  light">
  <div class="wrapper">
    @include('includes.header')
    @include('includes.sidebar')
    <main role="main" class="main-content">
      @yield('content')
      @include('includes.notifications')
      @include('includes.shortcuts')
    </main>
  </div> <!-- .wrapper -->
  @livewireScripts
  @include('includes.footer_scripts')
  <script>
    $(document).ready(function() {
      $('.menu').addClass('collapsed');
      $('.menu').addClass('collapsed');
      $("#{{ @$data['menu'] }}").removeClass('collapsed');
      $("#{{ @$data['menu'] }}").next().addClass('show');
      $("#{{ @$data['sub_menu'] }}").addClass('nav-active');
      $("#{{ @$data['menu'] }}").addClass('nav-active');
      $('[name="check-all"]').click(function() {
        var id = $(this).attr("id");
        $('.' + id).prop('checked', this.checked);
      });
    });
    $('#dataTable-1').DataTable({
      autoWidth: true,
      "lengthMenu": [
        [16, 32, 64, -1],
        [16, 32, 64, "All"]
      ],
      "aaSorting": []
    });
    /* defind global options */
    Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
    Chart.defaults.global.defaultFontColor = colors.mutedColor;
    $('.select2').select2({
      theme: 'bootstrap4',
    });
    $('.select2-multi').select2({
      // multiple: true,
      theme: 'bootstrap4',
    });
    $('.drgpicker').daterangepicker({
      singleDatePicker: true,
      timePicker: false,
      showDropdowns: true,
      locale: {
        format: 'MM/DD/YYYY'
      }
    });
    $('.time-input').timepicker({
      'scrollDefault': 'now',
      'zindex': '9999' /* fix modal open */
    });
    /** date range picker */
    if ($('.datetimes').length) {
      $('.datetimes').daterangepicker({
        timePicker: true,
        startDate: moment().startOf('hour'),
        endDate: moment().startOf('hour').add(32, 'hour'),
        locale: {
          format: 'M/DD hh:mm A'
        }
      });
    }
    var start = moment().subtract(29, 'days');
    var end = moment();

    function cb(start, end) {
      $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    }
    $('#reportrange').daterangepicker({
      startDate: start,
      endDate: end,
      ranges: {
        'Today': [moment(), moment()],
        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
      }
    }, cb);
    cb(start, end);
    $('.input-placeholder').mask("00/00/0000", {
      placeholder: "__/__/____"
    });
    $('.input-zip').mask('00000-000', {
      placeholder: "____-___"
    });
    $('.input-money').mask("#.##0,00", {
      reverse: true
    });
    $('.input-phoneus').mask('(000) 000-0000');
    $('.input-mixed').mask('AAA 000-S0S');
    $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ', {
      translation: {
        'Z': {
          pattern: /[0-9]/,
          optional: true
        }
      },
      placeholder: "___.___.___.___"
    });
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
      'use strict';
      window.addEventListener('load', function() {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function(form) {
          form.addEventListener('submit', function(event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add('was-validated');
          }, false);
        });
      }, false);
    })();
  </script>
  @stack('scripts')
</body>

</html>