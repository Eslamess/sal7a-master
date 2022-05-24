<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use App\Libraries\JwtLibrary;
use App\Agent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validate = ApiValidator::validate(Agent::registerValidate());
        if ($validate) {
            return ApiResponse::errors($validate);
        }

        $inputs = $request->all('name', 'email', 'phone', 'city_id', 'birthday', 'category_id', 'longitude', 'latitude');
        $password = $request->input('password');
        $inputs['password'] = Hash::make($password);

        $user = Agent::create($inputs);

        return ApiResponse::data(['user' => $user]);
    }
}
