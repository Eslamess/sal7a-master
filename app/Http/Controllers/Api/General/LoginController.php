<?php

namespace App\Http\Controllers\Api\General;

use App\Agent;
use App\User;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use App\Libraries\JwtLibrary;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $login_as = $request->input('login_as');

        if ($login_as != 'user' && $login_as != 'agent')
            return ApiResponse::errors(['account' => 'You must provide account type.']);
        else
            if ($login_as == 'user')
                $model = new User();
            else
                $model = new Agent();

        $validate = ApiValidator::validate($model::loginValidate(), ['username.required' => 'Phone or Email is Required.']);

        if ($validate) {
            return ApiResponse::errors($validate);
        }

        $username = $request->input('username');
        $password = $request->input('password');
        $device_token = null;

        $user = $model::with('area', 'area.city')->where('email', $username)->orWhere('phone', $username)->first();

        if ($user) {
            if (Hash::check($password, $user->password)) {
                if ($user->status == 'active') {

                    $user->update(['device_token' => $device_token]);

                    $token = JwtLibrary::encode($user->id, $login_as);
                    $user['token'] = $token;
                    $user['role'] = $login_as;
                    return ApiResponse::data(['user' => $user]);
                } else {
                    return ApiResponse::bannedMessage();
                }
            } else {
                return ApiResponse::errors(['account' => ["يوجد خطأ في البيانات"]]);
            }
        } else {
            return ApiResponse::errors(['account' => ["يوجد خطا فى البيانات"]]);
        }
    }
}
