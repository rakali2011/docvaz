<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Practice extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function file()
    {
        return $this->hasMany(File::class);
    }
    public function users()
    {
        return $this->belongsToMany(User::class, 'practice_user', 'practice_id', 'user_id');
    }
    public function assinged_users()
    {
        return $this->belongsToMany(User::class, 'practice_user')->wherePivot('practice_id', '=', $this->id)->get();
    }
    public function assinged_users_array()
    {
        $User = $this->belongsToMany(User::class, 'practice_user')->wherePivot('practice_id', '=', $this->id)->pluck('users.id');
        return json_decode(json_encode($User), true);
    }
    public function associated_user($type = NULL)
    {
        return $this->belongsToMany(User::class, 'practice_user')->wherePivot('practice_id', '=', $this->id)->wherePivot('users.type', '=', $type)->get();
    }
}
