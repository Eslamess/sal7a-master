<?php

namespace App\Http\Controllers\Dashboard;

use App\Agent;
use App\Http\Controllers\Controller;
use App\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ContractorOrder extends Controller
{
    public function index()
    {

        $orders=Order::join('agents', 'agents.id', '=', 'orders.agent_id')->select('orders.*')->where('agents.admin_id',Auth::guard('admin')->user()->id)
            ->get();
        foreach ($orders as $order){
            $order->status=$this->maping($order->status);
        }
        return view('admin.contractor.order.index')->with('orders', $orders);
    }

    public function show($id)
    {
        $order=Order::find($id);
        $order->status=$this->maping($order->status);
        if(isset($order->user->latitude )&& isset($order->user->longitude)){
            $agents = $this->findNearestAgent($order->user->latitude, $order->user->longitude,$order->category_id);

            if($agents->isNotEmpty())
            {
                return view('admin.contractor.order.show',compact('agents','order'));
            }
            else{
                return view('admin.contractor.order.show',compact('order'));
            }

        }else{
            return view('admin.contractor.order.show',compact('order'));

        }

    }
    public function edit(Request $request,$id)
    {
        $this_order = Order::find($id);
        $order=$this_order;
        if($request->input('status')){
            //.$request->input('cancel_reason')
            $this_order->status = $request->input('status');
            if($request->input('status')== 'cancelled' ){
                $this->sendNotifi('تم الغاء الطلب',
                    'سبب الالغاء العميل:',$order->agent_id,'agent',
                    'order',$order->id,null);
            }else
                $this->sendNotifi('تم تغير الحالة',$this->maping($request->input('status'))
                    ,$order->user_id,'user','order',$order->id,null);

        }else {
            $this_order->agent_id = $request->input('agent');
            $this->sendNotifi('تعيين جديد',
                'تم تعينك لخدمة جديده من قبل الادمن',$request->input('agent'),'agent','order',$order->id,null);
        }
//        if($request->input('status')){
//            $this_order->status = $request->input('status');
//
//        }else {
//            $this_order->agent_id = $request->input('agent');
//        }
        $this_order->save();
        return redirect()->back()->with('message',"تم بنجاح ");

    }
    public function findNearestAgent($lat, $lon,$category)
    {
        $agent=[];
        $agent = DB::table('agents')
            ->where('status', 'active')
            ->where('category_id', $category)
            ->where('is_available', '1')
            ->where('admin_id', Auth::guard('admin')->user()->id)
            ->select("*", DB::raw("6371 * acos(cos(radians(" . $lat . ")) * cos(radians(agents.latitude)) * cos(radians(agents.longitude) - radians(" . $lon . ")) + sin(radians(" . $lat . ")) * sin(radians(agents.latitude))) AS distance"))
            ->orderBy('distance')
            ->get();

        if ($agent)
            return $agent;

        return $agent;
    }
    public function maping($model){
        $globalSatus = array(
            'طلب جديد' => 'new',
            'العامل في الطريق' => 'on_way',
            'تم وصول العامل' => 'arrived',
            'تم المعاينة' => 'checked',
            'تم الموافقة' => 'approved',
            'تم الرفض' => 'rejected',
            'تم التنفيذ' => 'completed',
            'تم الدفع' => 'paid',
            'لم يتم الدفع' => 'not_paid',
            'توقف' => 'cancelled',
            'مقيم' => 'rated',
        );
        if(in_array($model,$globalSatus)) {
            $new=    array_keys($globalSatus, $model);
            return $new[0];
        }
    }
    public function destroy($id){
        $user = Order::where('id',$id)->delete();
        if($user)
            return redirect()->route('dashboard.contractorOrder.index')->with('error', 'تم حذف الطلب');

    }
}
