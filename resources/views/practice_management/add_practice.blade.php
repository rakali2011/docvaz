@extends('includes.main')
@section('content')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer">
<link rel="stylesheet" href="{{ asset('assets/Tagify-4.13.3/css/tagify.css') }}">
<style>
  label {
    margin-bottom: 0;
  }

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

  .tagify {
    height: 20% !important;
  }
</style>
<div class="container-fluid">
  <div class="row justify-content-center">
    <div class="col-12">
      <h2 class="page-title menu-head">{{(@$practice) ? 'Update Practice' : 'Add Practice' }}</h2>
      <div class="card shadow mb-4">
        <form action="{{(@$practice) ? route('update_practice', ['id' => Crypt::encrypt($practice->id)]) : route('post_practice')  }}" method="POST" enctype="multipart/form-data">
          @csrf
          <div class="card-body">
            <div class="row">
              @role('dev')
              <div class="col-md-6">
                <div class="form-group mb-3">
                  <label for="type">Company</label>
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
              <div class="col-md-12">
                <div class="w3-animate-opacity">
                  <div class="tab">
                    @can('update business status')
                    <button type="button" class="tablinks active" onclick="openCity(event, 'practice-status')">Practice Status</button>
                    @endcan
                    @can('update business info')
                    <button type="button" class="tablinks " onclick="openCity(event, 'practice-information')">Practice Information</button>
                    @endcan
                    @can('update business address')
                    <button type="button" class="tablinks " onclick="openCity(event, 'address')">Address</button>
                    @endcan
                    @can('update business contact info')
                    <button type="button" class="tablinks " onclick="openCity(event, 'contact-information')">Contact Information</button>
                    @endcan
                    <button type="button" class="tablinks " onclick="openCity(event, 'docuhub-credentials')">Docuhub Credentials</button>
                    @can('update business provider info')
                    <button type="button" class="tablinks " onclick="openCity(event, 'provider-information')">Provider Information</button>
                    @endcan
                    @can('update business system detail')
                    <button type="button" class="tablinks " onclick="openCity(event, 'system-details')">System Details</button>
                    @endcan
                    @can('update business payers enrollment info')
                    <button type="button" class="tablinks " onclick="openCity(event, 'payers-enrollment-information')">Payers Enrollment Information</button>
                    @endcan
                    @can('update business claim frequency')
                    <button type="button" class="tablinks " onclick="openCity(event, 'claim-creation-frequency')">Claim Creation Frequency</button>
                    @endcan
                    @can('update business attachment')
                    <button type="button" class="tablinks " onclick="openCity(event, 'attachment')">Attachment</button>
                    @endcan
                    @can('update business services')
                    <button type="button" class="tablinks " onclick="openCity(event, 'bellmedex-services')">BellMedEx Services</button>
                    @endcan
                    @can('update business crm')
                    <button type="button" class="tablinks " onclick="openCity(event, 'crm')">CRM</button>
                    @endcan
                    @can('update business operations')
                    <button type="button" class="tablinks " onclick="openCity(event, 'operations')">Operations</button>
                    @endcan
                    @can('update business threshold per hour')
                    <button type="button" class="tablinks " onclick="openCity(event, 'practice-threshold-per-hour')">Practice Threshold Per Hour</button>
                    @endcan
                  </div>
                  @can('update business status')
                  <div id="practice-status" class="tabcontent" style="display:block!important">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-2" style="margin-left: 18px;">
                          <div class="mb-3">
                            <label for="p_status" class="form-label">Status</label>
                            <select class="form-control" id="p_status" name="status">
                              <option value="0">--Please Select--</option>
                              @foreach(statuses('practice') as $key => $value)
                              <option value="{{ $value->id }}" @if(old('status')==@$value->id || @$value->id == @$practice->status) selected @endif>{{ $value->name }}</option>
                              @endforeach
                            </select>
                          </div>
                        </div>
                        <div class="col-md-2 p_status-sub">
                          <div class="mb-3">
                            <label for="reason" class="form-label">Reason</label>
                            <input type="text" value="{{ empty(old('reason')) ? @$practice->reason : old('reason') }}" name="reason" class="form-control" id="reason" placeholder="Reason">
                          </div>
                        </div>
                        <div class="col-md-2 p_status-sub">
                          <div class="mb-3">
                            <label for="date" class="form-label">Date</label>
                            <input type="date" value="{{ empty(old('date')) ? @$practice->date : old('date') }}" class="form-control" name="date" id="date">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business info')
                  <div id="practice-information" class="tabcontent">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="practice" class="form-label">Practice Name</label>
                            <input type="text" class="form-control" id="practice" name="practice" value="{{ empty(old('practice')) ? @$practice->name : old('practice') }}">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="speciality" class="form-label">Speciality</label>
                            <input type="text" data-role="tagsinput" class="form-control" name="speciality" id="speciality" value="{{ empty(old('speciality')) ? @$practice->speciality : old('speciality') }}">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="avg_charges" class="form-label">Average Monthly Collection</label>
                            <input type="text" class="form-control" id="avg_charges" name="avg_charges" value="{{ empty(old('avg_charges')) ? @$practice->avg_charges : old('avg_charges') }}">
                          </div>
                        </div>
                        <div class="col-md-12"></div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="group_npi" class="form-label">Group NPI</label>
                            <input maxlength="10" type="text" class="form-control" id="group_npi" name="group_npi" value="{{ empty(old('group_npi')) ? @$practice->group_npi : old('group_npi') }}">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="group_ptan" class="form-label">Group PTAN</label>
                            <input type="text" class="form-control" id="group_ptan" name="group_ptan" value="{{ empty(old('group_ptan')) ? @$practice->group_ptan : old('group_ptan') }}">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="tax_id" class="form-label">Tax ID</label>
                            <input type="text" maxlength="10" class="form-control" id="tax_id" name="tax_id" value="{{ empty(old('tax_id')) ? @$practice->tax_id : old('tax_id') }}">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business address')
                  <div id="address" class="tabcontent">
                    <div class="card-body">
                      <div id="physical_address" class="row">
                        <div class="col-md-3 p-dynamic_add">
                          <div class="mb-3">
                            <label for="physical_address-" class="form-label">Physical Address</label>
                            <input type="text" value="" class="form-control" id="physical_address-" name="physical_address[]" />
                          </div>
                        </div>
                        <div class="col-md-2 p-dynamic_add">
                          <div class=" mb-3">
                            <label for="physical_zip-" class="form-label">Zip</label>
                            <input type="text" value="" class="form-control" id="physical_zip-" name="physical_zip[]" />
                          </div>
                        </div>
                        <div class="col-md-3 p-dynamic_add">
                          <div class=" mb-3">
                            <label for="physical_state-" class="form-label">State</label>
                            <input type="text" class="form-control" value="" id="physical_state-" name="physical_state[]" />
                          </div>
                        </div>
                        <div class="col-md-3 p-dynamic_add">
                          <div class=" mb-3">
                            <label for="physical_city" class="form-label">City</label>
                            <input type="text" class="form-control" value="" id="physical_city" name="physical_city[]" />
                          </div>
                        </div>
                        <div class="col-md-1 d-flex justify-content-center align-items-center p-dynamic_add">
                          <div class=" mb-3 pt-4">
                            <i style="cursor: pointer" id="add-physical_address" class="fa fa-plus-circle fs-2"></i>
                          </div>
                        </div>
                      </div>

                      <div id="mailing_address" class="row">
                        <div class="col-md-3 m-dynamic_add-">
                          <div class="mb-3">
                            <label for="mailing_address-" class="form-label">Mailing Address</label>
                            <input type="text" class="form-control" value="" id="mailing_address-" name="mailing_address[]" />
                          </div>
                        </div>
                        <div class="col-md-2 m-dynamic_add-">
                          <div class="mb-3">
                            <label for="mailing_zip-" class="form-label">Zip</label>
                            <input type="text" class="form-control" value="" id="mailing_zip-" name="mailing_zip[]" />
                          </div>
                        </div>
                        <div class="col-md-3 m-dynamic_add-">
                          <div class="mb-3">
                            <label for="mailing_state-" class="form-label">State</label>
                            <input type="text" class="form-control" value="" id="mailing_state-" name="mailing_state[]" />
                          </div>
                        </div>
                        <div class="col-md-3 m-dynamic_add-">
                          <div class="mb-3">
                            <label for="mailing_city-" class="form-label">City</label>
                            <input type="text" class="form-control" value="" id="mailing_city-" name="mailing_city[]" />
                          </div>
                        </div>
                        <div class="col-md-1 d-flex justify-content-center align-items-center m-dynamic_add-">
                          <div class="mb-3 pt-4">
                            <i style="cursor: pointer" id="add-mailing_address" class="fa fa-plus-circle fs-2"></i>
                          </div>
                        </div>
                      </div>
                      <div id="service_location" class="row">
                        <div class="col-md-3 la-dynamic_add-">
                          <div class="mb-3">
                            <label for="location_address-" class="form-label">Service Location</label>
                            <input type="text" class="form-control" value="" id="location_address-" name="location_address[]" />
                          </div>
                        </div>
                        <div class="col-md-2 la-dynamic_add-">
                          <div class="mb-3">
                            <label for="location_zip-" class="form-label">Zip</label>
                            <input type="text" class="form-control" value="" id="location_zip-" name="location_zip[]" />
                          </div>
                        </div>
                        <div class="col-md-3 la-dynamic_add-">
                          <div class="mb-3">
                            <label for="location_state-" class="form-label">State</label>
                            <input type="text" class="form-control" value="" id="location_state-" name="location_state[]" />
                          </div>
                        </div>
                        <div class="col-md-3 la-dynamic_add-">
                          <div class="mb-3">
                            <label for="location_city-" class="form-label">City</label>
                            <input type="text" class="form-control" value="" id="location_city-" name="location_city[]" />
                          </div>
                        </div>
                        <div class="col-md-1 d-flex justify-content-center align-items-center la-dynamic_add-">
                          <div class="mb-3 pt-4">
                            <i style="cursor: pointer" id="add-location_address" class="fa fa-plus-circle fs-2"></i>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business contact info')
                  <div id="contact-information" class="tabcontent">
                    <div class="card-body">
                      <div class="col-md-12">
                        <div id="owner_info" class="row">
                          <div class="col-md-2 o-dynamic_add-">
                            <div class="mb-3">
                              <label for="owner_title-" class="form-label">Title(Mr/Ms/Dr)</label>
                              <input type="text" name="owner_title[]" id="owner_title-" value="" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-3 o-dynamic_add-">
                            <div class="mb-3">
                              <label for="owner_name-" class="form-label">Owner/Prov Name</label>
                              <input type="text" value="" class="form-control" id="owner_name-" name="owner_name[]" />
                            </div>
                          </div>
                          <div class="col-md-2 o-dynamic_add-">
                            <div class="mb-3">
                              <label for="owner_fax-" class="form-label">Fax</label>
                              <input type="text" class="form-control" value="" id="owner_fax-" name="owner_fax[]" onchange="this.value=formatPhoneNumber(this.value);" />
                            </div>
                          </div>
                          <div class="col-md-2 o-dynamic_add-">
                            <div class="mb-3">
                              <label for="owner_email-" class="form-label">
                                Email</label>
                              <input type="email" class="form-control" value="" id="owner_email-" name="owner_email[]" />
                            </div>
                          </div>
                          <div class="col-md-2 o-dynamic_add-">
                            <div class="mb-3">
                              <label for="owner_phone-" class="form-label">Phone#</label>
                              <input onchange="this.value=formatPhoneNumber(this.value);" type="tel" class="form-control" value="" id="owner_phone-" name="owner_phone[]" onkeypress="return validateNumber(event)" />
                            </div>
                          </div>
                          <div class="col-md-1 d-flex justify-content-center align-items-center o-dynamic_add-">
                            <div class="mb-3 pt-4">
                              <i style="cursor: pointer" id="add-owner_info" class="fa fa-plus-circle fs-2"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div id="focal_info" class="row">
                          <div class="col-md-3 f-dynamic_add-">
                            <div class="mb-3">
                              <label for="focal_name-" class="form-label">Focal Person Name</label>
                              <input type="text" class="form-control" value="" id="focal_name-" name="focal_name[]" />
                            </div>
                          </div>
                          <div class="col-md-2 f-dynamic_add-">
                            <div class="mb-3">
                              <label for="focal_fax-" class="form-label">Fax</label>
                              <input type="text" class="form-control" value="" id="focal_fax-" name="focal_fax[]" />
                            </div>
                          </div>
                          <div class="col-md-2 f-dynamic_add-">
                            <div class="mb-3">
                              <label for="focal_email-" class="form-label">
                                Email</label>
                              <input type="email" class="form-control" value="" id="focal_email-" name="focal_email[]" />
                            </div>
                          </div>
                          <div class="col-md-2 f-dynamic_add-">
                            <div class="mb-3">
                              <label for="focal_phone-" class="form-label">Phone#</label>
                              <input onchange="this.value=formatPhoneNumber(this.value);" type="tel" class="form-control" value="" id="focal_phone-" name="focal_phone[]" onkeypress="return validateNumber(event)" />
                            </div>
                          </div>
                          <div class="col-md-2 f-dynamic_add-">
                            <div class="mb-3">
                              <label for="focal_designation-" class="form-label">Designation</label>
                              <input type="text" name="focal_designation[]" id="focal_designation-" class="form-control" value="" />
                            </div>
                          </div>
                          <div class="col-md-1 d-flex justify-content-center align-items-center f-dynamic_add-">
                            <div class="mb-3 pt-4">
                              <i style="cursor: pointer" id="add-focal_info" class="fa fa-plus-circle fs-2"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="mb-3">
                          <label for="dmail_emails" class="form-label">Emails Used For DocuHub Credentials</label>
                          <input type="text" value="" class="form-control" id="dmail_emails" name="dmail_emails" />
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  <div id="docuhub-credentials" class="tabcontent">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-3">
                          <div class="mb-3">
                            <label class="form-label">Primary Email</label>
                            <input type="email" value="" class="form-control" disabled="disabled">
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="mb-3">
                            <label class="form-label">Primary Username</label>
                            <input type="email" value="" class="form-control" disabled="disabled">
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="mb-3">
                            <label class="form-label">Secondary Email</label>
                            <input type="email" value="" class="form-control" disabled="disabled">
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="mb-3">
                            <label class="form-label">Secondary Username</label>
                            <input type="email" value="" class="form-control" disabled="disabled">
                          </div>
                        </div>
                        <div class="col-md-12">
                          <div class="mb-3">
                            <label class="form-label">Additional Emails</label>
                            <input type="email" value="" class="form-control" disabled="disabled">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @can('update business provider info')
                  <div id="provider-information" class="tabcontent">
                    <div class="card-body">
                      <div class="row" id="practice-info-tab">
                        <div class="col-md-2 pi-dynamic_add-">
                          <div class="mb-3">
                            <label for="provider_name-" class="form-label">Name</label>
                            <input type="text" name="provider_name[]" id="provider_name-" value="" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-2 pi-dynamic_add-">
                          <div class="mb-3">
                            <label for="provider_dob-" class="form-label">DOB</label>
                            <input type="date" name="provider_dob[]" id="provider_dob-" value="" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-2 pi-dynamic_add-">
                          <div class="mb-3">
                            <label for="provider_ind_npi-" class="form-label">Individual NPI</label>
                            <input maxlength="10" type="text" name="provider_ind_npi[]" id="provider_ind_npi-" value="" class="form-control" onkeypress="return validateNumber(event)" maxlength="10">
                          </div>
                        </div>
                        <div class="col-md-2 5 pi-dynamic_add-">
                          <div class="mb-3">
                            <label for="individual_ptan" class="form-label">Individual PTAN</label>
                            <input type="text" name="individual_ptan[]" id="individual_ptan-" value="" class="form-control" onkeypress="return validateAlphaNumeric(event)">
                          </div>
                        </div>
                        <div class="col-md-2 pi-dynamic_add-">
                          <div class="mb-3">
                            <label for="provider_ssn" class="form-label">Provider SSN#</label>
                            <input type="text" name="provider_ssn[]" id="provider_ssn-" onchange="this.value=rtaxx(this.value);" value="" class="form-control" onkeypress="return validateNumber(event)" />
                          </div>
                        </div>
                        <div class="col-md-1 pi-dynamic_add-">
                          <div class="mb-3">
                            <label for="provider_tax_id-" class="form-label">Tax ID</label>
                            <input type="text" onchange="this.value=rtax(this.value);" maxlength="10" value="" class="form-control" id="provider_tax_id-" name="provider_tax_id[]" onkeypress="return validateNumber(event)" />
                          </div>
                        </div>
                        <div class="col-md-1 d-flex justify-content-center align-items-center pi-dynamic_add-">
                          <div class="mb-3 pt-4">
                            <i style="cursor: pointer" id="add-provider-info" class="fa fa-plus-circle fs-2"></i>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business system detail')
                  <div id="system-details" class="tabcontent">
                    <div class="card-body">
                      <div id="practice_management" class="row">
                        <div class="col-md-3 p-dynamic_add-">
                          <div class="mb-3">
                            <label for="pms_name-" class="form-label">Practice Management Software</label>
                            <input type="text" class="form-control" value="" id="pms_name-" name="pms_name[]" />
                          </div>
                        </div>
                        <div class="col-md-3 p-dynamic_add-">
                          <div class="mb-3">
                            <label for="pms_url-" class="form-label">URL</label>
                            <input type="text" class="form-control" value="" id="pms_url-" name="pms_url[]" />
                          </div>
                        </div>
                        <div class="col-md-3 p-dynamic_add-">
                          <div class="mb-3">
                            <label for="pms_username-" class="form-label">User Name</label>
                            <input type="text" class="form-control" value="" id="pms_username-" name="pms_username[]" />
                          </div>
                        </div>
                        <div class="col-md-2 p-dynamic_add-">
                          <div class="mb-3">
                            <label for="pms_password-" class="form-label">Password</label>
                            <input type="text" class="form-control" value="" id="pms_password-" name="pms_password[]" />
                          </div>
                        </div>
                        <div class="col-md-1 d-flex justify-content-center align-items-center p-dynamic_add-">
                          <div class="mb-3 pt-4">
                            <i style="cursor: pointer" id="add-practice_management" class="fa fa-plus-circle fs-2"></i>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="ehr_name" class="form-label">EHR</label>
                            <input type="text" value="" class="form-control" id="ehr_name" name="ehr_name" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="ehr_url" class="form-label">URL</label>
                            <input type="text" value="" class="form-control" id="ehr_url" name="ehr_url" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="ehr_username" class="form-label">User Name</label>
                            <input type="text" value="" class="form-control" id="ehr_username" name="ehr_username" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="ehr_password" class="form-label">Password</label>
                            <input type="text" value="" class="form-control" id="ehr_password" name="ehr_password" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="clearinghouse_name" class="form-label">Clearinghouse</label>
                            <input type="text" value="" class="form-control" id="clearinghouse_name" name="clearinghouse_name" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="clearinghouse_url" class="form-label">URL</label>
                            <input type="text" class="form-control" value="" id="clearinghouse_url" name="clearinghouse_url" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="clearinghouse_username" class="form-label">User Name</label>
                            <input type="text" class="form-control" value="" id="clearinghouse_username" name="clearinghouse_username" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="clearinghouse_password" class="form-label">Password</label>
                            <input type="text" class="form-control" value="" id="clearinghouse_password" name="clearinghouse_password" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="caqh_name" class="form-label">CAQH</label>
                            <input type="text" class="form-control" value="" id="caqh_name" name="caqh_name" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="caqh_url" class="form-label">URL</label>
                            <input type="text" class="form-control" value="" id="caqh_url" name="caqh_url" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="caqh_username" class="form-label">User Name</label>
                            <input type="text" class="form-control" value="" id="caqh_username" name="caqh_username" />
                          </div>
                        </div>
                        <div class="col-md-2">
                          <div class="mb-3">
                            <label for="caqh_password" class="form-label">Password</label>
                            <input type="text" class="form-control" value="" id="caqh_password" name="caqh_password" />
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business payers enrollment info')
                  <div id="payers-enrollment-information" class="tabcontent">
                    <div class="card-body" id="payers_enrollment">
                      <div class="row">
                        <div class="col-md-2 e-dynamic_add-">
                          <div class="mb-3">
                            <label for="payer_name-" class="form-label">Payer Name</label>
                            <input type="text" class="form-control" value="" id="payer_name-" name="payer_name[]" />
                          </div>
                        </div>
                        <div class="col-md-2 e-dynamic_add-">
                          <div class="mb-3">
                            <label for="payer_provider_name-" class="form-label">Provider Name</label>
                            <input type="text" class="form-control payer_provider_name" value="" id="payer_provider_name-" name="payer_provider_name[]" />
                          </div>
                        </div>
                        <div class="col-md-1 e-dynamic_add-">
                          <div class="mb-3">
                            <label for="payer_npi-" class="form-label">NPI</label>
                            <input type="text" class="form-control payer_npi" value="" id="payer_npi-" name="payer_npi[]" />
                          </div>
                        </div>
                        <div class="col-md-2 e-dynamic_add-">
                          <div class="mb-3">
                            <label for="payer_enroll_type-" class="form-label">Enroll Type</label>
                            <select name="payer_enroll_type[]" onchange="change_npi()" ref="" class="form-control payer_enroll_type" id="payer_enroll_type-">
                              <option value="">--Please Select--</option>
                              <option value="individual">Individual</option>
                              <option value="group">Group</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-2 e-dynamic_add-">
                          <div class="mb-3">
                            <label for="payer_enroll_with-" class="form-label">Enroll With</label>
                            <select name="payer_enroll_with[]" class="form-control" id="payer_enroll_with-">
                              <option value="">--Please Select--</option>
                              <option value="tax_id">Tax Id</option>
                              <option value="ssn">SSN</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-2 e-dynamic_add-">
                          <div class="mb-3">
                            <label for="payer_effective_date-" class="form-label">Enroll Effective</label>
                            <input type="date" class="form-control" value="" id="payer_effective_date-" name="payer_effective_date[]" />
                          </div>
                        </div>
                        <div class="col-md-1 d-flex justify-content-center align-items-center e-dynamic_add-">
                          <div class="mb-3 pt-4">
                            <i style="cursor: pointer" id="add-payers_enrollment" class="fa fa-plus-circle fs-2"></i>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business claim frequency')
                  <div id="claim-creation-frequency" class="tabcontent">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-3">
                          <div class="mb-3">
                            <label for="claim-freq" class="form-label">Select</label>
                            <select class="form-control" id="claim-freq" name="claim_freq_option">
                            </select>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="mb-3">
                            <label for="claim-days" class="form-label">Select</label>
                            <select id="claim-days" class="form-control" name="claim_freq_value"></select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business attachment')
                  <div id="attachment" class="tabcontent">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-12">
                          <div class="mb-3">
                            <input class="form-control" type="file" id="formFile" name="attachment" style="float:left; width:30%;">
                            <div style="float:left;">&nbsp;&nbsp;(IRS letter)</div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div id="attachments"></div>
                          <div id="attachment_div"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business services')
                  <div id="bellmedex-services" class="tabcontent">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-3">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="credentialing" name="credentialing">
                            <label class="form-check-label" for="credentialing">
                              Credentialing
                            </label>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="coding" name="coding">
                            <label class="form-check-label" for="coding">
                              Coding
                            </label>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="patient_help_desk" name="phd">
                            <label class="form-check-label" for="patient_help_desk">
                              Patient Help Desk
                            </label>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="billing" name="billing">
                            <label class="form-check-label" for="billing">
                              Billing
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="row d-none mb-3" id="billing-sub">
                        <hr />
                        <div class="col-sm-6 col-md-3 mb-2">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="eligibility_check" name="eligibility_check">
                            <label class="form-check-label" for="eligibility_check">
                              Eligibility / Benefits Verification
                            </label>
                          </div>
                        </div>
                        <div class="col-sm-6 col-md-3 mb-2">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="authorization" name="authorization">
                            <label class="form-check-label" for="authorization">
                              Authorization
                            </label>
                          </div>
                        </div>
                        <div class="col-sm-6 col-md-3 mb-2">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="patient_statement" name="patient_statement">
                            <label class="form-check-label" for="patient_statement">
                              Patient Statement
                            </label>
                          </div>
                        </div>
                        <div class="col-sm-6 col-md-3 mb-2">
                          <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="account_receivable" name="ar">
                            <label class="form-check-label" for="account_receivable">
                              Account Receivable
                            </label>
                          </div>
                        </div>
                        <div class="col-md-6 d-none" id="ar_date">
                          <div class="mb-3">
                            <label for="ar_starting_period" class="form-label"> AR Starting Period</label>
                            <input type="date" class="form-control" value="" id="ar_starting_period" name="ar_start" />
                          </div>
                        </div>
                      </div>
                      <div class="row" style="margin-top:40px;">
                        <div class="col-md-5">
                          <div class="mb-3">
                            <label for="key_billing_issues" class="form-label">Key Billing Issues Faced by Practice(if any)</label>
                            <input type="text" class="form-control" name="key_billing_issues" id="key_billing_issues" value="" />
                          </div>
                        </div>
                        <div class="col-md-5">
                          <div class="mb-3">
                            <label for="complementary_services" class="form-label">Complementary Services/Special Commitment (If Any)</label>
                            <input type="text" class="form-control" name="complementary_services" id="complementary_services" value="" />
                          </div>
                        </div>
                        <div class="col-md-5">
                          <div class="mb-3">
                            <label for="special_instructions" class="form-label">Special Instructions</label>
                            <input type="text" class="form-control" name="special_instructions" id="special_instructions" value="" />
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business crm')
                  <div id="crm" class="tabcontent">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="welcome_email" class="form-label">Welcome Email</label>
                            <input type="datetime-local" name="welcome_email" id="welcome_email" class="form-control" value="">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="onboarding_metting_date" class="form-label">Onboarding Metting Date</label>
                            <input type="datetime-local" name="onboarding_metting_date" id="onboarding_metting_date" class="form-control" value="">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="attended_by_crm_team" class="form-label">Attended By CRM Team</label>
                            <input type="text" name="attended_by_crm_team" id="attended_by_crm_team" data-role="tagsinput" class="form-control" value="" />
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="docuhub_orientation" class="form-label">DocuHub Orientation</label>
                            <select name="docuhub_orientation" id="docuhub_orientation" class="form-control">
                              <option value="">--Please Select--</option>
                              <option value="1">Yes</option>
                              <option value="0">No</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="orientation_datetime" class="form-label">Orientation Datetime</label>
                            <input type="datetime-local" name="orientation_datetime" id="orientation_datetime" class="form-control" value="">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="orientation_by" class="form-label">By</label>
                            <input type="text" name="orientation_by" id="orientation_by" data-role="tagsinput" class="form-control" value="" />
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="mom_sharing_date" class="form-label">MOM Sharing Date</label>
                            <input type="datetime-local" name="mom_sharing_date" id="mom_sharing_date" class="form-control" value="">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business operations')
                  <div id="operations" class="tabcontent">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="logins_receipt" class="form-label">Logins Receipt</label>
                            <select name="logins_receipt" id="logins_receipt" class="form-control">
                              <option value="">--Please Select--</option>
                              <option value="1">Yes</option>
                              <option value="0">No</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="login_date" class="form-label">Date</label>
                            <input type="date" name="login_date" id="login_date" class="form-control" value="">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="sop_preparation" class="form-label">SOP Preparation</label>
                            <select name="sop_preparation" id="sop_preparation" class="form-control">
                              <option value="">--Please Select--</option>
                              <option value="1">Yes</option>
                              <option value="0">No</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="first_service_provided_name" class="form-label">First Service Provided Name</label>
                            <input type="text" name="first_service_provided_name" id="first_service_provided_name" class="form-control" value="">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="preparation_date" class="form-label">Date</label>
                            <input type="date" name="preparation_date" id="preparation_date" class="form-control" value="">
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label for="first_billing_received" class="form-label">First Billing Received</label>
                            <input type="date" name="first_billing_received" id="first_billing_received" class="form-control" value="">
                          </div>
                        </div>
                        <div class="col-md-4 coding">
                          <div class="mb-3">
                            <label for="first_coding_service_status" class="form-label">First Coding Service Status</label>
                            <select name="first_coding_service_status" id="first_coding_service_status" class="form-control">
                              <option value="">--Please Select--</option>
                              <option value="1">Yes</option>
                              <option value="0">No</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-4 coding">
                          <div class="mb-3">
                            <label for="coding_date" class="form-label">Date</label>
                            <input type="date" name="coding_date" id="coding_date" class="form-control" value="">
                          </div>
                        </div>
                        <div class="col-md-4 credentialing">
                          <div class="mb-3">
                            <label for="first_credentialing_service_status" class="form-label">First Credentialing Service Status</label>
                            <select name="first_credentialing_service_status" id="first_credentialing_service_status" class="form-control">
                              <option value="">--Please Select--</option>
                              <option value="1">Yes</option>
                              <option value="0">No</option>
                            </select>
                          </div>
                        </div>
                        <div class="col-md-4 credentialing">
                          <div class="mb-3">
                            <label for="credentialing_date" class="form-label">Date</label>
                            <input type="date" name="credentialing_date" id="credentialing_date" class="form-control" value="">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                  @can('update business threshold per hour')
                  <div id="practice-threshold-per-hour" class="tabcontent">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-3">
                          <div class="mb-3">
                            <label for="thresh_eligibility" class="form-label">N.o of Eligibility / Benefits Checks</label> <br>
                            <input type="checkbox" value="1" name="thresh_eligibility_cal_checkbox"> <b>Call</b>
                            <input type="number" value="" class="form-control" id="thresh_eligibility" name="thresh_eligibility" />
                            <br>
                            <input type="checkbox" value="1" name="thresh_eligibility_portal_checkbox">
                            <label for="thresh_portal" class="form-label">Portal</label> <br>
                            <input type="number" value="" class="form-control" id="thresh_portal" name="thresh_portal" />
                            <br>
                            <label for="thresh_auth" class="form-label">No. Of Pre Authorization</label> <br>
                            <input type="number" value="" class="form-control" id="thresh_auth" name="thresh_auth" />
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="mb-3">
                            <label for="thresh_charge_entry" class="form-label">No. of Claims Created</label> <br>
                            <input type="checkbox" value="1" name="thresh_charge_manual_checkbox"> <b>Manual</b> <br>
                            <input type="checkbox" value="1" name="thresh_charge_with_demo_graphics_checkbox"> <b>With Demo Graphics</b>
                            <input type="number" value="" class="form-control" id="thresh_charge_entry" name="thresh_charge_entry" />
                            <br>
                            <input type="checkbox" value="1" name="thresh_charge_elect_checkbox">
                            <label for="thresh_elect" class="form-label">Electronically</label> <br>
                            <input type="number" value="" class="form-control" id="thresh_elect" name="thresh_elect" />
                            <br>
                            <label for="thresh_rejections" class="form-label">No. of Rejections</label> <br>
                            <input type="number" value="" class="form-control" id="thresh_rejections" name="thresh_rejections" />
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="mb-3">
                            <label for="thresh_posting" class="form-label">No. of Claims Payment Posting (Ins/Pat)</label> <br>
                            <input type="checkbox" value="1" name="thresh_posting_manual_checkbox"> <b>Manual</b>
                            <input type="number" value="" class="form-control" id="thresh_posting" name="thresh_posting" />
                            <br>
                            <input type="checkbox" value="1" name="thresh_posting_elect_checkbox">
                            <label for="thresh_posting_elect" class="form-label">Electronically</label> <br>
                            <input type="number" value="" class="form-control" id="thresh_posting_elect" name="thresh_posting_elect" />
                            <br>
                            <label for="thresh_denials" class="form-label">No. of Denials</label> <br>
                            <input type="number" value="" class="form-control" id="thresh_denials" name="thresh_denials" />
                            <br>
                          </div>
                        </div>
                        <div class="col-md-3" id="thresh_payer">
                          <div class="row">
                            <label class="form-label">No. of Claims Follow up Payer wise</label> <br>
                            <div class="col-md-12 t-dynamic_add-">
                              <div class="mb-3">
                                <label for="thresh_payer_name-" class="form-label">Payer Name</label>
                                <input type="text" class="form-control" value="" id="thresh_payer_name-" name="thresh_payer_name[]" />
                              </div>
                            </div>
                            <div class="col-md-12 t-dynamic_add-">
                              <div class="mb-3">
                                <label for="thresh_payer_claims-" class="form-label">No of claims per hour(number)</label>
                                <input type="number" min="0" class="form-control" value="" id="thresh_payer_claims-" name="thresh_payer_claims[]" />
                              </div>
                            </div>
                            <div class="col-md-12 d-flex justify-content-center align-items-center t-dynamic_add-">
                              <div class="mb-3 pt-4">
                                <i style="cursor: pointer" id="add-thresh_payer" class="fa fa-plus-circle fs-2"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endcan
                </div>
              </div>
              @can('update business')
              <div class="col-12 mt-3">
                <input type="submit" value="{{ (@$practice)?'Update':'Save' }}" class="btn btn-success float-right">
              </div>
              @endcan
            </div>
          </div>
        </form>
      </div> <!-- / .card -->
    </div> <!-- .col-12 -->
  </div> <!-- .row -->
