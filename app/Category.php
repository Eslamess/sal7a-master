<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    public $timestamps = false;
    protected $guarded = [];

    public function agent()
    {
        return $this->hasMany(Agent::class);
    }

    public function order()
    {
        return $this->hasMany(Order::Class);
    }
}
