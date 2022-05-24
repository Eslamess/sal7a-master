<?php

namespace App\Http\Controllers\Dashboard;

use App\AppRate;
use App\Http\Controllers\Controller;
use App\Order;
use Illuminate\Http\Request;

class RateingController extends Controller
{

    public function appRatings(){
        $appRate=AppRate::all();
        return view('admin.appRate.appRate')->with('data', $appRate);
    }
    public function index(){
        $appRate=Order::all();
        return view('admin.appRate.index')->with('data', $appRate);
    }
}