</div>
@push('scripts')
<script src="{{ asset('assets/Tagify-4.13.3/js/tagify.min.js') }}"></script>
<script src="{{ asset('assets/Tagify-4.13.3/js/tagify.polyfills.min.js') }}"></script>
<script>
  $(document).ready(function() {
    credentialing();
    coding();
    docuhub_orientation();
    logins_receipt();
  });

  function credentialing() {
    var credentialing = $('#credentialing:checked').val();
    if (credentialing == 1)
      $('.col-md-4.credentialing').show();
    else
      $('.col-md-4.credentialing').hide();
  }

  function coding() {
    var coding = $('#coding:checked').val();
    if (coding == 1)
      $('.col-md-4.coding').show();
    else
      $('.col-md-4.coding').hide();
  }

  function docuhub_orientation() {
    if ($('#docuhub_orientation').val() == "1")
      $('[for="orientation_datetime"]').parents('.col-md-4').show();
    else
      $('[for="orientation_datetime"]').parents('.col-md-4').hide();
  }

  function logins_receipt() {
    if ($('#logins_receipt').val() == "1")
      $('[for="login_date"]').parents('.col-md-4').show();
    else
      $('[for="login_date"]').parents('.col-md-4').hide();
  }
  $(document).on("change", "#credentialing", function() {
    credentialing();
  });
  $(document).on("change", "#coding", function() {
    coding();
  });
  $(document).on("change", "#docuhub_orientation", function() {
    docuhub_orientation();
  });
  $(document).on("change", "#logins_receipt", function() {
    logins_receipt();
  });
  $(document).on("focusout", "#provider_name-0", function() {
    var v = $('#provider_name-0').val();
    $('.payer_provider_name').val(v);
  });
  $(document).on("focusout", "#provider_ind_npi-0", function() {
    var v = $('#provider_ind_npi-0').val();
    $('.payer_enroll_type').each(function() {
      if ($('option:selected', this).val() == 'individual') {
        var ref = $(this).attr('ref');
        $('#payer_npi-' + ref).val(v)
      }
    });
  });
  $(document).on("focusout", "#provider_grp_npi", function() {
    var v = $('#provider_grp_npi').val();
    $('.payer_enroll_type').each(function() {
      if ($('option:selected', this).val() == 'group') {
        var ref = $(this).attr('ref');
        $('#payer_npi-' + ref).val(v)
      }
    });
  });

  function change_npi(key) {
    var npi = "";
    if ($('#payer_enroll_type-' + key + ' option:selected').val() == 'group') {
      npi = $('#provider_grp_npi').val();
    } else if ($('#payer_enroll_type-' + key + ' option:selected').val() == 'individual') {
      npi = $('#provider_ind_npi').val();
    }
    $('#payer_npi-' + key).val(npi);
  }
  $(document).on("click", "#billing", function() {
    if ($('#billing').is(':checked')) {
      $('#billing-sub').removeClass('d-none');
    } else {
      $('#billing-sub').addClass('d-none');
    }
  });
  $(document).on("click", "#account_receivable", function() {
    if ($('#account_receivable').is(':checked')) {
      $('#ar_date').removeClass('d-none');
    } else {
      $('#ar_date').addClass('d-none');
    }
  });
  $(document).on("change", "#claim-freq", function() {
    var value = $('#claim-freq option:selected').val();
    if (value == 'daily') {
      $('#claim-days').html('');
      $('#claim-days').append('<option value="1">1</option>');
    } else {
      if (value == 'weekly') {
        var count = 7;
      }
      if (value == 'other') {
        var count = 15;
      }
      if (value == 'monthly') {
        var count = 30;
      }
      $('#claim-days').html('');
      for (let index = 2; index <= count; index++) {
        if (index == 30) {
          $('#claim-days').append('<option value="' + index + '" selected>' + index + '</option>');
        } else if (index == 15) {
          $('#claim-days').append('<option value="' + index + '" selected>' + index + '</option>');
        } else if (index == 7) {
          /////continue;
          $('#claim-days').append('<option value="' + index + '" selected>' + index + '</option>');
        } else {
          $('#claim-days').append('<option value="' + index + '">' + index + '</option>');
        }
      }
    }
  });

  function remove_provider_info(i) {
    $('.pi-dynamic_add-' + i).remove();
  }
  var pi = 1000;
  $(document).on("click", "#add-provider-info", function() {
    var html =
      '<div class="col-md-2 pi-dynamic_add-' + pi + '" >' +
      '<div class="mb-3">' +
      '<label for="provider_name-' + pi + '" class="form-label">Name</label>' +
      '<input type="text" id="provider_name-' + pi + '" name="provider_name[]"  class="form-control">' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 pi-dynamic_add-' + pi + '">' +
      '<div class="mb-3">' +
      '<label for="provider_dob-' + pi + '" class="form-label">DOB</label>' +
      '<input type="date" id="provider_dob-' + pi + '" name="provider_dob[]" class="form-control">' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 pi-dynamic_add-' + pi + '">' +
      '<div class="mb-3">' +
      '<label for="provider_ind_npi-' + pi + '" class="form-label">Individual NPI</label>' +
      '<input type="text" id="provider_ind_npi-' + pi + '" name="provider_ind_npi[]"  class="form-control" onkeypress="return validateNumber(event)" maxlength="10">' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 pi-dynamic_add-' + pi + '">' +
      '<div class="mb-3">' +
      '<label for="individual_ptan-' + pi + '" class="form-label">Individual PTAN</label>' +
      '<input type="text" id="individual_ptan-' + pi + '" name="individual_ptan[]"  class="form-control" onkeypress="return validateAlphaNumeric(event)">' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 pi-dynamic_add-' + pi + '">' +
      '<div class="mb-3">' +
      '<label for="provider_ssn-' + pi + '" class="form-label">Provider SSN#</label>' +
      '<input type="text" id="provider_ssn-' + pi + '" name="provider_ssn[]"  class="form-control" onkeypress="return validateAlphaNumeric(event)">' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 pi-dynamic_add-' + pi + '">' +
      '<div class="mb-3">' +
      '<label for="provider_tax_id-' + pi + '" class="form-label">Tax ID</label>' +
      '<input type="text" id="provider_tax_id-' + pi + '" name="provider_tax_id[]"  class="form-control" onkeypress="return validateAlphaNumeric(event)">' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 d-flex justify-content-center align-items-center                                                                                                                                                                                                                                                                                                                                                 pi-dynamic_add-' + pi + '">' +
      '<div class="mb-3 pt-4">' +
      '<i style="cursor: pointer" onclick="remove_provider_info(' + pi + ')" class="fa fa-minus-circle fs-2"></i>' +
      '</div>' +
      '</div>';
    $('#practice-info-tab').append(html);
    pi++;
  });

  function remove_thresh_payer(t) {
    $('.t-dynamic_add-' + t).remove();
  }
  var t = 1000;
  $(document).on("click", "#add-thresh_payer", function() {
    var html = '<div class="row t-dynamic_add-' + t + '"><div class="col-md-12 t-dynamic_add-' + t + '">' +
      '<div class="mb-3">' +
      '<label for="thresh_payer_name-' + t + '" class="form-label">Payer Name</label>' +
      '<input type="text"   class="form-control" id="thresh_payer_name-' + t + '" name="thresh_payer_name[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-12 t-dynamic_add-' + t + '">' +
      '<div class="mb-3">' +
      '<label for="thresh_payer_claims-' + t + '" class="form-label">No of claims per hour(number)</label>' +
      '<input type="number" min="0" class="form-control" id="thresh_payer_claims-' + t + '" name="thresh_payer_claims[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-12 d-flex justify-content-center align-items-center t-dynamic_add-' + t + '">' +
      '<div class="mb-3 pt-4">' +
      '<i style="cursor: pointer" onclick="remove_thresh_payer(' + t + ')" class="fa fa-minus-circle fs-2"></i>' +
      '</div>' +
      '</div>';
    $('#thresh_payer').append(html);
    t++;
  });

  function remove_pms(p) {
    $('.p-dynamic_add-' + p).remove();
  }
  var p = 1000;
  $(document).on("click", "#add-practice_management", function() {
    var html = '<div class="col-md-3 p-dynamic_add-' + p + '" >' +
      '<div class="mb-3">' +
      '<label for="pms_name-' + p + '" class="form-label">Practice Management Software</label>' +
      '<input type="text"   class="form-control" id="pms_name-' + p + '" name="pms_name[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-3 p-dynamic_add-' + p + '">' +
      '<div class="mb-3">' +
      '<label for="pms_url-' + p + '" class="form-label">URL</label>' +
      '<input type="text" class="form-control" id="pms_url-' + p + '" name="pms_url[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-3 p-dynamic_add-' + p + '">' +
      '<div class="mb-3">' +
      '<label for="pms_username-' + p + '" class="form-label">User Name</label>' +
      '<input type="text" class="form-control" id="pms_username-' + p + '" name="pms_username[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 p-dynamic_add-' + p + '">' +
      '<div class="mb-3">' +
      '<label for="pms_password-' + p + '" class="form-label">Password</label>' +
      '<input type="text"   class="form-control" id="pms_password-' + p + '" name="pms_password[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 d-flex justify-content-center align-items-center p-dynamic_add-' + p + '">' +
      '<div class="mb-3 pt-4">' +
      '<i style="cursor: pointer" onclick="remove_pms(' + p + ')" class="fa fa-minus-circle fs-2"></i>' +
      '</div>' +
      '</div>';
    $('#practice_management').append(html);
    p++;
  });

  function remove_owner_info(i) {
    $('.o-dynamic_add-' + i).remove();
  }
  var o = 1000;
  $(document).on("click", "#add-owner_info", function() {
    var html = '<div class="col-md-2 o-dynamic_add-' + o + '" >' +
      '<div class="mb-3">' +
      '<label for="owner_title-' + o + '" class="form-label">Title(Mr/Ms/Dr)</label>' +
      '<input type="text" id="owner_title-' + o + '" name="owner_title[]"  class="form-control">' +
      '</div>' +
      '</div>' +
      '<div class="col-md-3 o-dynamic_add-' + o + '">' +
      '<div class="mb-3">' +
      '<label for="owner_name-' + o + '" class="form-label">Owner/Prov Name</label>' +
      '<input type="text"   class="form-control" id="owner_name-' + o + '" name="owner_name[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 o-dynamic_add-' + o + '">' +
      '<div class="mb-3">' +
      '<label for="owner_fax-' + o + '" class="form-label">Fax</label>' +
      '<input type="text"   class="form-control" id="owner_fax-' + o + '" name="owner_fax[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 o-dynamic_add-' + o + '">' +
      '<div class="mb-3">' +
      '<label for="owner_email-' + o + '" class="form-label">Email</label>' +
      '<input type="email" class="form-control" id="owner_email-' + o + '" name="owner_email[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 o-dynamic_add-' + o + '">' +
      '<div class="mb-3">' +
      '<label for="owner_phone-' + o + '" class="form-label">Phone#</label>' +
      '<input onchange="this.value=formatPhoneNumber(this.value);" type="tel" class="form-control" id="owner_phone-' + o + '" name="owner_phone[]" onkeypress="return validateNumber(event)" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 d-flex justify-content-center align-items-center o-dynamic_add-' + o + '">' +
      '<div class="mb-3 pt-4">' +
      '<i style="cursor: pointer" onclick="remove_owner_info(' + o + ')" class="fa fa-minus-circle fs-2"></i>' +
      '</div>' +
      '</div>';
    $('#owner_info').append(html);
    o++;
  });

  function remove_focal_info(i) {
    $('.f-dynamic_add-' + i).remove();
  }
  var f = 1000;
  $(document).on("click", "#add-focal_info", function() {
    var html = '<div class="col-md-3 f-dynamic_add-' + f + '">' +
      '<div class="mb-3">' +
      '<label for="focal_name-' + f + '" class="form-label">Focal Person Name</label>' +
      '<input type="text"   class="form-control" id="focal_name-' + f + '" name="focal_name[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 f-dynamic_add-' + f + '">' +
      '<div class="mb-3">' +
      '<label for="focal_fax-' + f + '" class="form-label">Fax</label>' +
      '<input type="text"   class="form-control" id="focal_fax-' + f + '" name="focal_fax[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 f-dynamic_add-' + f + '">' +
      '<div class="mb-3">' +
      '<label for="focal_email-' + f + '" class="form-label">Email</label>' +
      '<input type="email" class="form-control" id="focal_email-' + f + '" name="focal_email[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 f-dynamic_add-' + f + '">' +
      '<div class="mb-3">' +
      '<label for="focal_phone-' + f + '" class="form-label">Phone#</label>' +
      '<input onchange="this.value=formatPhoneNumber(this.value);" type="tel" class="form-control" id="focal_phone-' + f + '" name="focal_phone[]" onkeypress="return validateNumber(event)" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 f-dynamic_add-' + f + '">' +
      '<div class="mb-3">' +
      '<label for="focal_designation-' + f + '" class="form-label">Designation</label>' +
      '<input type="text"   class="form-control" id="focal_designation-' + f + '" name="focal_designation[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 d-flex justify-content-center align-items-center f-dynamic_add-' + f + '">' +
      '<div class="mb-3 pt-4">' +
      '<i style="cursor: pointer" onclick="remove_focal_info(' + f + ')" id="add-address" class="fa fa-minus-circle fs-2"></i>' +
      '</div>' +
      '</div>';
    $('#focal_info').append(html);
    f++;
  });

  function remove_physical_address(i) {
    $('.p-dynamic_add-' + i).remove();
  }
  var i = 1000;
  $(document).on("click", "#add-physical_address", function() {
    var html = '<div class="col-md-3 p-dynamic_add-' + i + '">' +
      '<div class="mb-3">' +
      '<label for="physical_address-' + i + '" class="form-label">Physical Address</label>' +
      '<input type="text"   class="form-control" id="physical_address-' + i + '" name="physical_address[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 p-dynamic_add-' + i + '">' +
      '<div class="mb-3">' +
      '<label for="physical_zip-' + i + '" class="form-label">Zip</label>' +
      '<input type="text"   class="form-control" id="physical_zip-' + i + '" name="physical_zip[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-3 p-dynamic_add-' + i + '">' +
      '<div class="mb-3">' +
      '<label for="physical_state-' + i + '" class="form-label">State</label>' +
      '<input type="text"   class="form-control" id="physical_state-' + i + '" name="physical_state[]"/>' +
      '</div>' +
      '</div>' +
      '<div class="col-md-3 p-dynamic_add-' + i + '">' +
      '<div class="mb-3">' +
      '<label for="physical_city-' + i + '" class="form-label">City</label>' +
      '<input type="text"   class="form-control" id="physical_city-' + i + '" name="physical_city[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 d-flex justify-content-center align-items-center p-dynamic_add-' + i + '">' +
      '<div class="mb-3 pt-4">' +
      '<i style="cursor: pointer" onclick="remove_physical_address(' + i + ')" id="add-address" class="fa fa-minus-circle fs-2"></i>' +
      '</div>' +
      '</div>';
    $('#physical_address').append(html);
    i++;
  });

  function remove_mailing_address(i) {
    $('.m-dynamic_add-' + i).remove();
  }
  var x = 1000;
  $(document).on("click", "#add-mailing_address", function() {
    var html = '<div class="col-md-3 m-dynamic_add-' + x + '">' +
      '<div class="mb-3">' +
      '<label for="mailing_address-' + x + '" class="form-label">Mailing Address</label>' +
      '<input type="email"  class="form-control" id="mailing_address-' + x + '" name="mailing_address[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 m-dynamic_add-' + x + '">' +
      '<div class="mb-3">' +
      '<label for="mailing_zip-' + x + '" class="form-label">Zip</label>' +
      '<input type="text"   class="form-control" id="mailing_zip-' + x + '" name="mailing_zip[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-3 m-dynamic_add-' + x + '">' +
      '<div class="mb-3">' +
      '<label for="mailing_state-' + x + '" class="form-label">State</label>' +
      '<input type="text"   class="form-control" id="mailing_state-' + x + '" name="mailing_state[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-3 m-dynamic_add-' + x + '">' +
      '<div class="mb-3">' +
      '<label for="mailing_city-' + x + '" class="form-label">City</label>' +
      '<input type="text"   class="form-control" id="mailing_city-' + x + '" name="mailing_city[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 d-flex justify-content-center align-items-center m-dynamic_add-' + x + '">' +
      '<div class="mb-3 pt-4">' +
      '<i style="cursor: pointer" onclick="remove_mailing_address(' + x + ')" id="add-address" class="fa fa-minus-circle fs-2"></i>' +
      '</div>' +
      '</div>';
    $('#mailing_address').append(html);
    x++;
  });

  function remove_location_address(i) {
    $('.la-dynamic_add-' + i).remove();
  }
  var la = 1000;
  $(document).on("click", "#add-location_address", function() {
    var html = '<div class="col-md-3 la-dynamic_add-' + la + '">' +
      '<div class="mb-3">' +
      '<label for="location_address-' + la + '" class="form-label">Service Location</label>' +
      '<input type="email"  class="form-control" id="location_address-' + la + '" name="location_address[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 la-dynamic_add-' + la + '">' +
      '<div class="mb-3">' +
      '<label for="location_zip-' + la + '" class="form-label">Zip</label>' +
      '<input type="text"   class="form-control" id="location_zip-' + la + '" name="location_zip[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-3 la-dynamic_add-' + la + '">' +
      '<div class="mb-3">' +
      '<label for="location_state-' + la + '" class="form-label">State</label>' +
      '<input type="text"   class="form-control" id="location_state-' + la + '" name="location_state[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-3 la-dynamic_add-' + la + '">' +
      '<div class="mb-3">' +
      '<label for="location_city-' + la + '" class="form-label">City</label>' +
      '<input type="text"   class="form-control" id="location_city-' + la + '" name="location_city[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 d-flex justify-content-center align-items-center la-dynamic_add-' + la + '">' +
      '<div class="mb-3 pt-4">' +
      '<i style="cursor: pointer" onclick="remove_location_address(' + la + ')" id="add-address" class="fa fa-minus-circle fs-2"></i>' +
      '</div>' +
      '</div>';
    $('#service_location').append(html);
    la++;
  });

  function remove_payers_enrollment(i) {
    $('.e-dynamic_add-' + i).remove();
  }
  var e = 1000;
  $(document).on("click", "#add-payers_enrollment", function() {
    var provider_name = $('#provider_name-0').val();
    var provider_ind_npi = $('#provider_ind_npi-0').val();
    var html = '<div class="row e-dynamic_add-' + e + '"><div class="col-md-2 e-dynamic_add-' + e + '">' +
      '<div class="mb-3">' +
      '<label for="payer_name-' + e + '" class="form-label">Payer Name</label>' +
      '<input type="text"   class="form-control"  id="payer_name-' + e + '" name="payer_name[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 e-dynamic_add-' + e + '">' +
      '<div class="mb-3">' +
      '<label for="payer_provider_name-' + e + '" class="form-label">Provider Name</label>' +
      '<input type="text"   class="form-control payer_provider_name" ' +
      'id="payer_provider_name-' + e + '" value="' + provider_name + '" name="payer_provider_name[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 e-dynamic_add-' + e + '">' +
      '<div class="mb-3">' +
      '<label for="payer_npi-' + e + '" class="form-label">NPI</label>' +
      '<input type="text"   class="form-control payer_npi" ' +
      'id="payer_npi-' + e + '" value="' + provider_ind_npi + '" name="payer_npi[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 e-dynamic_add-' + e + '">' +
      '<div class="mb-3">' +
      '<label for="payer_enroll_type-' + e + '" class="form-label">Enroll Type</label>' +
      '<select name="payer_enroll_type[]" onchange="change_npi(' + e + ')" ref="' + e + '" class="form-control payer_enroll_type" id="payer_enroll_type-' + e + '">' +
      '<option value="individual" >Individual</option>' +
      '<option value="group" >Group</option>' +
      '</select>' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 e-dynamic_add-' + e + '">' +
      '<div class="mb-3">' +
      '<label for="payer_enroll_with-' + e + '" class="form-label">Enroll With</label>' +
      '<select name="payer_enroll_with[]" class="form-control" id="payer_enroll_with-' + e + '">' +
      '<option value="tax_id" >Tax Id</option>' +
      '<option value="ssn" >SSN</option>' +
      '</select>' +
      '</div>' +
      '</div>' +
      '<div class="col-md-2 e-dynamic_add-' + e + '">' +
      '<div class="mb-3">' +
      '<label for="payer_effective_date-' + e + '" class="form-label">Enroll Effective</label>' +
      '<input type="date" class="form-control" id="payer_effective_date-' + e + '" name="payer_effective_date[]" />' +
      '</div>' +
      '</div>' +
      '<div class="col-md-1 d-flex justify-content-center align-items-center e-dynamic_add-' + e + '">' +
      '<div class="mb-3 pt-4">' +
      '<i style="cursor: pointer" onclick="remove_payers_enrollment(' + e + ')" class="fa fa-minus-circle fs-2"></i>' +
      '</div>' +
      '</div>' +
      '</div>';
    $('#payers_enrollment').append(html);
    e++;
  });

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
  var spcs = ["HOME HEALTH CARE AGENCY",
    "CHIROPRACTOR",
    "COUNSELOR",
    "GYNOCOLOGY",
    "FAMILY MEDICINE",
    "NATUROPATHIC MEDICINE",
    "BEHAVIORAL HEALTH",
    "NURSE PRACTITIONER FAMILY",
    "RADIOLOGY VASCULAR & INTERVENTI",
    "SOCIAL WORKER",
    "APPLIED BEHAVIOR ANALYST",
    "CARDIOLOGY",
    "NURSING HOME",
    "NON-EMERGENCY MEDICAL TRANSPORT",
    "HOSPITAL INPATIENT , E/M SERVICES",
    "NEROULOGY",
    "DERMATOLOGY",
    "PEDIATRICS",
    "INTERNAL MEDICNE",
    "OPTHOMOLOGY",
    "SKILLED NURSING",
    "PODIATRY",
    "PAIN MANAGEMENT",
    "MENTAL HEALTH",
    "PSYCHIATRY",
    "PODIATRIST",
    "DEVELOPMENTAL THERAPIES",
    "PAIN MEDICINE",
    "FAMILY MEDICINE",
    "DME",
    "INTERNAL MEDICNE",
    "ORTHOPAEDIC",
    "DME",
    "PHYSICAL THERAPY",
    "PLASTIC SURGERY",
    "FAMILY MEDICINE",
    "AMBULANCE SERVICES",
    "MESSAGE THERAPY",
    "SERVICE CAR",
    "PRIMARY CARE,FAMILY CARE",
    "CLINIC/CENTER HEALTH SERVICES",
    "RADIOLOGY",
    "URGENT CARE",
    "PSYCHITRY & NEUROLOGY PSYCHI",
    "ACUPUNCTURIST",
    "PSYCHOLOGIST CLINICAL",
    "PSCHIATRIST",
    "FAMILY MEDICINE",
    "HOSPITAL",
    "COMMUNITY/BEHAVIORAL HEALTH",
    "OPIOID TREATMENT PROVIDER",
    "PSYCH MEDIATION MANAGEMENT",
    "DIAGNOSTIC MEDICAL BILLING/ DENTAL",
    "FAMILY MEDICINE",
    "WOUND CARE",
    "EMERGENCY",
    "FAMILY MEDICINE",
    "HOME HEALTH CARE AGENCY",
    "ENDOSCOPY, BREST SURGERY",
    "PRIMARY CARE/INTERNAL MEDICINE",
    "SPEACH THERAPY",
    "NEUSOURGERY",
    "REPRODUCTIVE & INFERTILITY",
    "PRIMARY CARE",
    "INPATION PM AND HOSPITAL",
    "INDIVIDUAL THERAPY TO ADULTS AND CHILDREN",
    "SUPPLIERS/DURABLE MEDICAL EQUIPMENT & MEDICAL SUPPLIES, OXYGEN EQUIPMENT & SUPPLIES",
    "NUTRITIONIST NUTRITION",
    "ABA, OT, ST MENTAL HEALTH",
    "OBSTETRICS & GYNECOLOGY",
    "PSYCHIATARY, PSYCHOTHERAPY, ABA, TMS",
    "MEDICAL WOUND CARE",
    "VOCATIONAL REHALITATION",
    "REMOTE PATIENT MONITORING",
    "WOUND CARE, JOINT INJECTION",
    "BEHVIORAL THERAPY",
    "COUNSELLING/OUT PATIENT SERVICES",
    "PRIMARY CARE, MT, MENTAL HEALTH",
    "INFECTION DISEASE/ INTERNAL MEDICINE",
    "ANESTHESIA",
    "MENTAL & BEHAVIORAL HEALTH",
    "ORAL SURGERY",
    "COVID TESTING",
    "REGERATIVE MEDICINE",
    "ABA SERVICES",
    "COLLECTION AND TESTING SITES",
    "HOME HEALTH CARE AGENCY",
    "MENTAL HEALTH SERVICES",
    "BEHAVIORAL HEALTH",
    "MENTAL HEALTH THERAPY",
    "MENTAL HEALTH",
    "TRANSPORTATION",
    "PEDIATRIC GASTROENTEROLOGY",
    "MULTI SPECIALITY",
    "MASS VACINATION",
    "PSYCHIATRY & NEUROLOGY",
    "COVID TESTING",
    "COVID TESTING",
    "OCCUPATIONAL THERAPY",
    "CONSULTATION AND CASE MANAGEMENT",
    "OUTPATIENT MEDICAL CLINIC, VACCINATIONS",
    "PODATORY/WOUND CARE",
    "WOMEN HEALTH",
    "LABORATROY",
    "PSYCITARY",
    "PT/OT/ST",
    "COVID TESTING",
    "LABORATROY",
    "CLINIC/CENTER PRIMARY CARE",
    "WOUND CARE, INTERNAL MEDICINE",
    "CARDIC AND PULMENORY REHAB",
    "PODATORY",
    "SKILLED HOME HEALTH AGENCY",
    "DME",
    "HOME HEALTH CARE AGENCY",
    "LABORATROY",
    "GERIATRICS",
    "GYNOCOLOGY",
    "MEDICINE & GYNECOLOGY",
    "PHSCICOLGICAL TESTING",
    "GENERAL PEDIATRICS",
    "HOME HEALTH CARE AGENCY",
    "LABORATROY",
    "ACUTE CARE HOSPITAL",
    "MD PLASTIC SURGERY",
    "DENTISTRY, ENT",
    "PSYCHOLOGIST",
    "SIMPLE PRACTICE",
    "CLINIC/CENTER HEARING AND SPEECH",
    "CHIRO PHYSCIAL THERAPY",
    "PSYCHOTHERAPY",
    "PSYCHOLOGICAL, NEURO TESTING",
    "TELEPSYCHOLOGY SERVICES",
    "PSYCHOLOGICAL TESTING & THERAPY SERVCIES",
    "OUTPATIENT BEHAVIORAL HEALTH SERVICES",
    "PSYCHIATRY",
    "OT/PT/SLP/MH",
    "MENTAL HEALTH",
    "SN,PT,OT,MSW",
    "ALLOPATHIC AND OSTEOPATHIC PHYSICIANS/PSYCHIATRY",
    "MEDIATIATION MANAGEMENT",
    "CHIRO PHYSCIAL THERAPY",
    "GENERAL SURGERY",
    "SURGERY",
    "NUTRISIONSIT",
    "ORAL SURGERIES",
    "FACIAL PLASTIC",
    "PATHALOGY/ COVID 19",
    "BEHAVIORAL HEALTH",
    "PHYSCIAL THERAPY GENERAL",
    "BEHAVIORAL HEALTH",
    "PSYCHAITRY",
    "LABORATORY SPECIMEN TESTING",
    "SUPPLIERS/DURABLE MEDICAL EQUIPMENT",
    "MENTAL/BEHAVIORAL HEALTH",
    "CLINICAL/ GROUP PRACTICE",
    "PT,CHIRO,MASSAG",
    "MENTAL HEALTH",
    "INTERNAL MEDICNE",
    "PSCHYOLOGICAL AND COUNSELING",
    "SPAIN SURGERY",
    "AMERICAN MEDICAL",
    "ICA NOTES AND PSYCIATRY",
    "PHYSICAL THERAPY",
    "SPEECH THERAPY",
    "PSYCHIATRY",
    "FAMILY MEDICINE",
    "MENTAL HEALTH",
    "AMBULANCE-NON EMERGENCY",
    "CONSIER MEDICINE",
    "HOME HEALTH CARE AGENCY",
    "FAMILY MEDICINE",
    "COVID TESTING",
    "DERMATOLOGY/PLASTIC SURGERY",
    "NURSE ANESTHETIST",
    "INDEPENDENT LAB",
    "SLEEP DISORDER",
    "PSYCHOLOGIST COUNSELING",
    "PHYSICAL AND OCCUPATION",
    "COVID TESTING",
    "PHYSCIATRY",
    "PLASTICS SURGERY",
    "SKILLED NURSERY",
    "OT SPEECH THERAPY",
    "ADDICTION MEDICINE",
    "PHYSCIAL MEDICINE AND REHABILATION",
    "MENTAL HEALTH, ADDICTION"
  ];
  var speciality = document.querySelector('#speciality'),
    // init Tagify script on the above inputs
    tagify = new Tagify(speciality, {
      whitelist: spcs,
      maxTags: 10,
      dropdown: {
        maxItems: 20, // <- mixumum allowed rendered suggestions
        classname: "tags-look", // <- custom classname for this dropdown, so it could be targeted
        enabled: 0, // <- show suggestions on focus
        closeOnSelect: false // <- do not hide the suggestions dropdown once an item has been selected
      }
    });
  var dmail_emails = document.querySelector('#dmail_emails');
  new Tagify(dmail_emails);
</script>
@endpush
@endsection