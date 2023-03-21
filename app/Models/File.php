<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class File extends Model
{
    use HasFactory;
    public function getStatusAttribute($value)
    {
        return get_status('document', $value);
    }
    public function getDocTypeAttribute($value)
    {
        return get_document_type($value);
    }
    public function getCreatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getUpdatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
    public function practices()
    {
        return $this->hasMany(FilePractice::class);
    }
}
