<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Agent extends Model
{

    protected $guarded = [];

    protected $hidden = [
        'password', 'remember_token',
    ];

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
    public function admin()
    {
        return $this->belongsTo(Admin::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
    public function order()
    {
        return $this->hasMany(Order::class);
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

    public static function updateRules($id)
    {
        return [
            'name' => 'required|min:3|max:15',
            'email' => 'required|email|unique:agents,email,' . $id,
            'phone' => 'required|min:10|unique:agents,phone,' . $id,
            'city_id' => 'required|exists:cities,id',
            'category_id' => 'required|exists:categories,id',
            'birthday' => 'required|date|before:today',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
        ];
    }

    public static function registerRules()
    {
        return [
            'name' => 'required|min:3|max:15',
            'phone' => 'required|min:10|unique:agents',
            'city_id' => 'required|exists:cities,id',
            'category_id' => 'required|exists:categories,id',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'birthday' => 'required|date',
            'image' => 'required|image',
            'national_id' => 'required',
            'national_id.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'documents_images' => 'required',
            'documents_images.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'national_id2' => 'required',
            'code' => 'required|min:6|exists:email_code,code'
        ];
    }

    public static function registerRulesWeb()
    {
        return [
            'name' => 'required|min:3|max:15',
            'phone' => 'required|min:10|unique:agents',
            'city_id' => 'required|exists:cities,id',
            'category_id' => 'required|exists:categories,id',

            'birthday' => 'required|date',
            'image' => 'required|image',
            'national_id' => 'required',
            'national_id.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'documents_images' => 'required',
            'documents_images.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'national_id2' => 'required',
        ];
    }
    public static function registerRulesWebUpdate()
    {
        return [
            'name' => 'required|min:3|max:15',
            'phone' => 'required|min:10',
            'city_id' => 'required|exists:cities,id',
            'category_id' => 'required|exists:categories,id',
            'birthday' => 'required|date',
        ];
    }
}
