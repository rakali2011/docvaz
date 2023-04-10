<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;

class Designation extends Model implements Auditable
{
    use HasFactory, SoftDeletes, AuditableTrait;
    protected $fillable = [
        'company_id',
        'name'
    ];
    public function users()
    {
        return $this->hasMany(User::class, "designation_id");
    }
}
