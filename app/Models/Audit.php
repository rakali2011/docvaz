<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Audit extends Model
{
    use HasFactory;
    public function countTotal()
    {
        $query = $this;
        $query = $this->where('user_id', '=', auth()->user()->id);
        return $query->count();
    }
    public function countFiltered($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        $query = $this->where('user_id', '=', auth()->user()->id);
        if (!empty($filter["team_id"]))
            $query = $query->where('team_id', $filter['team_id']);
        if (!empty($filter["target_id"]))
            $query = $query->where('target_id', $filter['target_id']);
        if (!empty($filter["department_id"]))
            $query = $query->where('department_id', $filter['department_id']);
        if (!empty($filter["status"]))
            $query = $query->where('status', $filter['status']);
        if (!empty($filter["priority"]))
            $query = $query->where('priority', $filter['priority']);
        if (!empty($filter["creator"]))
            $query = $query->where('creator', $filter['creator']);
        if (!empty($filter["flag"]))
            $query = $query->where('flag', $filter['flag']);
        if (!empty($date_range["date_from"]))
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('user_id', 'LIKE', "%{$search}%");
                $query->orWhere('event', 'LIKE', "%{$search}%");
                $query->orWhere('auditable_type', 'LIKE', "%{$search}%");
                $query->orWhere('auditable_id', 'LIKE', "%{$search}%");
                $query->orWhere('old_values', 'LIKE', "%{$search}%");
                $query->orWhere('new_values', 'LIKE', "%{$search}%");
                $query->orWhere('ip_address', 'LIKE', "%{$search}%");
                $query->orWhere('user_agent', 'LIKE', "%{$search}%");
                $query->orWhere('created_at', 'LIKE', "%{$search}%");
                $query->orWhere('updated_at', 'LIKE', "%{$search}%");
            });
        }
        return $query->offset($start)->limit($limit)->orderBy($order, $dir)->count();
    }
    public function getData($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        $query = $this->where('user_id', '=', auth()->user()->id);
        if (!empty($filter["team_id"]))
            $query = $query->where('team_id', $filter['team_id']);
        if (!empty($filter["target_id"]))
            $query = $query->where('target_id', $filter['target_id']);
        if (!empty($filter["department_id"]))
            $query = $query->where('department_id', $filter['department_id']);
        if (!empty($filter["status"]))
            $query = $query->where('status', $filter['status']);
        if (!empty($filter["priority"]))
            $query = $query->where('priority', $filter['priority']);
        if (!empty($filter["creator"]))
            $query = $query->where('creator', $filter['creator']);
        if (!empty($filter["flag"]))
            $query = $query->where('flag', $filter['flag']);
        if (!empty($date_range["date_from"]))
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('user_id', 'LIKE', "%{$search}%");
                $query->orWhere('event', 'LIKE', "%{$search}%");
                $query->orWhere('auditable_type', 'LIKE', "%{$search}%");
                $query->orWhere('auditable_id', 'LIKE', "%{$search}%");
                $query->orWhere('old_values', 'LIKE', "%{$search}%");
                $query->orWhere('new_values', 'LIKE', "%{$search}%");
                $query->orWhere('ip_address', 'LIKE', "%{$search}%");
                $query->orWhere('user_agent', 'LIKE', "%{$search}%");
                $query->orWhere('created_at', 'LIKE', "%{$search}%");
                $query->orWhere('updated_at', 'LIKE', "%{$search}%");
            });
        }
        return $query->offset($start)->limit($limit)->orderBy($order, $dir)->get();
    }
}
