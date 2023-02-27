<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;
    public function attachments()
    {
        return $this->hasMany(TicketAttachment::class);
    }
    protected $fillable = [
        'company_id',
        'user_id',
        'creator_name',
        'from',
        'department_name',
        'practice_id',
        'practice_name',
        'team_id',
        'team_name',
        'type',
        'priority',
        'subject',
        'message',
        'creator',
    ];
}
