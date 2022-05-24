<?php

namespace App\Libraries;

use \Firebase\JWT\JWT;

class JwtLibrary
{

    static $key = "j*ZF=GR5A_fLWkd=#f8v6+q32g8qsU!w";

    public static function encode($user_id, $user_type)
    {
        $inputs = [
            'user_id' => $user_id,
            'user_type' => $user_type
        ];
        $jwt = JWT::encode($inputs, self::$key);
        return $jwt;
    }

    public static function decode($jwt)
    {
        $decoded = JWT::decode($jwt, self::$key, array('HS256'));
        return $decoded;
    }

    public static function getToken()
    {
        if (!empty(request()->header('token'))) {
            $token = request()->header('token');
        } elseif (!empty(request()->input('token'))) {
            $token = request()->input('token');
        } else {
            $token = "";
        }
        return $token;
    }

}
