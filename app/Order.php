<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;

class Order extends Model
{

    protected $guarded = [];

    public static function createRules()
    {
        return [
            'user_id' => 'required|exists:users,id',
            'city_id' => 'required|exists:cities,id',
            'category_id' => 'required|exists:categories,id',
            'address' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
            'date' => 'date|after:today|required',
            'time' => 'required',
            'description' => 'required|min:15'
        ];
    }

    public function city()
    {
        return $this->belongsTo(City::Class);
    }

    public function category()
    {
        return $this->belongsTo(Category::Class);
    }

    public function user()
    {
        return $this->belongsTo(User::Class);
    }

    public function agent()
    {
        return $this->belongsTo(Agent::Class);
    }

    public function agentWeb()
    {
        return $this->agent()->select('id','admin_id');
    }

    public function offer()
    {
        return $this->belongsTo(Offer::Class);
    }

    public function getStatus()
    {
        $s = '';
        switch ($this->status) {
            case '';
                $s = '';
                break;
        }

        return $s;
    }

    public function getImages(){
        return DB::table('order_images')->where('order_id', $this->id)->get();
    }
}
