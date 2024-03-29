<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;

class File extends Model implements Auditable
{
    use HasFactory, SoftDeletes, AuditableTrait;
    public function getStatusAttribute($value)
    {
        return get_status($value);
    }
    public function getDocTypeAttribute($value)
    {
        return get_document_type($value);
    }
    public function getDateAttribute($date)
    {
        return date("M j, Y", strtotime($date));
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
        $query = $query->whereIn('practice_id', get_assigned_practices());
        return $query->count();
    }
    public function countFiltered($date_range, $filter, $search)
    {
        $query = $this;
        // if (empty($filter["team"])) {
        //     $team_user_ids = get_assigned_teams_user_ids();
        //     $query = $this->whereIn('user_id', $team_user_ids);
        // } else {
        //     $team_user_ids = get_assigned_teams_user_ids($filter["team"]);
        //     $query = $query->whereIn('user_id', $team_user_ids);
        // }
        if (!empty($filter["practice_id"])) {
            $query = $query->where('practice_id', $filter['practice_id']);
        } else {
            $query = $query->whereIn('practice_id', get_assigned_practices());
        }
        if (!empty($filter["status"])) {
            $query = $query->where('status', $filter['status']);
        }
        if (!empty($filter["doc_type"])) {
            $query = $query->where('doc_type', $filter['doc_type']);
        }
        if (!empty($date_range["date_from"])) {
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('name', 'LIKE', "%{$search}%");
                $query->orWhere('org_name', 'LIKE', "%{$search}%");
                $query->orWhere('ext', 'LIKE', "%{$search}%");
                $query->orWhere('path', 'LIKE', "%{$search}%");
                $query->orWhere('date', 'LIKE', "%{$search}%");
            });
        }
        return $query->count();
    }
    public function getData($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        // if (empty($filter["team"])) {
        //     $team_user_ids = get_assigned_teams_user_ids();
        //     $query = $this->whereIn('user_id', $team_user_ids);
        // } else {
        //     $team_user_ids = get_assigned_teams_user_ids($filter["team"]);
        //     $query = $query->whereIn('user_id', $team_user_ids);
        // }
        if (!empty($filter["practice_id"])) {
            $query = $query->where('practice_id', $filter['practice_id']);
        } else {
            $query = $query->whereIn('practice_id', get_assigned_practices());
        }
        if (!empty($filter["status"])) {
            $query = $query->where('status', $filter['status']);
        }
        if (!empty($filter["doc_type"])) {
            $query = $query->where('doc_type', $filter['doc_type']);
        }
        if (!empty($date_range["date_from"])) {
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('name', 'LIKE', "%{$search}%");
                $query->orWhere('org_name', 'LIKE', "%{$search}%");
                $query->orWhere('ext', 'LIKE', "%{$search}%");
                $query->orWhere('path', 'LIKE', "%{$search}%");
                $query->orWhere('date', 'LIKE', "%{$search}%");
            });
        }
        return $query->offset($start)->limit($limit)->orderBy($order, $dir)->get();
    }
}
