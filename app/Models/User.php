<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;

class User extends Authenticatable implements Auditable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles, AuditableTrait;

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
    public function getCreatedAtAttribute($date)
    {
        // return \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('M j, Y h:i A');
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getUpdatedAtAttribute($date)
    {
        // return Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('M j, Y h:i A');
        return date("M j, Y h:i A", strtotime($date));
    }
    public function getTimezoneAttribute($value)
    {
        return get_timezone($value);
    }
    // public function getDesignationIdAttribute($value)
    // {
    //     return get_designation($value);
    // }
    // public function getFullnameAttribute($value)
    // {
    //     return ucfirst($this->firstname) . " " . ucfirst($this->lastname);
    // }
    // public function getInitialsAttribute()
    // {
    //     $fname = explode(' ', trim($this->firstname));
    //     $lname = explode(' ', trim($this->lastname));
    //     $firstnameWord = $fname[0];
    //     $lastnameWord = $lname[0];
    //     return strtoupper($firstnameWord[0] . "" . $lastnameWord[0]);
    // }
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    public function designation()
    {
        return $this->belongsTo(Designation::class);
    }
    public function departments()
    {
        return $this->belongsToMany(Department::class, 'department_user', 'user_id', 'department_id');
    }
    public function assigned_departments()
    {
        return $this->belongsToMany(Department::class, 'department_user')->wherePivot('user_id', '=', $this->id)->get();
    }
    public function assigned_departments_array()
    {
        $Department = $this->belongsToMany(Department::class, 'department_user')->wherePivot('user_id', '=', $this->id)->pluck('departments.id');
        return json_decode(json_encode($Department), true);
    }
    // Document Types
    public function document_types()
    {
        return $this->belongsToMany(DocumentType::class, 'document_type_user', 'user_id', 'document_type_id');
    }
    public function assigned_document_types()
    {
        return $this->belongsToMany(DocumentType::class, 'document_type_user')->wherePivot('user_id', '=', $this->id)->get();
    }
    public function assigned_document_types_array()
    {
        $document_types = $this->belongsToMany(DocumentType::class, 'document_type_user')->wherePivot('user_id', '=', $this->id)->pluck('document_types.id');
        return json_decode(json_encode($document_types), true);
    }
    // Practices
    public function practices()
    {
        return $this->belongsToMany(Practice::class, 'practice_user', 'user_id', 'practice_id');
    }
    public function assigned_practices()
    {
        return $this->belongsToMany(Practice::class, 'practice_user')->wherePivot('user_id', '=', $this->id)->get();
    }
    public function assigned_practices_array()
    {
        $practices = $this->belongsToMany(Practice::class, 'practice_user')->wherePivot('user_id', '=', $this->id)->pluck('practices.id');
        return json_decode(json_encode($practices), true);
    }
    public function associated_practices($type = NULL)
    {
        return $this->belongsToMany(Practice::class, 'practice_user')->wherePivot('user_id', '=', $this->id)->wherePivot('users.type', '=', $type)->get();
    }
    public function teams()
    {
        return $this->belongsToMany(Team::class, 'team_user', 'user_id', 'team_id');
    }
    public function assigned_teams()
    {
        return $this->belongsToMany(Team::class, 'team_user')->wherePivot('user_id', '=', $this->id)->get();
    }
    public function assigned_teams_array()
    {
        $teams = $this->belongsToMany(Team::class, 'team_user')->wherePivot('user_id', '=', $this->id)->pluck('teams.id');
        return json_decode(json_encode($teams), true);
    }
    public function isOnline()
    {
        return $this->last_activity;
        // > Carbon::now()->subMinutes(config('session.lifetime'));
    }
    public function countTotal($type)
    {
        $user_ids = get_users($type)->pluck('id');
        $query = $this;
        $query = $this->whereIn('id', $user_ids);
        return $query->count();
    }
    public function countFiltered($type, $date_range, $filter, $search)
    {
        $user_ids = get_users($type)->pluck('id');
        $query = $this;
        $query = $this->whereIn('id', $user_ids);
        if (!empty($filter["company_id"])) {
            $query = $query->where('company_id', $filter['company_id']);
        }
        if (!empty($filter["department_id"])) {
            $department_id = $filter["department_id"];
            $query = $query->whereHas('departments', function ($q) use ($department_id) {
                $q->where('department_id', $department_id);
            });
        }
        if (!empty($filter["designation_id"])) {
            $query = $query->where('designation_id', $filter['designation_id']);
        }
        if (!empty($filter["status"])) {
            $query = $query->where('status', $filter['status']);
        }
        if (!empty($filter["role_id"])) {
            $role_id = $filter["role_id"];
            $query = $query->whereHas("roles", function ($q) use ($role_id) {
                $q->where("role_id", $role_id);
            });
        }
        if (!empty($date_range["date_from"])) {
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('firstname', 'LIKE', "%{$search}%");
                $query->orWhere('lastname', 'LIKE', "%{$search}%");
                $query->orWhere('psudo_name', 'LIKE', "%{$search}%");
                $query->orWhere('email', 'LIKE', "%{$search}%");
                $query->orWhere('username', 'LIKE', "%{$search}%");
            });
        }
        return $query->count();
    }
    public function getData($type, $date_range, $filter, $search, $start, $limit, $order, $dir)
    {
        $user_ids = get_users($type)->pluck('id');
        $query = $this;
        $query = $this->whereIn('id', $user_ids);
        if (!empty($filter["company_id"])) {
            $query = $query->where('company_id', $filter['company_id']);
        }
        if (!empty($filter["department_id"])) {
            $department_id = $filter["department_id"];
            $query = $query->whereHas('departments', function ($q) use ($department_id) {
                $q->where('department_id', $department_id);
            });
        }
        if (!empty($filter["designation_id"])) {
            $query = $query->where('designation_id', $filter['designation_id']);
        }
        if (!empty($filter["status"])) {
            $query = $query->where('status', $filter['status']);
        }
        if (!empty($filter["role_id"])) {
            $role_id = $filter["role_id"];
            $query = $query->whereHas("roles", function ($q) use ($role_id) {
                $q->where("role_id", $role_id);
            });
        }
        if (!empty($date_range["date_from"])) {
            $query = $query->whereBetween('created_at', [$date_range["date_from"], $date_range["date_to"]]);
        }
        if (!empty($search)) {
            $query = $query->where(function ($query) use ($search) {
                $query->where('firstname', 'LIKE', "%{$search}%");
                $query->orWhere('lastname', 'LIKE', "%{$search}%");
                $query->orWhere('psudo_name', 'LIKE', "%{$search}%");
                $query->orWhere('email', 'LIKE', "%{$search}%");
                $query->orWhere('username', 'LIKE', "%{$search}%");
            });
        }
        return $query->offset($start)->limit($limit)->orderBy($order, $dir)->get();
    }
}
