<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class File extends Model
{
    use HasFactory;
    public function getStatusAttribute($value)
    {
        return get_status('document', $value);
    }
    public function getDocTypeAttribute($value)
    {
        return get_document_type($value);
    }
    public function getCreatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getUpdatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
    public function practices()
    {
        return $this->hasMany(FilePractice::class);
    }
    public function countTotal()
    {
        $query = $this;
        $practices = Auth::user()->assinged_practices()->load("file")->count();
        $query = $this->where('user_id', '=', auth()->user()->id);
        return $query->count();
    }
    public function countFiltered($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        $query = $this->where('user_id', '=', auth()->user()->id);
        if (!empty($filter["practice_id"])) {
            $query = $query->where('practice_id', $filter['practice_id']);
        }
        if (!empty($filter["status"])) {
            $query = $query->where('status', $filter['status']);
        }
        if (!empty($filter["pro_speciality"])) {
            $pro_speciality = $filter["pro_speciality"];
            $query = $query->where(function ($query) use ($pro_speciality) {
                $query->where('taxonomy', $pro_speciality);
                $query->orWhere('speciality', $pro_speciality);
                $query->orWhere('taxonomy2', $pro_speciality);
            });
        }
        if (!empty($filter["pro_state"])) {
            $pro_state = $filter["pro_state"];
            $query = $query->where(function ($query) use ($pro_state) {
                $query->where('home_state', $pro_state);
                $query->orWhere('mailing_state', $pro_state);
            });
        }

        if (!empty($date_range["from_date"])) {
            $query = $query->whereBetween('created_at', [$date_range["from_date"], $date_range["to_date"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('creator', 'LIKE', "%{$search}%");
                $query->orWhere('creator_name', 'LIKE', "%{$search}%");
                $query->orWhere('practice_name', 'LIKE', "%{$search}%");
                $query->orWhere('department_name', 'LIKE', "%{$search}%");
                $query->orWhere('team_name', 'LIKE', "%{$search}%");
                $query->orWhere('subject', 'LIKE', "%{$search}%");
                $query->orWhere('priority', 'LIKE', "%{$search}%");
                $query->orWhere('status', 'LIKE', "%{$search}%");
                $query->orWhere('remarks', 'LIKE', "%{$search}%");
            });
        }
        return $query->offset($start)->limit($limit)->orderBy($order, $dir)->count();
    }
    public function getData($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        $query = $this->where('user_id', '=', auth()->user()->id);
        if (!empty($filter["practice_id"])) {
            $query = $query->where('practice_id', $filter["practice_id"]);
        }
        if (!empty($filter["status"])) {
            $query = $query->where('status', $filter["status"]);
        }
        if (!empty($filter["pro_speciality"])) {
            $pro_speciality = $filter["pro_speciality"];
            $query = $query->where(function ($query) use ($pro_speciality) {
                $query->where('taxonomy', $pro_speciality);
                $query->orWhere('speciality', $pro_speciality);
                $query->orWhere('taxonomy2', $pro_speciality);
            });
        }
        if (!empty($filter["pro_state"])) {
            $pro_state = $filter["pro_state"];
            $query = $query->where(function ($query) use ($pro_state) {
                $query->where('home_state', $pro_state);
                $query->orWhere('mailing_state', $pro_state);
            });
        }
        if (!empty($date_range["from_date"])) {
            $query = $query->whereBetween('created_at', [$date_range["from_date"], $date_range["to_date"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('creator', 'LIKE', "%{$search}%");
                $query->orWhere('creator_name', 'LIKE', "%{$search}%");
                $query->orWhere('practice_name', 'LIKE', "%{$search}%");
                $query->orWhere('department_name', 'LIKE', "%{$search}%");
                $query->orWhere('team_name', 'LIKE', "%{$search}%");
                $query->orWhere('subject', 'LIKE', "%{$search}%");
                $query->orWhere('priority', 'LIKE', "%{$search}%");
                $query->orWhere('status', 'LIKE', "%{$search}%");
                $query->orWhere('remarks', 'LIKE', "%{$search}%");
            });
        }
        return $query->offset($start)->limit($limit)->orderBy($order, $dir)->get();
    }
}
