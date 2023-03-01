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
        return get_ticket_status($value);
    }
    public function attachments()
    {
        return $this->hasMany(TicketAttachment::class);
    }
    public function replies()
    {
        return $this->hasMany(TicketReply::class);
    }
    protected $fillable = [
        'company_id',
        'user_id',
        'creator_name',
        'from',
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

    public function allTickets($date_range, $filter, $search, $start, $limit, $order, $dir)
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
