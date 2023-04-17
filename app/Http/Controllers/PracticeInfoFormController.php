<?php

namespace App\Http\Controllers;

use App\Models\Practice;
use App\Models\Link;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PracticeInfoFormController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $link = Link::where('token', $request->token)->first();
            // Practice Status Section
            $practice_status_section = [];
            $practice_status_section["company_id"] = $link->company_id;
            $practice_status_section["link_id"] = $link->id;
            // Practice Information Section
            $practice_information_section = [];
            $practice_information_section["name"] = $request->practice;
            $practice_information_section["speciality"] = get_tagsinput($request->speciality);
            $practice_information_section["avg_charges"] = $request->avg_charges;
            $practice_information_section["group_npi"] = $request->group_npi;
            $practice_information_section["group_ptan"] = $request->group_ptan;
            $practice_information_section["tax_id"] = $request->tax_id;
            // Address Section
            $addresses_section = [];
            $physical_address = [];
            $zip = [];
            $state = [];
            $city = [];
            $zip = $request->physical_zip;
            $state = $request->physical_state;
            $city = $request->physical_city;
            foreach ($request->physical_address as $key => $value) {
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
            $zip = $request->mailing_zip;
            $state = $request->mailing_state;
            $city = $request->mailing_city;
            foreach ($request->mailing_address as $key => $value) {
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
            $zip = $request->location_zip;
            $state = $request->location_state;
            $city = $request->location_city;
            foreach ($request->location_address as $key => $value) {
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
            // Contact Information Section
            $contact_information_section = [];
            $owner_info = [];
            $name = [];
            $email = [];
            $fax = [];
            $phone = [];
            $name = $request->owner_name;
            $fax = $request->owner_fax;
            $email = $request->owner_email;
            $phone = $request->owner_phone;
            foreach ($request->owner_title as $key => $value) {
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
            $designation = $request->focal_designation;
            $email = $request->focal_email;
            $fax = $request->focal_fax;
            $phone = $request->focal_phone;
            foreach ($request->focal_name as $key => $value) {
                $row = [];
                $row["designation"] = $designation[$key];
                $row["email"] = $email[$key];
                $row["fax"] = $fax[$key];
                $row["name"] = $value;
                $row["phone"] = $phone[$key];
                $focal_info[] = $row;
            }
            $contact_information_section["dmail_emails"] = get_tagsinput($request->dmail_emails);
            $contact_information_section["focal_info"] = json_encode($focal_info);
            $contact_information_section["owner_info"] = json_encode($owner_info);
            // Provider Information Section
            $provider_information_section = [];
            $provider_information = [];
            $name = [];
            $name = $request->provider_name;
            $dob = $request->provider_dob;
            $individual_npi = $request->provider_ind_npi;
            $individual_ptan = $request->individual_ptan;
            $ssn = $request->provider_ssn;
            $tax_id = $request->provider_tax_id;
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
            // System Details Section
            $system_details_section = [];
            $management_software = [];
            $name = [];
            $name = $request->pms_name;
            $url = $request->pms_url;
            $username = $request->pms_username;
            $password = $request->pms_password;
            foreach ($name as $key => $value) {
                $row = [];
                $row["name"] = $value;
                $row["url"] = $url[$key];
                $row["username"] = $username[$key];
                $row["password"] = $password[$key];
                $management_software[] = $row;
            }
            $ehr["name"] = $request->ehr_name;
            $ehr["url"] = $request->ehr_url;
            $ehr["username"] = $request->ehr_username;
            $ehr["password"] = $request->ehr_password;
            $clearinghouse["name"] = $request->clearinghouse_name;
            $clearinghouse["url"] = $request->clearinghouse_url;
            $clearinghouse["username"] = $request->clearinghouse_username;
            $clearinghouse["password"] = $request->clearinghouse_password;
            $caqh["name"] = $request->caqh_name;
            $caqh["url"] = $request->caqh_url;
            $caqh["username"] = $request->caqh_username;
            $caqh["password"] = $request->caqh_password;
            $system_details_section["caqh"] = json_encode($caqh);
            $system_details_section["clearinghouse"] = json_encode($clearinghouse);
            $system_details_section["ehr"] = json_encode($ehr);
            $system_details_section["management_software"] = json_encode($management_software);
            // Payers Enrollment Information Section
            $payers_enrollment_information_section = [];
            $payers_info = [];
            $payer_name = $request->payer_name;
            $provider_name = $request->payer_provider_name;
            $npi = $request->payer_npi;
            $enroll_type = $request->payer_enroll_type;
            $enroll_with = $request->payer_enroll_with;
            $effective_date = $request->payer_effective_date;
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
            // Claim Creation Frequency Section
            $claim_creation_frequency_section = [];
            $claim_creation_frequency = [];
            $claim_creation_frequency["option"] = $request->claim_freq_option;
            $claim_creation_frequency["value"] = $request->claim_freq_value;
            $claim_creation_frequency_section["claim_creation_frequency"] = json_encode($claim_creation_frequency);
            // Bellmedex Services Section
            $bellmedex_services_section = [];
            $bellmedex_services["credentialing"] = isset($request->credentialing) ? $request->credentialing : 0;
            $bellmedex_services["coding"] = isset($request->coding) ? $request->coding : 0;
            $bellmedex_services["phd"] = isset($request->phd) ? $request->phd : 0;
            $bellmedex_services["billing"] = isset($request->billing) ? $request->billing : 0;
            $bellmedex_services["eligibility_check"] = isset($request->eligibility_check) ? $request->eligibility_check : 0;
            $bellmedex_services["authorization"] = isset($request->authorization) ? $request->authorization : 0;
            $bellmedex_services["patient_statement"] = isset($request->patient_statement) ? $request->patient_statement : 0;
            $bellmedex_services["ar"] = isset($request->ar) ? $request->ar : 0;
            $bellmedex_services["ar_start"] = $request->ar_start;
            $bellmedex_services["key_billing_issues"] = $request->key_billing_issues;
            $bellmedex_services["complementary_services"] = $request->complementary_services;
            $bellmedex_services["special_instructions"] = $request->special_instructions;
            $bellmedex_services_section["bellmedex_services"] = json_encode($bellmedex_services);
            $default['crm'] = '{"welcome_email": null,"orientation_by": null,"mom_sharing_date": null,"docuhub_orientation": "0","attended_by_crm_team": null,"orientation_datetime": null,"onboarding_metting_date": null}';
            $default['operations'] = '{"logins_receipt": null,"sop_preparation": "0","preparation_date": null,"first_billing_received": null,"first_service_provided_name": null}';
            $default['practice_threshold_per_hour'] = '{"thresh_auth": null,"thresh_elect": null,"thresh_portal": null,"thresh_denials": null,"thresh_posting": null,"thresh_rejections": null,"thresh_eligibility": null,"thresh_charge_entry": null,"thresh_posting_elect": null,"thresh_charge_elect_checkbox": "0","thresh_charge_manual_checkbox": "0","thresh_posting_elect_checkbox": "0","thresh_posting_manual_checkbox": "0","thresh_eligibility_cal_checkbox": "0","thresh_eligibility_portal_checkbox": "0","thresh_charge_with_demo_graphics_checkbox": "0"}';
            $default['thresh_payer'] = '[{"name": null,"claims": null}]';
            $form_data = array_merge($practice_status_section, $practice_information_section, $addresses_section, $contact_information_section, $provider_information_section, $system_details_section, $payers_enrollment_information_section, $claim_creation_frequency_section, $bellmedex_services_section, $default);
            Practice::create($form_data);
            DB::commit();
            return redirect()->route('practices')->with('success', "Practice Created Successfully");
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->withInput()->with('error', $th->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Practice  $practice
     * @return \Illuminate\Http\Response
     */
    public function show(Practice $practice)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Practice  $practice
     * @return \Illuminate\Http\Response
     */
    public function edit(Practice $practice)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Practice  $practice
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            // Practice Information Section
            $practice_information_section = [];
            $practice_information_section["name"] = $request->practice;
            $practice_information_section["speciality"] = get_tagsinput($request->speciality);
            $practice_information_section["avg_charges"] = $request->avg_charges;
            $practice_information_section["group_npi"] = $request->group_npi;
            $practice_information_section["group_ptan"] = $request->group_ptan;
            $practice_information_section["tax_id"] = $request->tax_id;
            // Address Section
            $addresses_section = [];
            $physical_address = [];
            $zip = [];
            $state = [];
            $city = [];
            $zip = $request->physical_zip;
            $state = $request->physical_state;
            $city = $request->physical_city;
            foreach ($request->physical_address as $key => $value) {
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
            $zip = $request->mailing_zip;
            $state = $request->mailing_state;
            $city = $request->mailing_city;
            foreach ($request->mailing_address as $key => $value) {
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
            $zip = $request->location_zip;
            $state = $request->location_state;
            $city = $request->location_city;
            foreach ($request->location_address as $key => $value) {
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
            // Contact Information Section
            $contact_information_section = [];
            $owner_info = [];
            $name = [];
            $email = [];
            $fax = [];
            $phone = [];
            $name = $request->owner_name;
            $fax = $request->owner_fax;
            $email = $request->owner_email;
            $phone = $request->owner_phone;
            foreach ($request->owner_title as $key => $value) {
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
            $designation = $request->focal_designation;
            $email = $request->focal_email;
            $fax = $request->focal_fax;
            $phone = $request->focal_phone;
            foreach ($request->focal_name as $key => $value) {
                $row = [];
                $row["designation"] = $designation[$key];
                $row["email"] = $email[$key];
                $row["fax"] = $fax[$key];
                $row["name"] = $value;
                $row["phone"] = $phone[$key];
                $focal_info[] = $row;
            }
            $contact_information_section["dmail_emails"] = get_tagsinput($request->dmail_emails);
            $contact_information_section["focal_info"] = json_encode($focal_info);
            $contact_information_section["owner_info"] = json_encode($owner_info);
            // Provider Information Section
            $provider_information_section = [];
            $provider_information = [];
            $name = [];
            $name = $request->provider_name;
            $dob = $request->provider_dob;
            $individual_npi = $request->provider_ind_npi;
            $individual_ptan = $request->individual_ptan;
            $ssn = $request->provider_ssn;
            $tax_id = $request->provider_tax_id;
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
            // System Details Section
            $system_details_section = [];
            $management_software = [];
            $name = [];
            $name = $request->pms_name;
            $url = $request->pms_url;
            $username = $request->pms_username;
            $password = $request->pms_password;
            foreach ($name as $key => $value) {
                $row = [];
                $row["name"] = $value;
                $row["url"] = $url[$key];
                $row["username"] = $username[$key];
                $row["password"] = $password[$key];
                $management_software[] = $row;
            }
            $ehr["name"] = $request->ehr_name;
            $ehr["url"] = $request->ehr_url;
            $ehr["username"] = $request->ehr_username;
            $ehr["password"] = $request->ehr_password;
            $clearinghouse["name"] = $request->clearinghouse_name;
            $clearinghouse["url"] = $request->clearinghouse_url;
            $clearinghouse["username"] = $request->clearinghouse_username;
            $clearinghouse["password"] = $request->clearinghouse_password;
            $caqh["name"] = $request->caqh_name;
            $caqh["url"] = $request->caqh_url;
            $caqh["username"] = $request->caqh_username;
            $caqh["password"] = $request->caqh_password;
            $system_details_section["caqh"] = json_encode($caqh);
            $system_details_section["clearinghouse"] = json_encode($clearinghouse);
            $system_details_section["ehr"] = json_encode($ehr);
            $system_details_section["management_software"] = json_encode($management_software);
            // Payers Enrollment Information Section
            $payers_enrollment_information_section = [];
            $payers_info = [];
            $payer_name = $request->payer_name;
            $provider_name = $request->payer_provider_name;
            $npi = $request->payer_npi;
            $enroll_type = $request->payer_enroll_type;
            $enroll_with = $request->payer_enroll_with;
            $effective_date = $request->payer_effective_date;
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
            // Claim Creation Frequency Section
            $claim_creation_frequency_section = [];
            $claim_creation_frequency = [];
            $claim_creation_frequency["option"] = $request->claim_freq_option;
            $claim_creation_frequency["value"] = $request->claim_freq_value;
            $claim_creation_frequency_section["claim_creation_frequency"] = json_encode($claim_creation_frequency);
            // Bellmedex Services Section
            $bellmedex_services_section = [];
            $bellmedex_services["credentialing"] = isset($request->credentialing) ? $request->credentialing : 0;
            $bellmedex_services["coding"] = isset($request->coding) ? $request->coding : 0;
            $bellmedex_services["phd"] = isset($request->phd) ? $request->phd : 0;
            $bellmedex_services["billing"] = isset($request->billing) ? $request->billing : 0;
            $bellmedex_services["eligibility_check"] = isset($request->eligibility_check) ? $request->eligibility_check : 0;
            $bellmedex_services["authorization"] = isset($request->authorization) ? $request->authorization : 0;
            $bellmedex_services["patient_statement"] = isset($request->patient_statement) ? $request->patient_statement : 0;
            $bellmedex_services["ar"] = isset($request->ar) ? $request->ar : 0;
            $bellmedex_services["ar_start"] = $request->ar_start;
            $bellmedex_services["key_billing_issues"] = $request->key_billing_issues;
            $bellmedex_services["complementary_services"] = $request->complementary_services;
            $bellmedex_services["special_instructions"] = $request->special_instructions;
            $bellmedex_services_section["bellmedex_services"] = json_encode($bellmedex_services);
            $form_data = array_merge($practice_information_section, $addresses_section, $contact_information_section, $provider_information_section, $system_details_section, $payers_enrollment_information_section, $claim_creation_frequency_section, $bellmedex_services_section);
            $practice = Practice::findorfail($id);
            $practice->update($form_data);
            DB::commit();
            return redirect()->route('practices')->with('success', "Practice Updated Successfully");
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->withInput()->with('error', $th->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Practice  $practice
     * @return \Illuminate\Http\Response
     */
    public function destroy(Practice $practice)
    {
        //
    }
    public function practiceInfoForm(Request $request, $token)
    {
        $link = Link::where('token', $token)->first();
        $practice = Practice::where('link_id', $link->id)->first();
        if (date("Y-m-d H:i:s") > $link->expired_at)
            abort(404);
        else if (isset($practice->id)) {
            $data = array();
            $data['menu'] = 'general-management';
            $data['sub_menu'] = 'links';
            $links = [];
            return view('practice_info_form.edit', compact('data', 'practice'));
        } else {
            $data = array();
            $data['menu'] = 'general-management';
            $data['sub_menu'] = 'links';
            $links = [];
            return view('practice_info_form.create', compact('data', 'token'));
        }
    }
}
