<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class Role extends Model implements Auditable
{
    use HasFactory, AuditableTrait;

    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function countTotal()
    {
        $query = $this;
        if (auth()->user()->hasRole('dev'))
            $query = $this->where('company_id', '!=', 0);
        else
            $query = $this->where('company_id', Auth::user()->company_id);
        return $query->count();
    }
    public function countFiltered($date_range, $filter, $search)
    {
        $query = $this;
        if (auth()->user()->hasRole('dev'))
            $query = $this->where('company_id', '!=', 0);
        else
            $query = $this->where('company_id', Auth::user()->company_id);
        if (!empty($filter["company_id"])) {
            $query = $query->where('company_id', $filter['company_id']);
        }
        if (!empty($date_range["date_from"])) {
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('display_name', 'LIKE', "%{$search}%");
            });
        }
        return $query->count();
    }
    public function getData($date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $query = $this;
        if (auth()->user()->hasRole('dev'))
            $query = $this->where('company_id', '!=', 0);
        else
            $query = $this->where('company_id', Auth::user()->company_id);
        if (!empty($filter["company_id"])) {
            $query = $query->where('company_id', $filter['company_id']);
        }
        if (!empty($date_range["date_from"])) {
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('display_name', 'LIKE', "%{$search}%");
            });
        }
        return $query->offset($start)->limit($limit)->orderBy($order, $dir)->get();
    }
}
