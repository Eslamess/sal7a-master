<?php

namespace App\Http\Controllers;

use App\Agent;
use App\Libraries\ApiResponse;
use App\Libraries\JwtLibrary;
use App\Notification;
use App\User;
use Firebase\JWT\JWT;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use function GuzzleHttp\Promise\all;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $user_id, $user_type, $user;

    function __construct()
    {
        $token = JwtLibrary::getToken();
        if ($token) {
            $data = '';
            try{
                $data = JwtLibrary::decode($token);
            }catch(\Exception $exception){
                return ApiResponse::errors(['Token' => 'Token is invalid']);
            }

            $user_id = $data->user_id;
            $user_type = $data->user_type;

            if ($user_type == 'user'){
                $user = User::find($user_id);
            }

            elseif($user_type == 'agent'){
                $user = Agent::find($user_id);
            }


            if ($user) {
                $this->user = $user;
                $this->user_id = $user_id;
                $this->user_type = $user_type;
            }
        }
    }
    public function sendNotifi($title,$body,$user_ids=null,$role,$type,$target_id,$all_users=null){

        $notification=new NotificationsController();
        $notificationInputs['type']=$type;
        $notificationInputs['notifiable_id']=$target_id;
        $notificationInputs['title']=$title;
        $notificationInputs['body']=$body;
        $notificationInputs['user_role']=$role;
        $notificationInputs['user_id']=$user_ids;
        $notificationType=[
            'type'=>$type,
            'id'=>$this->user_id,
            'role'=>$role
        ];

        if($role=='agent')
            $user=Agent::find($user_ids);
        else
            $user=User::find($user_ids);
        if($all_users == null){
            $notification->toMultiMobile($user,$notificationInputs['title'],
            $notificationInputs['body'],
            null,$type,null,$notificationType);}
        else{

            $notification->toMultiMobiles($all_users,$notificationInputs['title'],
                $notificationInputs['body'],
                null,null,null,$notificationType);
        }


        Notification::create($notificationInputs);


    }
    public function sendWebNotifi($title,$body,$model,$url){

        $notification=new NotificationsController();
        $notificationInputs['type']="admin";
        $notificationInputs['notifiable_id']=0;
        $notificationInputs['title']=$title;
        $notificationInputs['body']=$body;
        $notificationInputs['user_role']="null";
        $notificationInputs['user_id']="null";
        $notificationInputs['url']=$url;
            $notification->toMultiDevice($model,$notificationInputs['title'],
                $notificationInputs['body'],
                null,null,$url);
        Notification::create($notificationInputs);


    }

    public function maping($status){
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
        if(in_array($status,$globalSatus)) {
            $new=    array_keys($globalSatus, $status);
            return $new[0];
        }
    }
}
