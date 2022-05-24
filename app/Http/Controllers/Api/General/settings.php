<?php

namespace App\Http\Controllers\Api\General;

use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Setting;
use Illuminate\Http\Request;

class settings extends Controller
{
    //
    public  function getAppSettings(){

        $data=Setting::all();
        if($data){
            return ApiResponse::data(['settings'=>$data]);
        }else{
            return ApiResponse::errors('some thing went wrong');
        }
    }
}
