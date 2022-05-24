<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    public $timestamps = false;
    protected $guarded = [];

    public function areas()
    {
        return $this->hasMany(City::class, 'parent_id', 'id');
    }

    public function city()
    {
        return $this->belongsTo(City::class, 'parent_id', 'id');
    }
}
