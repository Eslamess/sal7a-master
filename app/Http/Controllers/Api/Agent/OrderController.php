<?php

namespace App\Http\Controllers\Api\Agent;

use App\Agent;
use App\Category;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use App\Libraries\JwtLibrary;
use App\Offer;
use App\Order;
use App\User;
use Facade\FlareClient\Api;
use Firebase\JWT\JWT;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{

    public function index()
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {
            $validate = ApiValidator::validate([
                'status' => "required",
                'status.*' => 'in:new,cancelled,on_way,arrived,approved,rejected,completed,rated'
            ]);

            if ($validate)
                return ApiResponse::errors($validate);

            $orders = Order::with('city', 'category', 'user')
                ->where('agent_id', $this->user_id)
                ->whereIn('status', request()->input('status'))
                ->get();

            return ApiResponse::data(['orders' => $orders]);
        }
        return ApiResponse::errors(['account' => 'Token is invalid']);
    }

    public function show(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {
            $validate = ApiValidator::validate([
                'order_id' => "required|exists:orders,id"
            ]);

            if ($validate)
                return ApiResponse::errors($validate);

            $order = Order::with('city', 'category', 'user')
                ->where('agent_id', $this->user_id)
                ->where('id', $request->input('order_id'))
                ->first();


            if ($order) {
                $images = DB::table('order_images')->where('order_id', $order->id)->get();
                $order['uploaded_images'] = $images;
                return ApiResponse::data(['order' => $order]);
            }

            return ApiResponse::errors(['order' => 'Order not found']);
        }
        return ApiResponse::errors(['account' => 'Token is invalid']);
    }

    public function updateOrder(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {
            $validate = ApiValidator::validate([
                'order_id' => "required|exists:orders,id",
                'status' => "nullable|in:new,approved,on_way,arrived,approved,rejected,completed,rated,cancelled,rejected"
            ]);

            if ($validate)
                return ApiResponse::errors($validate);

            $order = Order::with('city', 'category')
                ->where('agent_id', $this->user_id)
                ->where('id', $request->input('order_id'))
                ->first();


            $inputs = $request->all('status', 'agent_description', 'cost');

            foreach ($inputs as $key => $val) {
                if ($val) {
                    $order->update([
                        $key => $val
                    ]);
                }
            }

            if ($order) {
                $images = DB::table('order_images')->where('order_id', $order->id)->get();
                $order['uploaded_images'] = $images;
                return ApiResponse::data(['order' => $order]);
            }

            return ApiResponse::errors(['order' => 'Order not found']);
        }
        return ApiResponse::errors(['account' => 'Token is invalid']);
    }


    public function get_agent_statistics()
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {
            $orders = DB::table('orders')
                ->select('date_now', DB::raw('count(*) as total'))
                ->where('agent_id', $this->user_id)
                ->where('date_now', '>=', date('Y-m-d', strtotime("-7 days")))
                ->groupBy('date_now')
                ->get();

            return ApiResponse::data(['order_stat' => $orders]);
        }

    }

    public function get_qr_code(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {

            $validate = ApiValidator::validate([
                'order_id' => "required|exists:orders,id",
            ]);

            if ($validate)
                return ApiResponse::errors($validate);

            $arr = [
                'agent_id' => $this->user_id,
                'order_id' => $request->input('order_id')
            ];

            $token = JWT::encode($arr, 'j*ZF=GR5A_fLWkd=#f8v6+q32g8qsU!w', 'HS256');

            return ApiResponse::success('https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=' . $token . '&choe=ISO-8859-1&chld=H');
        }
        return ApiResponse::errors(['account' => 'Token is invalid']);
    }
    public function setIssus(Request $request){
        $validate = ApiValidator::validate([
            'order_id' => "required|exists:orders,id",
        ]);
        if ($validate)
            return ApiResponse::errors($validate);


    }
}
