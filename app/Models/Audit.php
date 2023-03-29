<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Audit extends Model
{
    use HasFactory;
    public function getUserIdAttribute($value)
    {
        $user = User::findorfail($value);
        return $user->firstname . ' ' . $user->lastname;
    }
    public function getCreatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getUpdatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
    public function countTotal()
    {
        $query = $this;
        $query = $this->where('user_id', '!=', 0);
        return $query->count();
    }
    public function countFiltered($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        $query = $this->where('user_id', '!=', 0);
        if (!empty($filter["user_id"]))
            $query = $query->where('user_id', $filter['user_id']);
        if (!empty($filter["event"]))
            $query = $query->where('event', $filter['event']);
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
        $query = $this->where('user_id', '!=', 0);
        if (!empty($filter["user_id"]))
            $query = $query->where('user_id', $filter['user_id']);
        if (!empty($filter["event"]))
            $query = $query->where('event', $filter['event']);
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
