<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;
use Illuminate\Support\Facades\Auth;

class Practice extends Model implements Auditable
{
    use HasFactory, AuditableTrait;
    protected $guarded = ['id'];
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function file()
    {
        return $this->hasMany(File::class);
    }
    public function users()
    {
        return $this->belongsToMany(User::class, 'practice_user', 'practice_id', 'user_id');
    }
    public function assigned_users()
    {
        return $this->belongsToMany(User::class, 'practice_user')->wherePivot('practice_id', '=', $this->id)->get();
    }
    public function assigned_users_array()
    {
        $User = $this->belongsToMany(User::class, 'practice_user')->wherePivot('practice_id', '=', $this->id)->pluck('users.id');
        return json_decode(json_encode($User), true);
    }
    public function associated_user($type = NULL)
    {
        return $this->belongsToMany(User::class, 'practice_user')->wherePivot('practice_id', '=', $this->id)->wherePivot('users.type', '=', $type)->get();
    }
    public function countTotal()
    {
        $query = $this;
        if (auth()->user()->can('assign practice user'))
            $query = $this->where('company_id', Auth::user()->company_id);
        else {
            $practice_ids = get_assigned_practices();
            $query = $this->whereIn('id', $practice_ids);
        }
        return $query->count();
    }
    public function countFiltered($date_range, $filter, $search)
    {
        $query = $this;
        if (auth()->user()->can('assign practice user'))
            $query = $this->where('company_id', Auth::user()->company_id);
        else {
            $practice_ids = get_assigned_practices();
            $query = $this->whereIn('id', $practice_ids);
        }
        if (!empty($filter["status"])) {
            $query = $query->where('status', $filter['status']);
        }
        if (!empty($date_range["date_from"])) {
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('name', 'LIKE', "%{$search}%");
            });
        }
        return $query->count();
    }
    public function getData($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        if (auth()->user()->can('assign practice user'))
            $query = $this->where('company_id', Auth::user()->company_id);
        else {
            $practice_ids = get_assigned_practices();
            $query = $this->whereIn('id', $practice_ids);
        }
        if (!empty($filter["status"])) {
            $query = $query->where('status', $filter['status']);
        }
        if (!empty($date_range["date_from"])) {
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('name', 'LIKE', "%{$search}%");
            });
        }
        return $query->offset($start)->limit($limit)->orderBy($order, $dir)->get();
    }
}
