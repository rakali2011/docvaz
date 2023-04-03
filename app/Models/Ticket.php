<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;

class Ticket extends Model implements Auditable
{
    use HasFactory, SoftDeletes, AuditableTrait;
    public function getCreatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getResponseAtAttribute($date)
    {
        if (empty($date))
            return "";
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getUpdatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getStatusAttribute($value)
    {
        return get_status($value);
    }
    public function getUserIdAttribute($value)
    {
        $user = User::findorfail($value);
        return $user->firstname . ' ' . $user->lastname;
    }
    // public function getPracticeIdAttribute($value)
    // {
    //     $practice = Practice::findorfail($value);
    //     return isset($practice->name) ? $practice->name : "";
    // }
    public function getDepartmentIdAttribute($value)
    {
        $department = Department::findorfail($value);
        return isset($department->name) ? $department->name : "";
    }
    public function getTeamIdAttribute($value)
    {
        if (!$value)
            return "";
        $team = Team::findorfail($value);
        return isset($team->name) ? $team->name : "";
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
        'department_id',
        'target_id',
        'team_id',
        'type',
        'priority',
        'subject',
        'message',
        'creator',
        'is_external',
    ];
    public function countTotalTickets()
    {
        $query = $this;
        $query = $this->where('user_id', '=', auth()->user()->id);
        return $query->count();
    }
    public function countFilteredTickets($date_range, $filter, $search)
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
        return $query->count();
    }

    public function allTickets($date_range, $filter, $search, $start, $limit, $order, $dir)
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
