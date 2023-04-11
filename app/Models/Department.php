<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;

class Department extends Model implements Auditable
{
    use HasFactory, AuditableTrait;
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function teams()
    {
        return $this->belongsToMany(Team::class, 'team_departments')->wherePivot('department_id', '=', $this->id)->get();
    }
    public function users()
    {
        return $this->belongsToMany(User::class, 'department_user', 'department_id', 'user_id');
    }
    public function assigned_users()
    {
        return $this->belongsToMany(User::class, 'department_user')->wherePivot('department_id', '=', $this->id)->get();
    }
    public function assigned_users_array()
    {
        $User = $this->belongsToMany(User::class, 'department_user')->wherePivot('department_id', '=', $this->id)->pluck('departments.id');
        return json_decode(json_encode($User), true);
    }
    public function tickets()
    {
        return $this->hasMany(Ticket::class, "department_id");
    }
}
