<?php

namespace App\Http\Controllers\Dashboard;

use App\Admin;
use App\Agent;
use App\AppRate;
use App\Http\Controllers\Controller;
use App\Order;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        if(Auth::guard('admin')->user()->supervisor != 1) {
            $orders=Order::count();
            $agents=Agent::count();
            $waitingAgents=Agent::where('status','new')->get();
            $contractors=Admin::where('supervisor',0)->count();
            $users=User::count();
            $ordersCompleted=Order::
            select(DB::raw('SUM(cost) as totalCost,COUNT(*) as totalCount'))->
            where('status','completed')->first();
            $topAgents=Agent::orderBy('rate','desc')->take(5)->get();
            $rate=AppRate::select(DB::raw('AVG(rate) as appRate'))->first();
            return view('admin.index',compact('rate','topAgents','waitingAgents','orders','agents','contractors','users','ordersCompleted'));
        }
        else{
            $orders=Order::join('agents', 'agents.id', '=', 'orders.agent_id')->select('orders.*')->where('agents.admin_id',Auth::guard('admin')->user()->id)
                ->count();
            $agents=Agent::select(DB::raw('count(id) as user_count,avg(rate) as user_rate'))->where('admin_id',Auth::guard('admin')->user()->id)->first();

            return view('admin.contractor.home',compact('orders','agents'));
        }
    }
}
