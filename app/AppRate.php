<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AppRate extends Model
{
    //
    protected $guarded=['id'];
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    //rules
    public static function checkRate()
    {

        return [
            'rate'      =>'required|numeric',
            'comment'   =>'nullable',
        ];
    }
}
