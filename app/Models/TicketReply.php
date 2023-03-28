<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;

class TicketReply extends Model implements Auditable
{
    use HasFactory, AuditableTrait;
    protected $table = "ticket_replies";
    public function getCreatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getUpdatedAtAttribute($date)
    {
        return date("M j, Y h:i A", strtotime($date));
    }
}
