<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;

class Status extends Model implements Auditable
{
    use HasFactory, AuditableTrait;
    protected $table = "statuses";
    protected $fillable = [
        'company_id',
        'name',
        'type'
    ];
    public function files()
    {
        return $this->hasMany(File::class, "status");
    }
    public function tickets()
    {
        return $this->hasMany(Ticket::class, "status");
    }
    public function users()
    {
        return $this->hasMany(User::class, "status");
    }
}
