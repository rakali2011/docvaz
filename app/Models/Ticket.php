<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ticket extends Model
{
    use HasFactory, SoftDeletes;
    public function getCreatedAtAttribute($date)
    {
        // return \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('M j, Y h:i A');
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getUpdatedAtAttribute($date)
    {
        // return Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('M j, Y h:i A');
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getStatusAttribute($value)
    {
        return get_status($value);
    }
    public function attachments()
    {
        return $this->hasMany(TicketAttachment::class);
    }
    public function replies()
    {
        return $this->hasMany(TicketReply::class);
    }
    public function ccs()
    {
        return $this->hasMany(TicketCC::class);
    }
    protected $fillable = [
        'company_id',
        'user_id',
        'user_type',
        'creator_name',
        'department_id',
        'department_name',
        'practice_id',
        'practice_name',
        'team_id',
        'team_name',
        'type',
        'priority',
        'subject',
        'message',
        'creator',
    ];
    public function countTotalTickets()
    {
        $query = $this;
        $query = $this->where('user_id', '=', auth()->user()->id);
        return $query->count();
    }
    public function countFilteredTickets($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        $query = $this->where('user_id', '=', auth()->user()->id);
        if (!empty($filter["team_id"]))
            $query = $query->where('team_id', $filter['team_id']);
        if (!empty($filter["practice_id"]))
            $query = $query->where('practice_id', $filter['practice_id']);
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

    public function allTickets($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        $query = $this->where('user_id', '=', auth()->user()->id);
        if (!empty($filter["team_id"]))
            $query = $query->where('team_id', $filter['team_id']);
        if (!empty($filter["practice_id"]))
            $query = $query->where('practice_id', $filter['practice_id']);
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
