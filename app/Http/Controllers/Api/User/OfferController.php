<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use App\Offer;
use Illuminate\Http\Request;

class OfferController extends Controller
{
    public function index(){
        $offers = Offer::select('id','name_ar','name_en')->get();
        return ApiResponse::data(['sales '=>$offers]);
    }
     public function detail(){
         $validate = ApiValidator::validate([
             'id' => 'required|exists:offers,id'
         ]);
         if ($validate) {
             return ApiResponse::errors($validate);
         }
        $offers = Offer::find(request()->id);
        return ApiResponse::data(['sales_details'=>$offers]);
    }
}
