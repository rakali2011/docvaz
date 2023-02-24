<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;

    protected $fillable = [
        'company_id',
        'user_id',
        'creator_name',
        'from',
        'department_name',
        'to_provider',
        'practice_name',
        'team',
        'type',
        'priority',
        'subject',
        'message',
        'creator',
    ];
}
