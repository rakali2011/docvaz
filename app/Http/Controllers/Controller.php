<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Crypt;
use phpDocumentor\Reflection\PseudoTypes\True_;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;


    function formatSizeUnits($bytes)
    {
        if ($bytes >= 1073741824) {
            $bytes = number_format($bytes / 1073741824, 2) . ' GB';
        } elseif ($bytes >= 1048576) {
            $bytes = number_format($bytes / 1048576, 2) . ' MB';
        } elseif ($bytes >= 1024) {
            $bytes = number_format($bytes / 1024, 2) . ' KB';
        } elseif ($bytes > 1) {
            $bytes = $bytes . ' bytes';
        } elseif ($bytes == 1) {
            $bytes = $bytes . ' byte';
        } else {
            $bytes = '0 bytes';
        }

        return $bytes;
    }
    public function upload($file, $folder)
    {
        try {
            if ($file->isValid()) {
                $file_extension = $file->extension();
                $file_org_name = $file->getClientOriginalName();
                $file_size = $file->getSize();
                $fileName = $file->hashName();
                $path = $file->store("uploads/" . $folder);
                if ($path) {
                    $file_info['file_org_name'] = $file_org_name;
                    $file_info['file_name'] = $fileName;
                    $file_info['ext'] = $file_extension;
                    $file_info['size'] = $this->formatSizeUnits($file_size);
                    $file_info['path'] = $path;
                    return $file_info;
                }
            }
        } catch (\Throwable $th) {
            echo $th->getMessage();
        }
        exit;
    }
    public function clean_id($id)
    {
        try {
            $id = Crypt::decrypt($id);
            return $id;
        } catch (\Throwable $th) {
            abort('404', "Not Found");
        }
    }

    public function multiselect($items, $selected_item_array, $name, $label, $multiple = true)
    {

        $options = $multiple == false ? '<option value="">--Plesase Select--</option>' : '';
        foreach ($items as $key => $value) {
            $selected = '';
            if (in_array($value->id, $selected_item_array)) {
                $selected = 'selected';
            }
            $options .= '<option value="' . Crypt::encrypt($value->id) . '" ' . $selected . ' >' . $value->name . '</option>';
        }
        if ($multiple)
            $select_html = '<label for="' . $name . '">' . $label . '</label><select class="form-control select2-multi" multiple name="' . $name . '" id="' . $name . '">' . $options . '</select>';
        else
            $select_html = '<label for="' . $name . '">' . $label . '</label><select class="form-control select2-multi" name="' . $name . '" id="' . $name . '">' . $options . '</select>';
        return $select_html;
    }
}
