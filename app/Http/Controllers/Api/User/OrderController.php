<?php

namespace App\Http\Controllers\Api\User;

use App\Agent;
use App\Category;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use App\Offer;
use App\Order;
use App\Point;
use App\Admin;

use Firebase\JWT\JWT;
use http\Client\Curl\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function create(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'user') {


            $whenToSend="";
            $inputs = $request->all('city_id', 'category_id', 'address', 'latitude', 'longitude', 'date', 'time', 'description', 'payment_method');
            $inputs['user_id'] = $this->user_id;
            $inputs['date_now'] = date('Y-m-d');

            //Validate Inputs from Client
            $orderValidate = Validator::make($inputs, [
                'user_id' => 'required|exists:users,id',
                'city_id' => 'required|exists:cities,id',
                'category_id' => 'required|exists:categories,id',
                'address' => 'required',
                'latitude' => 'required',
                'longitude' => 'required',
                'date' => 'date|after:today|required',
                'time' => 'required',
                'description' => 'required|min:15'
            ]);
            if ($orderValidate->fails())
                return ApiResponse::errors($orderValidate->messages());


            $agent_id = $this->findNearestAgent($inputs['latitude'], $inputs['longitude'],$request->input('category_id'));
            if ($agent_id)
                $inputs['agent_id'] = $agent_id;
            $category = Category::find($inputs['category_id']);
            if ($category) {
                if($this->user->credits >$category->visit_fees){
                    $whenToSend="do";
                    $credit=$this->user->credits-$category->visit_fees;
                    $this->user->credits=$credit;
                    $this->user->save();
                    $inputs['visit_fees'] = 0;

                }elseif ($this->user->credits <$category->visit_fees){

                    $inputs['visit_fees'] = $category->visit_fees;
                }else{
                    $whenToSend="do";
                    $this->user->credits=0;
                    $this->user->save();
                    $inputs['visit_fees'] = 0;
                }

            }


            $coupon = $request->all('coupon');
            if (isset($coupon['coupon'])) {
                $couponValidate = Validator::make($coupon, [
                    'coupon' => 'required|exists:offers,coupon'
                ]);
                if ($couponValidate->fails())
                    return ApiResponse::errors($couponValidate->messages());

                $offer = Offer::where('coupon', $inputs['coupon'])->first();
                if ($offer) {
                    if ($offer->start_date <= Date('Y-d-m') && $offer->end_date >= today())
                        $inputs['offer_id'] = $offer->id;
                    else
                        return ApiResponse::errors(['coupon' => 'This coupon is expired']);
                }
            }

            $orderValidate2 = Validator::make($inputs, [
                'agent_id' => 'required|exists:agents,id',
                'visit_fees' => 'required|numeric',
            ]);
            if ($orderValidate2->fails())
                return ApiResponse::errors($orderValidate2->messages());

            $order = Order::create($inputs);

            if ($request->hasFile('images')) {
                $orderValidate = Validator::make($request->all('images'), [
                    'images.*' => 'image',
                ]);

                if ($orderValidate->fails())
                    return ApiResponse::errors($orderValidate->messages());


                if ($order) {
                    $images = $request->file('images');
                    foreach ($images as $image) {
                        $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                        $image_ext = $image->getClientOriginalExtension();

                        $image_store_name = $image_name . '_' . time() . '.' . $image_ext;

                        $image->storeAs('/public/order/', $image_store_name);

                        DB::table('order_images')->insert([
                            'order_id' => $order->id,
                            'src' => '/storage/order/' . $image_store_name,
                        ]);

                    }
                } else {
                    return ApiResponse::errors(['order' => 'Order Not Created']);
                }

            }
            $point=Point::find(1);
            $temp=$this->user->points;//5
            $this->user->points=$temp+$point->point_per_order;//10;
            if($this->user->points >=$point->point_value){
                $temp2=$this->user->credits;
                $this->user->credits=$temp2+$point->credit_value;
                $this->user->points-=$point->point_value;
            }
            $this->user->save();
            $this->sendNotifi('لديك طلب جديد',
                '',$inputs['agent_id'],'agent','order',$order->id,null);
            //after finish
//            if($whenToSend == "do")
//            $this->sendNotifi('تكاليف الخدمة','تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!'
//                ,$this->user->id,'user','order',$order->id,null);
            //$this->sendWebNotifi("لديك طلب جديد",'يوجد طلب جديد في قسم'.$category->name,Admin::where('supervisor',0)->get(),'https://sal7a.dtagdev.com/dashboard/order/'.$order->id);

            return ApiResponse::data(['order' => $order]);
        }

        return ApiResponse::errors(['account' => 'Token is invalid']);
    }

    public function findNearestAgent($lat, $lon,$category)
    {

        $agents = Agent::
            where('status', 'active')
            ->where('category_id',$category)
            ->where('is_available', '1')
            ->where('status', 'active')
            ->select("*", DB::raw("6371 * acos(cos(radians(" . $lat . ")) * cos(radians(agents.latitude)) * cos(radians(agents.longitude) - radians(" . $lon . ")) + sin(radians(" . $lat . ")) * sin(radians(agents.latitude))) AS distance"))
            ->orderBy('distance')
            ->first();
        if ($agents)
            return $agents->id;
        return null;
    }

    public function index()
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'user') {
            $validate = ApiValidator::validate([
                'status' => "required",
                'status.*' => 'in:new,cancelled,on_way,arrived,approved,rejected,completed,rated'
            ]);

            if ($validate)
                return ApiResponse::errors($validate);

            $orders = Order::with('agent', 'city', 'category')
                ->where('user_id', $this->user_id)
                ->whereIn('status', request()->input('status'))
                ->get();


            return ApiResponse::data(['orders' => $orders]);
        }
        return ApiResponse::errors(['account' => 'Token is invalid']);
    }

    public function show(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'user') {
            $validate = ApiValidator::validate([
                'order_id' => "required|exists:orders,id"
            ]);

            if ($validate)
                return ApiResponse::errors($validate);

            $order = Order::with('agent', 'city', 'category')
                ->where('user_id', $this->user_id)
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
        if ($this->user_id && $this->user_type && $this->user_type == 'user') {
            $validate = ApiValidator::validate([
                'order_id' => "required|exists:orders,id",
                'status' => "nullable|in:new,approved,on_way,arrived,approved,rejected,completed,rated,cancelled,rejected"
            ]);

            if ($validate)
                return ApiResponse::errors($validate);

            $order = Order::with('city', 'category')
                ->where('user_id', $this->user_id)
                ->where('id', $request->input('order_id'))
                ->first();

            if ($order) {

                $inputs = $request->all('status', 'cancel_reason');

                foreach ($inputs as $key => $val) {
                    if ($val) {
                        $order->update([
                            $key => $val
                        ]);
                    }
                }

                $order['uploaded_images'] = $order->getImages();

                if($request->input('status')== 'cancelled' ){
                    $this->sendNotifi('تم الغاء الطلب',
                        $request->input('cancel_reason'),$order->agent_id,'agent','order',$request->input('order_id'));
                }else
                    $this->sendNotifi('تم تغير الحالة',$this->maping($request->input('status'))
                        ,$this->user_id,'user','order',$request->input('order_id'));

                return ApiResponse::data(['order' => $order]);
            }

            return ApiResponse::errors(['order' => 'Order not found']);
        }
        return ApiResponse::errors(['account' => 'Token is invalid']);
    }


    public function rate(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'user') {
            $validate = ApiValidator::validate([
                'order_id' => "required|exists:orders,id",
                'rate' => "required|numeric|min:0|max:5",
                'rate_comment' => "nullable"
            ]);

            if ($validate)
                return ApiResponse::errors($validate);

            $order = Order::with('city', 'category')
                ->where('user_id', $this->user_id)
                ->where('id', $request->input('order_id'))
                ->first();

            if ($order && $order->status == 'completed') {
                $order->update(
                    [
                        'rate' => $request->input('rate'),
                        'status' => 'rated',
                        'rate_comment'=>$request->input('rate_comment')
                    ]
                );
                return ApiResponse::data(['order' => $order]);
            }

            return ApiResponse::errors(['order' => 'Order not found or isn\'t completed yet!']);
        }
        return ApiResponse::errors(['account' => 'Token is invalid']);
    }

    public function scan_qr_code(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'user') {

            $validate = ApiValidator::validate([
                'order_id' => "required|exists:orders,id",
                'qr_code' => "required",
            ]);

            if ($validate)
                return ApiResponse::errors($validate);


            $qr_token = $request->input('qr_code');


            $qr_decode = [];


            try{
                $qr_decode = Jwt::decode($qr_token, 'j*ZF=GR5A_fLWkd=#f8v6+q32g8qsU!w', ['HS256'] );
            }catch(\Exception $exception){
                return ApiResponse::errors(['Order' => 'This QR Code is Invalid']);
            }

            $qr_order_id = $qr_decode->order_id;
            $qr_agent_id = $qr_decode->agent_id;
            $order = Order::with('user', 'agent', 'city', 'category')->find($request->input('order_id'));

            if ($order && $qr_order_id && $qr_agent_id) {
                if ($order->agent_id == $qr_agent_id && $qr_order_id == $order->id) {

                    $order->update(['status' => 'arrived']);
                    return ApiResponse::data($order);
                }
            }

            return ApiResponse::errors(['Order' => 'This QR  is Invalid']);
        }
        return ApiResponse::errors(['account' => 'Token is invalid']);
    }

    public function checkOfferCron(){
        $offers=Offer::where('end_date','<',date("Y/m/d"))->update([
            'status'=>'deactivated'
        ]);

    }
    public function checkOffer(Request $request){
        $this->checkOfferCron();
        $coupon=$request->input('coupon');
        $offer=Offer::where('status','active')->where('coupon',$coupon)->first();
        if($offer)
            return ApiResponse::success("great work");
        else
            return ApiResponse::errors(["error"=>"not active"]);
    }
}
