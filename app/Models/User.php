<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Carbon\Carbon;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'firstname',
        'lastname',
        'email',
        'password',


    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function getFullnameAttribute($value)
    {
        return ucfirst($this->firstname) . " " . ucfirst($this->lastname);
    }

    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function getInitialsAttribute()
    {
        $fname = explode(' ', trim($this->firstname));
        $lname = explode(' ', trim($this->lastname));
        $firstnameWord = $fname[0];
        $lastnameWord = $lname[0];
        return strtoupper($firstnameWord[0] . "" . $lastnameWord[0]);
    }
    public function departments()
    {
        return $this->belongsToMany(Department::class, 'user_departments')->wherePivot('user_id', '=', $this->id)->get();
    }
    public function teams()
    {
        return $this->belongsToMany(Team::class, 'user_teams')->wherePivot('user_id', '=', $this->id)->get();
    }

    public function assinged_practices()
    {
        return $this->belongsToMany(Practice::class, 'user_practices')->wherePivot('user_id', '=', $this->id)->get();
    }
    public function files()
    {

        // return $this->hasManyThrough(File::class, UserPractice::class, "practice_id", "practice_id")->get();

        $practices = $this->assinged_practices_array();
        $files = new Collection();
        foreach ($practices as $key => $value) {
            $pro = $value->files->get();
            foreach ($pro as $key1 => $value1) {
                $files->push($value1);
            }
        }
        dd($files);
    }
    public function assinged_practices_array()
    {
        $practices = $this->belongsToMany(Practice::class, 'user_practices')->wherePivot('user_id', '=', $this->id)->pluck('practices.id');
        return json_decode(json_encode($practices), true);
    }

    public function assinged_departments()
    {
        return $this->belongsToMany(Department::class, 'user_departments')->wherePivot('user_id', '=', $this->id)->get();
    }
    public function assinged_departments_array()
    {
        $Department = $this->belongsToMany(Department::class, 'user_departments')->wherePivot('user_id', '=', $this->id)->pluck('departments.id');
        return json_decode(json_encode($Department), true);
    }

    public function isOnline()
    {
        return $this->last_activity;
        // > Carbon::now()->subMinutes(config('session.lifetime'));
    }
}
