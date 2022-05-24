<?php

namespace App\Http\Controllers\Api\Admin;

use App\City;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use Illuminate\Http\Request;

class CityController extends Controller
{
    public function create(Request $request){

        $validate = ApiValidator::validate([
            'name' => 'required',
            'name_en' => 'required',
            'parent_id' => 'nullable|exists:cities,id'
        ]);

        if($validate){
            return ApiResponse::errors($validate);
        }

        $inputs = $request->all('name', 'name_en', 'parent_id');
        $city = City::create($inputs);
        return ApiResponse::data(['city' => $city]);
    }
}
