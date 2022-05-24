<?php

namespace App\Http\Controllers\Api\General;

use App\City;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use Illuminate\Http\Request;

class CityController extends Controller
{
    public function index()
    {
        $cities = City::with('areas')->where('parent_id', null)->get();
        return ApiResponse::data(['cities' => $cities]);
    }

    public function show(Request $request)
    {
        $validate = ApiValidator::validate([
            'city_id' => 'required|exists:cities,id'
        ]);

        if($validate)
            return ApiResponse::errors($validate);

        $city = City::with('areas')->find($request->input('city_id'));
        return ApiResponse::data(['city' => $city]);
    }
}
