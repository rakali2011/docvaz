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
    margin-top: 16px;
    height: 140px;
    padding-top: 10px;
    padding-right: 40px;
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
    border-radius: 20px;
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
</style>
<h3>Dashboard</h3>
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
      <div class="row m-0-p-0">
        <div class="col-lg-8 col-md-8">
          <div class="card shadow">
            <div class="card-header shadow text-center">
              <h5>Documents/Batch Type</h5>
            </div>
            <div class="card-body shadow p-4 card_menu">
              <div class="row">
                <div class="col-lg-2 box col-lg-3 p-2 m-2" style="background-color: #c6d6ef7a">
                  Reg-Form
                  <span class="float-right">10</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #c6d6ef7a">
                  Day Sheet
                  <span class="float-right">5</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #c6d6ef7a">
                  Call Charges
                  <span class="float-right">0</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #c6d6ef7a">
                  EOBs
                  <span class="float-right">10</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #c6d6ef7a">
                  Medical Notes
                  <span class="float-right">7</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #c6d6ef7a">
                  Ins letters
                  <span class="float-right">2</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #c6d6ef7a">
                  Super Bill
                  <span class="float-right">37</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #c6d6ef7a">
                  Others
                  <span class="float-right">3</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #c6d6ef7a">
                  Reports
                  <span class="float-right">10</span>
                </div>
              </div>
            </div>
          </div>
        </div> {{--d8c8edd6--}}
        <div class="col-lg-4 col-md-4">
          <div class="card shadow">
            <div class="card-header shadow text-center">
              <h5>Document Statistics</h5>
            </div>
            <div class="card-body p-2 position-relative">
              {{-- <canvas id="myChart" style="width:100%;max-width:600px"></canvas>--}}
              <div class="chartbox mr-4">
                <div id="donutChartWidget"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6  mt-3 mb-3">
          <div class="card shadow">
            <div class="card-header text-center">
              <h5>Total Files</h5>
            </div>
            <div class="card-body p-2 position-relative">
              {{-- <canvas id="myChart" style="width:100%;max-width:600px"></canvas>--}}
              <div class="chartbox mr-4">
                <div id="columnChart"></div>
                {{-- <div id="lineChart"></div>--}}
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-6  mt-3 mb-3">
          <div class="card shadow">
            <div class="card-header shadow text-center">
              <h5>Recent Activity</h5>
            </div>
            <div class="card-body my-n2">
              <table class="table table-striped table-responsive table-hover table-borderless">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>2474</td>
                    <th scope="col">Brown, Asher D.</th>
                    <td>Ap #331-7123 Lobortis Avenue</td>
                    <td>13/09/2020</td>
                    <td>
                      <div class="dropdown">
                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" id="dr1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dr1">
                          <a class="dropdown-item" href="#">Edit</a>
                          <a class="dropdown-item" href="#">Remove</a>
                          <a class="dropdown-item" href="#">Assign</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>2786</td>
                    <th scope="col">Leblanc, Yoshio V.</th>
                    <td>287-8300 Nisl. St.</td>
                    <td>04/05/2019</td>
                    <td>
                      <div class="dropdown">
                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" id="dr2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dr2">
                          <a class="dropdown-item" href="#">Edit</a>
                          <a class="dropdown-item" href="#">Remove</a>
                          <a class="dropdown-item" href="#">Assign</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>2786</td>
                    <th scope="col">Leblanc, Yoshio V.</th>
                    <td>287-8300 Nisl. St.</td>
                    <td>04/05/2019</td>
                    <td>
                      <div class="dropdown">
                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" id="dr2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dr2">
                          <a class="dropdown-item" href="#">Edit</a>
                          <a class="dropdown-item" href="#">Remove</a>
                          <a class="dropdown-item" href="#">Assign</a>
                        </div>
                      </div>
                    </td>
                  </tr>

                </tbody>
              </table>
            </div>
          </div>
        </div> <!-- Striped rows -->
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
        <div class="col-md-4 col-lg-4 mb-3">
          <div class="card chart-cover clock-cover" style="border-bottom: none;">
            <div class="card-header shadow">
              <h5 class="text-center">Recent Statistics</h5>
            </div>
            <div class="card-body">
              <div class="row items-align-baseline h-100">
                <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                  <p class="mb-0 text-center" style="color: #000000 !important;"><strong class="mb-0 text-uppercase">Avg. Response Time</strong></p>
                  <div class="chart-box mx-5" align="center">
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
                </div>
              </div>
            </div> <!-- .card-body -->
          </div> <!-- .card -->
        </div> <!-- .col -->
        <div class="col-md-8 col-lg-8 mb-3">
          <div class="card shadow">
            <div class="card-header shadow">
              <h5 class="card-title text-center">Recent Tickets</h5>
            </div>
            <div class="card-body my-n2">
              <table class="table table-striped table-hover table-borderless">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>2474</td>
                    <th scope="col">Brown, Asher D.</th>
                    <td>Ap #331-7123 Lobortis Avenue</td>
                    <td>13/09/2020</td>
                    <td>
                      <div class="dropdown">
                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" id="dr1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dr1">
                          <a class="dropdown-item" href="#">Edit</a>
                          <a class="dropdown-item" href="#">Remove</a>
                          <a class="dropdown-item" href="#">Assign</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>2786</td>
                    <th scope="col">Leblanc, Yoshio V.</th>
                    <td>287-8300 Nisl. St.</td>
                    <td>04/05/2019</td>
                    <td>
                      <div class="dropdown">
                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" id="dr2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dr2">
                          <a class="dropdown-item" href="#">Edit</a>
                          <a class="dropdown-item" href="#">Remove</a>
                          <a class="dropdown-item" href="#">Assign</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>2747</td>
                    <th scope="col">Hester, Nissim L.</th>
                    <td>4577 Cras St.</td>
                    <td>04/06/2019</td>
                    <td>
                      <div class="dropdown">
                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="text-muted sr-only">Action</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#">Edit</a>
                          <a class="dropdown-item" href="#">Remove</a>
                          <a class="dropdown-item" href="#">Assign</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div> <!-- Striped rows -->
        <div class="col-md-12 col-lg-12 mb-3">
          <div class="card shadow ">
            <div class="card-header shadow">
              <h5 class="text-center">Ticket Send to / Received From</h5>
            </div>
            <div class="card-body shadow p-4 card_menu">
              <div class="row">
                <div class="col-lg-3 box col-lg-3 p-1 m-1" style="background-color: #d8c8edd6; ">
                  Coding
                  <div class="float-right pr-4 ">
                    <table class="p-2" style="background-color: #fff; border-radius: 10px;">
                      <tr>
                        <td class="pl-1">MY &nbsp;&nbsp;</td>
                        <td class="pr-1">8</td>
                      </tr>
                      <tr>
                        <td class="pl-1">BellMedEx &nbsp;&nbsp;</td>
                        <td class="pr-1">0</td>
                      </tr>
                    </table>
                  </div>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #d8c8edd6">
                  Day Sheet
                  <span class="float-right">5</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #d8c8edd6">
                  Call Charges
                  <span class="float-right">0</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #d8c8edd6">
                  EOBs
                  <span class="float-right">10</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #d8c8edd6">
                  Medical Notes
                  <span class="float-right">7</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #d8c8edd6">
                  Ins letters
                  <span class="float-right">2</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #d8c8edd6">
                  Super Bill
                  <span class="float-right">37</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #d8c8edd6">
                  Others
                  <span class="float-right">3</span>
                </div>
                <div class="col-lg-2 box col-lg-3  p-2 m-2" style="background-color: #d8c8edd6">
                  Reports
                  <span class="float-right">10</span>
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

@endsection