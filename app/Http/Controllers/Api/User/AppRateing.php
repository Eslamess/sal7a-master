<?php

namespace App\Http\Controllers\Api\User;

use App\AppRate;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use Illuminate\Http\Request;

class AppRateing extends Controller
{
    //
    public function index()
    {
        $validation=ApiValidator::validate(AppRate::checkRate());
        if($validation){
           return ApiResponse::errors($validation);
        }
        $data=request()->only('rate','comment');
        $data['user_id']=$this->user_id;
        $insertRate = AppRate::create($data);
        if($insertRate){
            return ApiResponse::success('grate work');
        }else{
            return ApiResponse::errors('some thing went wrong');
        }

    }
    public function getRate()
    {
        $getRate = AppRate::where('user_id',$this->user_id)->first();
        return ApiResponse::data(['rate'=>$getRate]);
    }
    public function updateRate()
    {
        $validation=ApiValidator::validate(AppRate::checkRate());
        if($validation){
            return ApiResponse::errors($validation);
        }
        $data=request()->only('rate','comment');
        $data['user_id']=$this->user_id;
        $data=request()->only('rate','comment');

        $updateRate = AppRate::where('user_id', $this->user_id)
        ->update($data);
        if($updateRate){
            return ApiResponse::success('grate work');
        }else{
            return ApiResponse::errors('some thing went wrong');
        }
    }
}
