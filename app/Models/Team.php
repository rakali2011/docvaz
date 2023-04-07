<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;

class Team extends Model implements Auditable
{
    use HasFactory, AuditableTrait;
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function departments()
    {
        return $this->belongsToMany(Department::class, 'team_departments')->wherePivot('team_id', '=', $this->id)->get();
    }
    public function users()
    {
        return $this->belongsToMany(User::class, 'team_user', 'team_id', 'user_id');
    }
    public function assigned_users()
    {
        return $this->belongsToMany(User::class, 'team_user')->wherePivot('team_id', '=', $this->id)->get();
    }
    public function assigned_users_array()
    {
        $teams = $this->belongsToMany(User::class, 'team_user')->wherePivot('team_id', '=', $this->id)->pluck('users.id');
        return json_decode(json_encode($teams), true);
    }
}
