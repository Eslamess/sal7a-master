<?php

namespace App;

use App\Libraries\ApiResponse;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'phone', 'city_id', 'address', 'latitude', 'longitude', 'password', 'status', 'device_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public static function registerRules()
    {
        return [
            'name' => 'required|min:3|max:15',
            'phone' => 'required|unique:users,phone|min:11',
            'password' => 'required|confirmed|min:8',
            'city_id' => 'required|exists:cities,id',
            'address' => 'required',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'code' => 'required|min:6|exists:email_code,code'
        ];
    }

    public static function updateRules($id)
    {
        return [
            'name' => 'required|min:3|max:15',
            'email' => 'required|email|unique:users,email,' . $id,
            'phone' => 'required|min:10|unique:users,phone,' . $id,
            'city_id' => 'required|exists:cities,id',
            'address' => 'required',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
        ];
    }

    public static function loginValidate()
    {
        return [
            'username' => 'required',
            'password' => 'required',

        ];
    }

    public function area()
    {
        return $this->belongsTo(City::class, 'city_id', 'id');
    }

    public function getStatus()
    {
        $status = '';
        switch ($this->status) {
            case 'new':
                $status = 'غير مفعلة';
                break;
            case 'active':
                $status = 'مفعلة';
                break;
            case 'banned':
                $status = 'موقوفة';
                break;
        }
        return $status;
    }
    public function app_rate()
    {
        return $this->hasOne('App\app_rate');
    }
    public function order()
    {
        return $this->hasMany(Order::class);
    }
}
