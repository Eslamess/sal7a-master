<?php

namespace App\Libraries;

use Illuminate\Support\Facades\Validator;

class ApiValidator
{
    public static function validate($rules, $messages = null)
    {
        if ($messages)
            $validate = Validator::make(request()->all(), $rules, $messages);
        else
            $validate = Validator::make(request()->all(), $rules);

        if ($validate->fails()) {
            return $validate->messages();
        }
    }

    public  static function ConvertArrayImageToString($ImagesString){
        $ImageArray=implode(',',$ImagesString);
        return $ImageArray;
    }

    public  static function ConvertStringImageToArray($ImagesString){
        $ImageArray=explode(',',$ImagesString);
        return $ImageArray;
    }


    public static function origenalValidate($rules){
        if(empty(request()->header('token')))
        {
            return ApiResponse::emptyToken();
        }
        else
        {
            $token=JwtLibrary::decode(request()->header('token'));
            if ($token==false)
                return ApiResponse::emptyToken();
        }

        $validate = Validator::make(request()->all(), $rules);
        if ($validate->fails()) {
            return $validate->messages();
        }
    }
}
