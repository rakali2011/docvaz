<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    use HasFactory;
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function departments()
    {
        return $this->belongsToMany(Department::class, 'team_departments')
            ->wherePivot('team_id', '=', $this->id)
            ->get();

    }


}
