<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;

class DocumentType extends Model implements Auditable
{
    use HasFactory, AuditableTrait;
    protected $fillable = [
        'company_id',
        'name',
        'type'
    ];
    public function files()
    {
        return $this->hasMany(File::class, "doc_type");
    }
}
