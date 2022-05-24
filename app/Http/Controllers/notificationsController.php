<?php
namespace App\Http\Controllers;
use App\Libraries\ApiResponse;
use Illuminate\Http\Request;
use LaravelFCM\Message\OptionsBuilder;
use LaravelFCM\Message\PayloadDataBuilder;
use LaravelFCM\Message\PayloadNotificationBuilder;
use FCM;
class NotificationsController extends Controller
{
//    function __construct()
//{
//    return ApiResponse::success("here");
//
//}
    // for admins only
    public function toMultiDevice($model,$title=null,$body=null,$icon,$click,$click_action)
    {

        $optionBuilder = new OptionsBuilder();
        $optionBuilder->setTimeToLive(2419199);
        $optionBuilder->setPriority('high');
        $notificationBuilder = new PayloadNotificationBuilder($title);
        $notificationBuilder->setBody($body)
            ->setSound('default')
            ->setBadge(1)
            ->setIcon('icon')
            ->setClickAction($click_action);
        $dataBuilder = new PayloadDataBuilder();
        $dataBuilder->addData(['a_data' => 'my_data']);
        $option = $optionBuilder->build();
        $notification = $notificationBuilder->build();
        $data = $dataBuilder->build();
        $tokens = $model->where('web_token', '!=', null)->pluck('web_token')->toArray();

        $downstreamResponse=FCM::sendTo($tokens, $option, $notification, $data);

        $downstreamResponse->numberSuccess();
        $downstreamResponse->numberFailure();
        $downstreamResponse->numberModification();
        $downstreamResponse->tokensToDelete();
        $downstreamResponse->tokensToModify();
        $downstreamResponse->tokensToRetry();


    }
    //for all mobile and one user
    public function toMultiMobile($model,$title=null,$body=null,$icon,$click,$click_action=null,$notificationType,$setPriority='high')
    {

        $optionBuilder = new OptionsBuilder();
        $optionBuilder->setTimeToLive(2419199);
        $optionBuilder->setPriority($setPriority);
        $notificationBuilder = new PayloadNotificationBuilder($title);
        $notificationBuilder->setBody($body)
            ->setSound('default')
            ->setBadge(1)
            ->setIcon($icon)
            ->setClickAction(null);
        $dataBuilder = new PayloadDataBuilder();
        $option = $optionBuilder->build();
        $notification = $notificationBuilder->build();
        $dataBuilder->setData($notificationType);
        $data = $dataBuilder->build();
        $ios_token=array();
        $android_token=array();
        if(!empty($model->android_token))
            $tokens[]=$model->android_token;
        if(!empty($model->ios_token))
            $tokens[]=$model->ios_token;
        if(empty($tokens))
            return false;


        $downstreamResponse=FCM::sendTo($tokens, $option, $notification, $data);
        $downstreamResponse->numberSuccess();
        $downstreamResponse->numberFailure();
        $downstreamResponse->numberModification();
        $downstreamResponse->tokensToDelete();
        $downstreamResponse->tokensToModify();
        $downstreamResponse->tokensToRetry();
        $downstreamResponse->tokensWithError();

    }
    public function toMultiMobiles($models,$title=null,$body=null,$icon,$click,$click_action,$notificationType)
    {
        $optionBuilder = new OptionsBuilder();
        $optionBuilder->setTimeToLive(2419199);
        $notificationBuilder = new PayloadNotificationBuilder($title);
        $notificationBuilder->setBody($body)
            ->setSound('default')
            ->setBadge(1)
            ->setIcon($icon)
            ->setClickAction(null);
        $dataBuilder = new PayloadDataBuilder();
        $option = $optionBuilder->build();
        $notification = $notificationBuilder->build();
        $dataBuilder->setData($notificationType);
        $data = $dataBuilder->build();
        $android_tokens=[];
        $ios_tokens=[];
        foreach ($models as $model)
        {
            if(!empty($model->android_token))
                array_push($android_tokens,$model->android_token);
            if(!empty($model->ios_token))
                array_push($ios_tokens,$model->ios_token);
        }
        $tokens=array_merge($ios_tokens,$android_tokens);
        if(empty($tokens))
            return false;
        $downstreamResponse=FCM::sendTo($tokens, $option, $notification, $data);
        $downstreamResponse->numberSuccess();
        $downstreamResponse->numberFailure();
        $downstreamResponse->numberModification();
        $downstreamResponse->tokensToDelete();
        $downstreamResponse->tokensToModify();
        $downstreamResponse->tokensToRetry();
        $downstreamResponse->tokensWithError();
    }
}

