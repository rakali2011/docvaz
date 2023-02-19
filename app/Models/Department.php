<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Department extends Model
{
    use HasFactory;
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function teams()
    {
        return $this->belongsToMany(Team::class, 'team_departments')
            ->wherePivot('department_id', '=', $this->id)
            ->get();

    }

}
