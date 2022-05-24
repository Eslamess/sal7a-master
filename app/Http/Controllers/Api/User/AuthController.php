<?php

namespace App\Http\Controllers\Api\User;

use App\Agent;
use App\Http\Controllers\Controller;
use App\Http\Controllers\NotificationsController;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use App\Notification;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validate = ApiValidator::validate(User::registerRules());
        if ($validate) {
            return ApiResponse::errors($validate);
        }

        $inputs = $request->all('name', 'phone', 'city_id', 'address', 'longitude', 'latitude');
        $password = $request->input('password');
        $inputs['password'] = Hash::make($password);


        //Validate Code and get phone number
        $code = $request->input('code');
        $validate = Validator::make(request()->all('code'), [
            'code' => 'required|exists:email_code,code'
        ]);

        if ($validate->fails()) {
            return $validate->messages();
        } else {
            $query = DB::table('email_code')->where(['code' => $code]);
            $email = $query->first()->email;
            $inputs['email'] = $email;
            $validate = Validator::make($inputs, [
                'email' => 'required|unique:users,email|email'
            ]);
            if ($validate->fails()) {
                return $validate->messages();
            }
        }

        $user = User::create($inputs);

        if ($user)
            $query->delete();

        $user['role'] = 'user';

        return ApiResponse::data(['user' => $user]);
    }


    public function sendCode(Request $request)
    {
        $validate = ApiValidator::validate([
            'email' => 'required|email|unique:users,email'
        ]);
        if ($validate) {
            return ApiResponse::errors($validate);
        }

        $email = $request->input('email');

        $record = DB::table('email_code')->where('email', $email)->first();
        if ($record) {
            $last = strtotime($record->created_at);
            $now = strtotime(Date('Y-m-d H:i:s'));
            $diff = $now - $last;
            $seconds = 120;
            if ($diff < $seconds)
                return ApiResponse::errors(['email' => ['لا يمكن إرسال كود جديد إلا بعد مرور ' . ($seconds - $diff) . ' ثانية']]);
        }

        do {
            $code = substr(str_shuffle("0123456789"), 0, 6);
        } while (DB::table('email_code')->where('code', $code)->first());

        Mail::to($email)->send(new \App\Mail\VerifyEmail($code));

        DB::table('email_code')->updateOrInsert(
            [
                'email' => $email
            ],
            [
                'code' => $code
            ]
        );
        return ApiResponse::success('تم إرسال كود التفعيل');
    }

    public function verifyCode(Request $request)
    {
        $validate = ApiValidator::validate([
            'code' => 'required|min:6|exists:email_code,code'
        ]);
        if ($validate) {
            return ApiResponse::errors($validate);
        }
        return ApiResponse::success('الكود صحيح');
    }


    public function getCode(Request $request)
    {
        $validate = ApiValidator::validate([
            'email' => 'required|min:11|exists:email_code,email'
        ]);
        if ($validate) {
            return ApiResponse::errors($validate);
        }

        $email = $request->input('email');
        $record = DB::table('email_code')->where('email', $email)->first();

        return ApiResponse::data(['code' => $record->code]);
    }

    public function getProfile()
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'user') {
            $user = User::with('area', 'area.city')->find($this->user_id);
            if ($user)
                return ApiResponse::data(['user' => $user]);
            else
                return ApiResponse::errors(['user' => 'User Not Found']);
        } else {
            return ApiResponse::errors(['account' => 'Token is invalid']);
        }
    }

    public function updateProfile(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'user') {
            $validate = ApiValidator::validate(User::updateRules($this->user_id));
            if ($validate) {
                return ApiResponse::errors($validate);
            }

            $user = User::find($this->user_id);
            if (!$user)
                return ApiResponse::errors(['user' => 'User Not Found']);

            $inputs = $request->all('name', 'email', 'phone', 'city_id', 'address', 'longitude', 'latitude');
            $user->update($inputs);
            return ApiResponse::data(['user' => $user]);
        } else {
            return ApiResponse::errors(['account' => 'Token is invalid']);
        }
    }

    public function updatePassword(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'user') {
            $validate = ApiValidator::validate([
                'password' => 'required|confirmed|min:8'
            ]);
            if ($validate) {
                return ApiResponse::errors($validate);
            }

            $user = User::find($this->user_id);

            if (!$user)
                return ApiResponse::errors(['user' => 'User Not Found']);

            $old_password = $request->input('old_password');
            $password = $request->input('password');

            if (Hash::check($old_password, $user->password)) {
                $user->update([
                    'password' => Hash::make($password)
                ]);
                return ApiResponse::data(['user' => $user]);
            } else {
                return ApiResponse::errors(['account' => ['Old password is incorrect']]);
            }
        } else {
            return ApiResponse::errors(['account' => 'Token is invalid']);
        }
    }

    public function send_forget_password_mail(Request $request)
    {

        $validate = ApiValidator::validate([
            'email' => 'required|exists:users,email'
        ]);
        if ($validate) {
            return ApiResponse::errors($validate);
        }

        $token = substr(str_shuffle("0123456789"), 0, 6);

        DB::table('password_resets')->updateOrInsert(
            [
                'email' => $request->input('email'),
                'user_type' => 'user'
            ],
            ['token' => $token]
        );

        Mail::to($request->input('email'))->send(new \App\Mail\ForgetPassword($token));

        return ApiResponse::success('تم بنجاح');

    }

    public function resetPassword(Request $request)
    {
        $validate = ApiValidator::validate([
            'code' => 'required|exists:password_resets,token',
            'password' => 'required|min:8|confirmed'
        ]);
        if ($validate) {
            return ApiResponse::errors($validate);
        }

        $token = $request->input('code');
        $password = $request->input('password');
        $password = Hash::make($password);

        $row = DB::table('password_resets')
            ->where([
                'token' => $token,
                'user_type' => 'user'
            ])
            ->first();


        $user = User::where('email', $row->email)->first();

        if ($user) {
            $user->password = $password;
            $user->save();
            return ApiResponse::success('تم بنجاح');
        }

        return ApiResponse::errors('هذا المستخدم غير موجود');
    }

    public function setToken(Request $request)
    {
        $token=$request->input('token');
        $type =$request->input('type');
        if($type == 'android'){
            $tokenExist=User::find($this->user_id);
            if($tokenExist){
                $tokenExist->android_token=$token;
                $tokenExist->save();
                return ApiResponse::success("great work");
            }else{
                return ApiResponse::errors(['error'=>'some thing went wrong']);
            }

        }else{
            $tokenExist=User::find($this->user_id);

            if($tokenExist){
                $tokenExist->ios_token=$token;
                $tokenExist->save();
                return ApiResponse::success("great work");
            }else{
                return ApiResponse::errors(['error'=>'some thing went wrong']);
            }
        }
    }
    public function rateAgent(Request $request){
        $user=User::find($this->user_id);
        $rate=$request->input('rate');
        $agent_id=$request->input('agent_id');
        $agent=Agent::find($agent_id);
        if($agent && $rate<=5&& $user){
            $newRate=$agent->rate+$rate;
            $agent->rate=$newRate/2;
            $agent->save();
            return ApiResponse::success("great work");
        }else{
            return ApiResponse::errors(['error'=>'some thing went wrong']);
        }
    }


    public function  updateImage(Request $request){
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
            $image_ext = $image->getClientOriginalExtension();
            $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
            $image->storeAs('/public/user', $image_store_name);
            $inputs['image'] = '/storage/user/' . $image_store_name;
            $page = User::find($this->user_id);
            if($page->image) {
                $pathes = explode("/",$page->image );
                $mainPath = explode("public",public_path() );

                unlink( $mainPath[0].'storage/app/public/'.$pathes[2].'/' .$pathes[3] );

            }
            $page->image = $inputs['image'];
            $page->save();
            return ApiResponse::success("great work");
        }
        else
        {

            return ApiResponse::errors(['image'=>['image is required']]);
        }

    }


}
