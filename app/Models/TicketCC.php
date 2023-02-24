<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketCC extends Model
{
    use HasFactory;
    protected $table = "ticket_ccs";
    protected $fillable = [
        'ticket_id',
        'department_id'
    ];
}
