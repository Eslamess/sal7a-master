<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    protected $guarded = ['id'];

    public static function loginRules()
    {
        return [
            'email' => 'required',
            'password' => 'required',
        ];
    }

}
