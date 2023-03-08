<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Practice;
use App\Models\Status;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\PostPractice;
use Illuminate\Support\Facades\DB;

class PracticeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function practices()
    {
        $data['menu'] = "client-management";
        $data['sub_menu'] = "practices";
        if (auth()->user()->hasRole('dev')) {
            $practices = Practice::orderBy('id', 'DESC')->get();
        } else {
            $practices = Practice::where('company_id', Auth::user()->company->id)->orderBy('id', 'DESC')->get();
        }
        return view('practice_management.practices', compact('data', 'practices'));
    }
    public function add_practice()
    {
        $data['menu'] = "client-management";
        $data['sub_menu'] = "practices";
        $practice = [];
        return view('practice_management.add_practice', compact('data', 'practice'));
    }
    public function edit_practice($id)
    {
        $id = $this->clean_id($id);
        $data = array();
        $data['menu'] = "client-management";
        $data['sub_menu'] = "practices";
        $practice = Practice::findorfail($id);
        return view('practice_management.edit_practice', compact('data', 'practice'));
    }
    public function post_practice(Request $req)
    {
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
            } else {
                $company_id = Auth::user()->company->id;
            }
            // Practice Status Section
            $practice_status_section = [];
            if (auth()->user()->can('update business status')) {
                $practice_status_section["company_id"] = $company_id;
                $practice_status_section["status"] = $req->status;
                $practice_status_section["reason"] = $req->reason;
                $practice_status_section["date"] = $req->date;
            }
            // Practice Information Section
            $practice_information_section = [];
            if (auth()->user()->can('update business info')) {
                $practice_information_section["name"] = $req->practice;
                $practice_information_section["speciality"] = $req->speciality;
                $practice_information_section["avg_charges"] = $req->avg_charges;
                $practice_information_section["group_npi"] = $req->group_npi;
                $practice_information_section["group_ptan"] = $req->group_ptan;
                $practice_information_section["tax_id"] = $req->tax_id;
            }
            // Address Section
            $addresses_section = [];
            if (auth()->user()->can('update business address')) {
                $physical_address = [];
                $zip = [];
                $state = [];
                $city = [];
                $zip = $req->physical_zip;
                $state = $req->physical_state;
                $city = $req->physical_city;
                foreach ($req->physical_address as $key => $value) {
                    $row = [];
                    $row["address"] = $value;
                    $row["zip"] = $zip[$key];
                    $row["state"] = $state[$key];
                    $row["city"] = $city[$key];
                    $physical_address[] = $row;
                }
                $mailing_address = [];
                $zip = [];
                $state = [];
                $city = [];
                $zip = $req->mailing_zip;
                $state = $req->mailing_state;
                $city = $req->mailing_city;
                foreach ($req->mailing_address as $key => $value) {
                    $row = [];
                    $row["address"] = $value;
                    $row["zip"] = $zip[$key];
                    $row["state"] = $state[$key];
                    $row["city"] = $city[$key];
                    $mailing_address[] = $row;
                }
                $location_address = [];
                $zip = [];
                $state = [];
                $city = [];
                $zip = $req->location_zip;
                $state = $req->location_state;
                $city = $req->location_city;
                foreach ($req->location_address as $key => $value) {
                    $row = [];
                    $row["address"] = $value;
                    $row["zip"] = $zip[$key];
                    $row["state"] = $state[$key];
                    $row["city"] = $city[$key];
                    $location_address[] = $row;
                }
                $addresses_section["physical_address"] = json_encode($physical_address);
                $addresses_section["mailing_address"] = json_encode($mailing_address);
                $addresses_section["location_address"] = json_encode($location_address);
            }
            // Contact Information Section
            $contact_information_section = [];
            if (auth()->user()->can('update business contact info')) {
                $owner_info = [];
                $name = [];
                $email = [];
                $fax = [];
                $phone = [];
                $name = $req->owner_name;
                $fax = $req->owner_fax;
                $email = $req->owner_email;
                $phone = $req->owner_phone;
                foreach ($req->owner_title as $key => $value) {
                    $row = [];
                    $row["title"] = $value;
                    $row["name"] = $name[$key];
                    $row["fax"] = $fax[$key];
                    $row["email"] = $email[$key];
                    $row["phone"] = $phone[$key];
                    $owner_info[] = $row;
                }
                $focal_info = [];
                $email = [];
                $fax = [];
                $phone = [];
                $designation = $req->focal_designation;
                $email = $req->focal_email;
                $fax = $req->focal_fax;
                $phone = $req->focal_phone;
                foreach ($req->focal_name as $key => $value) {
                    $row = [];
                    $row["designation"] = $designation[$key];
                    $row["email"] = $email[$key];
                    $row["fax"] = $fax[$key];
                    $row["name"] = $value;
                    $row["phone"] = $phone[$key];
                    $focal_info[] = $row;
                }
                $contact_information_section["dmail_emails"] = $req->dmail_emails;
                $contact_information_section["focal_info"] = json_encode($focal_info);
                $contact_information_section["owner_info"] = json_encode($owner_info);
            }
            // Provider Information Section
            $provider_information_section = [];
            if (auth()->user()->can('update business provider info')) {
                $provider_information = [];
                $name = [];
                $name = $req->provider_name;
                $dob = $req->provider_dob;
                $individual_npi = $req->provider_ind_npi;
                $individual_ptan = $req->individual_ptan;
                $ssn = $req->provider_ssn;
                $tax_id = $req->provider_tax_id;
                foreach ($name as $key => $value) {
                    $row = [];
                    $row["dob"] = $dob[$key];
                    $row["individual_npi"] = $individual_npi[$key];
                    $row["individual_ptan"] = $individual_ptan[$key];
                    $row["name"] = $value;
                    $row["ssn"] = $ssn[$key];
                    $row["tax_id"] = $tax_id[$key];
                    $provider_information[] = $row;
                }
                $provider_information_section["provider_information"] = json_encode($provider_information);
            }
            // System Details Section
            $system_details_section = [];
            if (auth()->user()->can('update business system detail')) {
                $management_software = [];
                $name = [];
                $name = $req->pms_name;
                $url = $req->pms_url;
                $username = $req->pms_username;
                $password = $req->pms_password;
                foreach ($name as $key => $value) {
                    $row = [];
                    $row["name"] = $value;
                    $row["url"] = $url[$key];
                    $row["username"] = $username[$key];
                    $row["password"] = $password[$key];
                    $management_software[] = $row;
                }
                $ehr["name"] = $req->ehr_name;
                $ehr["url"] = $req->ehr_url;
                $ehr["username"] = $req->ehr_username;
                $ehr["password"] = $req->ehr_password;
                $clearinghouse["name"] = $req->clearinghouse_name;
                $clearinghouse["url"] = $req->clearinghouse_url;
                $clearinghouse["username"] = $req->clearinghouse_username;
                $clearinghouse["password"] = $req->clearinghouse_password;
                $caqh["name"] = $req->caqh_name;
                $caqh["url"] = $req->caqh_url;
                $caqh["username"] = $req->caqh_username;
                $caqh["password"] = $req->caqh_password;
                $system_details_section["caqh"] = json_encode($caqh);
                $system_details_section["clearinghouse"] = json_encode($clearinghouse);
                $system_details_section["ehr"] = json_encode($ehr);
                $system_details_section["management_software"] = json_encode($management_software);
            }
            // Payers Enrollment Information Section
            $payers_enrollment_information_section = [];
            if (auth()->user()->can('update business payers enrollment info')) {
                $payers_info = [];
                $payer_name = $req->payer_name;
                $provider_name = $req->payer_provider_name;
                $npi = $req->payer_npi;
                $enroll_type = $req->payer_enroll_type;
                $enroll_with = $req->payer_enroll_with;
                $effective_date = $req->payer_effective_date;
                foreach ($payer_name as $key => $value) {
                    $row = [];
                    $row["payer_name"] = $value;
                    $row["provider_name"] = $provider_name[$key];
                    $row["npi"] = $npi[$key];
                    $row["enroll_type"] = $enroll_type[$key];
                    $row["enroll_with"] = $enroll_with[$key];
                    $row["effective_date"] = $effective_date[$key];
                    $payers_info[] = $row;
                }
                $payers_enrollment_information_section["payers_info"] = json_encode($payers_info);
            }
            // Claim Creation Frequency Section
            $claim_creation_frequency_section = [];
            if (auth()->user()->can('update business claim frequency')) {
                $claim_creation_frequency = [];
                $claim_creation_frequency["option"] = $req->claim_freq_option;
                $claim_creation_frequency["value"] = $req->claim_freq_value;
                $claim_creation_frequency_section["claim_creation_frequency"] = json_encode($claim_creation_frequency);
            }
            // Bellmedex Services Section
            $bellmedex_services_section = [];
            if (auth()->user()->can('update business services')) {
                $bellmedex_services["credentialing"] = isset($req->credentialing) ? $req->credentialing : 0;
                $bellmedex_services["coding"] = isset($req->coding) ? $req->coding : 0;
                $bellmedex_services["phd"] = isset($req->phd) ? $req->phd : 0;
                $bellmedex_services["billing"] = isset($req->billing) ? $req->billing : 0;
                $bellmedex_services["eligibility_check"] = isset($req->eligibility_check) ? $req->eligibility_check : 0;
                $bellmedex_services["authorization"] = isset($req->authorization) ? $req->authorization : 0;
                $bellmedex_services["patient_statement"] = isset($req->patient_statement) ? $req->patient_statement : 0;
                $bellmedex_services["ar"] = isset($req->ar) ? $req->ar : 0;
                $bellmedex_services["ar_start"] = $req->ar_start;
                $bellmedex_services["key_billing_issues"] = $req->key_billing_issues;
                $bellmedex_services["complementary_services"] = $req->complementary_services;
                $bellmedex_services["special_instructions"] = $req->special_instructions;
                $bellmedex_services_section["bellmedex_services"] = json_encode($bellmedex_services);
            }
            // CRM Section
            $crm_section = [];
            if (auth()->user()->can('update business crm')) {
                $crm["welcome_email"] = $req->welcome_email;
                $crm["onboarding_metting_date"] = $req->onboarding_metting_date;
                $crm["attended_by_crm_team"] = $req->attended_by_crm_team;
                $crm["docuhub_orientation"] = isset($req->docuhub_orientation) ? $req->docuhub_orientation : 0;
                $crm["orientation_datetime"] = $req->orientation_datetime;
                $crm["orientation_by"] = $req->orientation_by;
                $crm["mom_sharing_date"] = $req->mom_sharing_date;
                $crm_section["crm"] = json_encode($crm);
            }
            // Operations Section
            $operations_section = [];
            if (auth()->user()->can('update business operations')) {
                $operations["logins_receipt"] = isset($req->logins_receipt) ? $req->logins_receipt : 0;
                $operations["login_date"] = $req->login_date;
                $operations["sop_preparation"] = isset($req->sop_preparation) ? $req->sop_preparation : 0;
                $operations["first_service_provided_name"] = $req->first_service_provided_name;
                $operations["preparation_date"] = $req->preparation_date;
                $operations["first_billing_received"] = $req->first_billing_received;
                $operations_section["operations"] = json_encode($operations);
            }
            // Practice Threshold Per Hour Section
            $practice_threshold_per_hour_section = [];
            if (auth()->user()->can('update business threshold per hour')) {
                $practice_threshold_per_hour["thresh_eligibility_cal_checkbox"] = isset($req->thresh_eligibility_cal_checkbox) ? $req->thresh_eligibility_cal_checkbox : 0;
                $practice_threshold_per_hour["thresh_eligibility"] = $req->thresh_eligibility;
                $practice_threshold_per_hour["thresh_charge_manual_checkbox"] = isset($req->thresh_charge_manual_checkbox) ? $req->thresh_charge_manual_checkbox : 0;
                $practice_threshold_per_hour["thresh_charge_with_demo_graphics_checkbox"] = isset($req->thresh_charge_with_demo_graphics_checkbox) ? $req->thresh_charge_with_demo_graphics_checkbox : 0;
                $practice_threshold_per_hour["thresh_charge_entry"] = $req->thresh_charge_entry;
                $practice_threshold_per_hour["thresh_posting_manual_checkbox"] = isset($req->thresh_posting_manual_checkbox) ? $req->thresh_posting_manual_checkbox : 0;
                $practice_threshold_per_hour["thresh_posting"] = $req->thresh_posting;
                $practice_threshold_per_hour["thresh_eligibility_portal_checkbox"] = isset($req->thresh_eligibility_portal_checkbox) ? $req->thresh_eligibility_portal_checkbox : 0;
                $practice_threshold_per_hour["thresh_portal"] = $req->thresh_portal;
                $practice_threshold_per_hour["thresh_charge_elect_checkbox"] = isset($req->thresh_charge_elect_checkbox) ? $req->thresh_charge_elect_checkbox : 0;
                $practice_threshold_per_hour["thresh_elect"] = $req->thresh_elect;
                $practice_threshold_per_hour["thresh_posting_elect_checkbox"] = isset($req->thresh_posting_elect_checkbox) ? $req->thresh_posting_elect_checkbox : 0;
                $practice_threshold_per_hour["thresh_posting_elect"] = $req->thresh_posting_elect;
                $practice_threshold_per_hour["thresh_auth"] = $req->thresh_auth;
                $practice_threshold_per_hour["thresh_rejections"] = $req->thresh_rejections;
                $practice_threshold_per_hour["thresh_denials"] = $req->thresh_denials;
                $thresh_payer = [];
                $name = [];
                $name = $req->thresh_payer_name;
                $claims = $req->thresh_payer_claims;
                foreach ($name as $key => $value) {
                    $row = [];
                    $row["name"] = $value;
                    $row["claims"] = $claims[$key];
                    $thresh_payer[] = $row;
                }
                $practice_threshold_per_hour_section["practice_threshold_per_hour"] = json_encode($practice_threshold_per_hour);
                $practice_threshold_per_hour_section["thresh_payer"] = json_encode($thresh_payer);
            }
            $form_data = array_merge($practice_status_section, $practice_information_section, $addresses_section, $contact_information_section, $provider_information_section, $system_details_section, $payers_enrollment_information_section, $claim_creation_frequency_section, $bellmedex_services_section, $crm_section, $operations_section, $practice_threshold_per_hour_section);
            Practice::create($form_data);
            DB::commit();
            return redirect()->route('practices')->with('success', "Practice Created Successfully");
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function update_practice(Request $req, $id = "")
    {
        if ($id) {
            $id = $this->clean_id($id);
        }
        DB::beginTransaction();
        try {
            if (auth()->user()->hasRole('dev')) {
                $company_id = $req->company;
            } else {
                $company_id = Auth::user()->company->id;
            }
            // Practice Status Section
            $practice_status_section = [];
            if (auth()->user()->can('update business status')) {
                $practice_status_section["company_id"] = $company_id;
                $practice_status_section["status"] = $req->status;
                $practice_status_section["reason"] = $req->reason;
                $practice_status_section["date"] = $req->date;
            }
            // Practice Information Section
            $practice_information_section = [];
            if (auth()->user()->can('update business info')) {
                $practice_information_section["name"] = $req->practice;
                $practice_information_section["speciality"] = $req->speciality;
                $practice_information_section["avg_charges"] = $req->avg_charges;
                $practice_information_section["group_npi"] = $req->group_npi;
                $practice_information_section["group_ptan"] = $req->group_ptan;
                $practice_information_section["tax_id"] = $req->tax_id;
            }
            // Address Section
            $addresses_section = [];
            if (auth()->user()->can('update business address')) {
                $physical_address = [];
                $zip = [];
                $state = [];
                $city = [];
                $zip = $req->physical_zip;
                $state = $req->physical_state;
                $city = $req->physical_city;
                foreach ($req->physical_address as $key => $value) {
                    $row = [];
                    $row["address"] = $value;
                    $row["zip"] = $zip[$key];
                    $row["state"] = $state[$key];
                    $row["city"] = $city[$key];
                    $physical_address[] = $row;
                }
                $mailing_address = [];
                $zip = [];
                $state = [];
                $city = [];
                $zip = $req->mailing_zip;
                $state = $req->mailing_state;
                $city = $req->mailing_city;
                foreach ($req->mailing_address as $key => $value) {
                    $row = [];
                    $row["address"] = $value;
                    $row["zip"] = $zip[$key];
                    $row["state"] = $state[$key];
                    $row["city"] = $city[$key];
                    $mailing_address[] = $row;
                }
                $location_address = [];
                $zip = [];
                $state = [];
                $city = [];
                $zip = $req->location_zip;
                $state = $req->location_state;
                $city = $req->location_city;
                foreach ($req->location_address as $key => $value) {
                    $row = [];
                    $row["address"] = $value;
                    $row["zip"] = $zip[$key];
                    $row["state"] = $state[$key];
                    $row["city"] = $city[$key];
                    $location_address[] = $row;
                }
                $addresses_section["physical_address"] = json_encode($physical_address);
                $addresses_section["mailing_address"] = json_encode($mailing_address);
                $addresses_section["location_address"] = json_encode($location_address);
            }
            // Contact Information Section
            $contact_information_section = [];
            if (auth()->user()->can('update business contact info')) {
                $owner_info = [];
                $name = [];
                $email = [];
                $fax = [];
                $phone = [];
                $name = $req->owner_name;
                $fax = $req->owner_fax;
                $email = $req->owner_email;
                $phone = $req->owner_phone;
                foreach ($req->owner_title as $key => $value) {
                    $row = [];
                    $row["title"] = $value;
                    $row["name"] = $name[$key];
                    $row["fax"] = $fax[$key];
                    $row["email"] = $email[$key];
                    $row["phone"] = $phone[$key];
                    $owner_info[] = $row;
                }
                $focal_info = [];
                $email = [];
                $fax = [];
                $phone = [];
                $designation = $req->focal_designation;
                $email = $req->focal_email;
                $fax = $req->focal_fax;
                $phone = $req->focal_phone;
                foreach ($req->focal_name as $key => $value) {
                    $row = [];
                    $row["designation"] = $designation[$key];
                    $row["email"] = $email[$key];
                    $row["fax"] = $fax[$key];
                    $row["name"] = $value;
                    $row["phone"] = $phone[$key];
                    $focal_info[] = $row;
                }
                $contact_information_section["dmail_emails"] = $req->dmail_emails;
                $contact_information_section["focal_info"] = json_encode($focal_info);
                $contact_information_section["owner_info"] = json_encode($owner_info);
            }
            // Provider Information Section
            $provider_information_section = [];
            if (auth()->user()->can('update business provider info')) {
                $provider_information = [];
                $name = [];
                $name = $req->provider_name;
                $dob = $req->provider_dob;
                $individual_npi = $req->provider_ind_npi;
                $individual_ptan = $req->individual_ptan;
                $ssn = $req->provider_ssn;
                $tax_id = $req->provider_tax_id;
                foreach ($name as $key => $value) {
                    $row = [];
                    $row["dob"] = $dob[$key];
                    $row["individual_npi"] = $individual_npi[$key];
                    $row["individual_ptan"] = $individual_ptan[$key];
                    $row["name"] = $value;
                    $row["ssn"] = $ssn[$key];
                    $row["tax_id"] = $tax_id[$key];
                    $provider_information[] = $row;
                }
                $provider_information_section["provider_information"] = json_encode($provider_information);
            }
            // System Details Section
            $system_details_section = [];
            if (auth()->user()->can('update business system detail')) {
                $management_software = [];
                $name = [];
                $name = $req->pms_name;
                $url = $req->pms_url;
                $username = $req->pms_username;
                $password = $req->pms_password;
                foreach ($name as $key => $value) {
                    $row = [];
                    $row["name"] = $value;
                    $row["url"] = $url[$key];
                    $row["username"] = $username[$key];
                    $row["password"] = $password[$key];
                    $management_software[] = $row;
                }
                $ehr["name"] = $req->ehr_name;
                $ehr["url"] = $req->ehr_url;
                $ehr["username"] = $req->ehr_username;
                $ehr["password"] = $req->ehr_password;
                $clearinghouse["name"] = $req->clearinghouse_name;
                $clearinghouse["url"] = $req->clearinghouse_url;
                $clearinghouse["username"] = $req->clearinghouse_username;
                $clearinghouse["password"] = $req->clearinghouse_password;
                $caqh["name"] = $req->caqh_name;
                $caqh["url"] = $req->caqh_url;
                $caqh["username"] = $req->caqh_username;
                $caqh["password"] = $req->caqh_password;
                $system_details_section["caqh"] = json_encode($caqh);
                $system_details_section["clearinghouse"] = json_encode($clearinghouse);
                $system_details_section["ehr"] = json_encode($ehr);
                $system_details_section["management_software"] = json_encode($management_software);
            }
            // Payers Enrollment Information Section
            $payers_enrollment_information_section = [];
            if (auth()->user()->can('update business payers enrollment info')) {
                $payers_info = [];
                $payer_name = $req->payer_name;
                $provider_name = $req->payer_provider_name;
                $npi = $req->payer_npi;
                $enroll_type = $req->payer_enroll_type;
                $enroll_with = $req->payer_enroll_with;
                $effective_date = $req->payer_effective_date;
                foreach ($payer_name as $key => $value) {
                    $row = [];
                    $row["payer_name"] = $value;
                    $row["provider_name"] = $provider_name[$key];
                    $row["npi"] = $npi[$key];
                    $row["enroll_type"] = $enroll_type[$key];
                    $row["enroll_with"] = $enroll_with[$key];
                    $row["effective_date"] = $effective_date[$key];
                    $payers_info[] = $row;
                }
                $payers_enrollment_information_section["payers_info"] = json_encode($payers_info);
            }
            // Claim Creation Frequency Section
            $claim_creation_frequency_section = [];
            if (auth()->user()->can('update business claim frequency')) {
                $claim_creation_frequency = [];
                $claim_creation_frequency["option"] = $req->claim_freq_option;
                $claim_creation_frequency["value"] = $req->claim_freq_value;
                $claim_creation_frequency_section["claim_creation_frequency"] = json_encode($claim_creation_frequency);
            }
            // Bellmedex Services Section
            $bellmedex_services_section = [];
            if (auth()->user()->can('update business services')) {
                $bellmedex_services["credentialing"] = isset($req->credentialing) ? $req->credentialing : 0;
                $bellmedex_services["coding"] = isset($req->coding) ? $req->coding : 0;
                $bellmedex_services["phd"] = isset($req->phd) ? $req->phd : 0;
                $bellmedex_services["billing"] = isset($req->billing) ? $req->billing : 0;
                $bellmedex_services["eligibility_check"] = isset($req->eligibility_check) ? $req->eligibility_check : 0;
                $bellmedex_services["authorization"] = isset($req->authorization) ? $req->authorization : 0;
                $bellmedex_services["patient_statement"] = isset($req->patient_statement) ? $req->patient_statement : 0;
                $bellmedex_services["ar"] = isset($req->ar) ? $req->ar : 0;
                $bellmedex_services["ar_start"] = $req->ar_start;
                $bellmedex_services["key_billing_issues"] = $req->key_billing_issues;
                $bellmedex_services["complementary_services"] = $req->complementary_services;
                $bellmedex_services["special_instructions"] = $req->special_instructions;
                $bellmedex_services_section["bellmedex_services"] = json_encode($bellmedex_services);
            }
            // CRM Section
            $crm_section = [];
            if (auth()->user()->can('update business crm')) {
                $crm["welcome_email"] = $req->welcome_email;
                $crm["onboarding_metting_date"] = $req->onboarding_metting_date;
                $crm["attended_by_crm_team"] = $req->attended_by_crm_team;
                $crm["docuhub_orientation"] = isset($req->docuhub_orientation) ? $req->docuhub_orientation : 0;
                $crm["orientation_datetime"] = $req->orientation_datetime;
                $crm["orientation_by"] = $req->orientation_by;
                $crm["mom_sharing_date"] = $req->mom_sharing_date;
                $crm_section["crm"] = json_encode($crm);
            }
            // Operations Section
            $operations_section = [];
            if (auth()->user()->can('update business operations')) {
                $operations["logins_receipt"] = isset($req->logins_receipt) ? $req->logins_receipt : 0;
                $operations["login_date"] = $req->login_date;
                $operations["sop_preparation"] = isset($req->sop_preparation) ? $req->sop_preparation : 0;
                $operations["first_service_provided_name"] = $req->first_service_provided_name;
                $operations["preparation_date"] = $req->preparation_date;
                $operations["first_billing_received"] = $req->first_billing_received;
                $operations_section["operations"] = json_encode($operations);
            }
            // Practice Threshold Per Hour Section
            $practice_threshold_per_hour_section = [];
            if (auth()->user()->can('update business threshold per hour')) {
                $practice_threshold_per_hour["thresh_eligibility_cal_checkbox"] = isset($req->thresh_eligibility_cal_checkbox) ? $req->thresh_eligibility_cal_checkbox : 0;
                $practice_threshold_per_hour["thresh_eligibility"] = $req->thresh_eligibility;
                $practice_threshold_per_hour["thresh_charge_manual_checkbox"] = isset($req->thresh_charge_manual_checkbox) ? $req->thresh_charge_manual_checkbox : 0;
                $practice_threshold_per_hour["thresh_charge_with_demo_graphics_checkbox"] = isset($req->thresh_charge_with_demo_graphics_checkbox) ? $req->thresh_charge_with_demo_graphics_checkbox : 0;
                $practice_threshold_per_hour["thresh_charge_entry"] = $req->thresh_charge_entry;
                $practice_threshold_per_hour["thresh_posting_manual_checkbox"] = isset($req->thresh_posting_manual_checkbox) ? $req->thresh_posting_manual_checkbox : 0;
                $practice_threshold_per_hour["thresh_posting"] = $req->thresh_posting;
                $practice_threshold_per_hour["thresh_eligibility_portal_checkbox"] = isset($req->thresh_eligibility_portal_checkbox) ? $req->thresh_eligibility_portal_checkbox : 0;
                $practice_threshold_per_hour["thresh_portal"] = $req->thresh_portal;
                $practice_threshold_per_hour["thresh_charge_elect_checkbox"] = isset($req->thresh_charge_elect_checkbox) ? $req->thresh_charge_elect_checkbox : 0;
                $practice_threshold_per_hour["thresh_elect"] = $req->thresh_elect;
                $practice_threshold_per_hour["thresh_posting_elect_checkbox"] = isset($req->thresh_posting_elect_checkbox) ? $req->thresh_posting_elect_checkbox : 0;
                $practice_threshold_per_hour["thresh_posting_elect"] = $req->thresh_posting_elect;
                $practice_threshold_per_hour["thresh_auth"] = $req->thresh_auth;
                $practice_threshold_per_hour["thresh_rejections"] = $req->thresh_rejections;
                $practice_threshold_per_hour["thresh_denials"] = $req->thresh_denials;
                $thresh_payer = [];
                $name = [];
                $name = $req->thresh_payer_name;
                $claims = $req->thresh_payer_claims;
                foreach ($name as $key => $value) {
                    $row = [];
                    $row["name"] = $value;
                    $row["claims"] = $claims[$key];
                    $thresh_payer[] = $row;
                }
                $practice_threshold_per_hour_section["practice_threshold_per_hour"] = json_encode($practice_threshold_per_hour);
                $practice_threshold_per_hour_section["thresh_payer"] = json_encode($thresh_payer);
            }
            $form_data = array_merge($practice_status_section, $practice_information_section, $addresses_section, $contact_information_section, $provider_information_section, $system_details_section, $payers_enrollment_information_section, $claim_creation_frequency_section, $bellmedex_services_section, $crm_section, $operations_section, $practice_threshold_per_hour_section);
            $practice = Practice::findorfail($id);
            $practice->update($form_data);
            DB::commit();
            return redirect()->route('practices')->with('success', "Practice Updated Successfully");
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function get_practices(Request $req)
    {
        $response = array();
        try {
            $user_id = $this->clean_id($req->ref);
            $user = User::find($user_id);
            if (auth()->user()->can('assign practice user')) {
                $practices = Practice::where('status', 1)->where('company_id', $user->company_id)->orderBy('name', 'ASC')->get();
            } else {
                $practices = Auth::user()->assinged_practices();
            }
            $assigned_practices = $user->assinged_practices_array();
            $response['success'] = 1;
            $response['role'] = auth()->user()->getRoleNames();
            $select = $this->multiselect($practices, $assigned_practices, 'user_practices[]', 'User Practices');
            $response['content'] = $select;
        } catch (\Throwable $th) {
            $response['success'] = 0;
            $response['message'] = "Something Went Wrong Try Again";
        }
        return response()->json($response);
    }
}
