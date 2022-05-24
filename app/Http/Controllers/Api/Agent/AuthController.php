<?php

namespace App\Http\Controllers\Api\Agent;

use App\AppRate;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use App\Agent;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
class AuthController extends Controller
{

    public function register(Request $request)
    {
        $validate = ApiValidator::validate(Agent::registerRules());
        if ($validate) {
            return ApiResponse::errors($validate);
        }
        $inputs = $request->all('name', 'city_id', 'phone', 'longitude', 'latitude', 'birthday', 'category_id', 'image', 'national_id2');
        $password = $request->input('password');
        $inputs['password'] = Hash::make($password);
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
            $image_ext = $image->getClientOriginalExtension();
            $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
            $image->storeAs('/public/agents', $image_store_name);
            $inputs['image'] = '/storage/agents/' . $image_store_name;
        }
        if ($request->hasFile('national_id')) {
            $images = $request->file('national_id');
            foreach ($images as $image) {
                $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $image_ext = $image->getClientOriginalExtension();
                $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
                $image->storeAs('/public/id', $image_store_name);
                $inputs['national_id'][] = '/storage/id/' . $image_store_name;
            }
//            $image = $request->file('national_id');
//            $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
//            $image_ext = $image->getClientOriginalExtension();
//            $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
//            $image->storeAs('/public/id', $image_store_name);
//            $inputs['national_id'] = '/storage/id/' . $image_store_name;
            $inputs['national_id']=ApiValidator::ConvertArrayImageToString($inputs['national_id']);
        }
        if ($request->hasFile('documents_images')) {
            $images = $request->file('documents_images');
            foreach ($images as $image) {
                $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $image_ext = $image->getClientOriginalExtension();
                $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
                $image->storeAs('/public/documents', $image_store_name);
                $inputs['documents_images'][] = '/storage/documents/' . $image_store_name;
            }
            $inputs['documents_images']=ApiValidator::ConvertArrayImageToString($inputs['documents_images']);
        }
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
                'email' => 'required|unique:agents,email|email'
            ]);
            if ($validate->fails()) {
                return $validate->messages();
            }
        }
        $user = Agent::create($inputs);
        if ($user)
            $query->delete();
        $user['role'] = 'agent';
        $user['documents_images']=ApiValidator::ConvertStringImageToArray($inputs['documents_images']);
        $user['national_id']=ApiValidator::ConvertStringImageToArray($inputs['national_id']);
        return ApiResponse::data(['agent' => $user]);
    }



    public function getProfile()
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {
            $agent = Agent::with('area', 'area.city', 'category')->find($this->user_id);
            if ($agent)
                return ApiResponse::data(['agent' => $agent]);
            else
                return ApiResponse::errors(['agent' => 'Agent Not Found']);
        } else {
            return ApiResponse::errors(['account' => 'Token is invalid']);
        }
    }

    public function updateProfile(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {
            $validate = ApiValidator::validate(Agent::updateRules($this->user_id));
            if ($validate) {
                return ApiResponse::errors($validate);
            }

            $agent = Agent::find($this->user_id);
            if (!$agent)
                return ApiResponse::errors(['agent' => 'Agent Not Found']);

            $inputs = $request->all('name', 'email', 'phone', 'city_id', 'longitude', 'latitude', 'category_id', 'birthday');
            $agent->update($inputs);
            return ApiResponse::data(['agent' => $agent]);
        } else {
            return ApiResponse::errors(['account' => 'Token is invalid']);
        }
    }

    public function  updateImage(Request $request){
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $image_name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
            $image_ext = $image->getClientOriginalExtension();
            $image_store_name = $image_name . '_' . time() . '.' . $image_ext;
            $image->storeAs('/public/agents', $image_store_name);
            $inputs['image'] = '/storage/agents/' . $image_store_name;
            $page = Agent::find($this->user_id);
            if($page ) {
                $pathes = explode("/",$page->image );
                $mainPath = explode("public",public_path() );
                if($page->image && file_exists($mainPath[0].'storage/app/public/'.$pathes[2].'/' .$pathes[3]) ){
                    unlink( $mainPath[0].'storage/app/public/'.$pathes[2].'/' .$pathes[3] );
                }


                $page->image = $inputs['image'];
                $page->save();
                return ApiResponse::success("great work");
            }
        }




    }
    public function updatePassword(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {
            $validate = ApiValidator::validate([
                'password' => 'required|confirmed|min:8'
            ]);
            if ($validate) {
                return ApiResponse::errors($validate);
            }

            $agent = Agent::find($this->user_id);

            if (!$agent)
                return ApiResponse::errors(['user' => 'User Not Found']);

            $old_password = $request->input('old_password');
            $password = $request->input('password');

            if (Hash::check($old_password, $agent->password)) {
                $agent->update([
                    'password' => Hash::make($password)
                ]);
                return ApiResponse::data(['agent' => $agent]);
            } else {
                return ApiResponse::errors(['account' => 'Old password is incorrect']);
            }
        } else {
            return ApiResponse::errors(['account' => 'Token is invalid']);
        }
    }

    public function send_forget_password_mail(Request $request)
    {
        $validate = ApiValidator::validate([
            'email' => 'required|exists:agents,email'
        ]);
        if ($validate) {
            return ApiResponse::errors($validate);
        }

        $token = substr(str_shuffle("0123456789"), 0, 6);

        DB::table('password_resets')->updateOrInsert(
            [
                'email' => $request->input('email'),
                'user_type' => 'agent'
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
                'user_type' => 'agent'
            ])
            ->first();

        if ($row) {
            $user = Agent::where('email', $row->email)->first();

            if ($user) {
                $user->password = $password;
                $user->save();
                return ApiResponse::success('تم بنجاح');
            }
        }
        return ApiResponse::errors('هذا المستخدم غير موجود');
    }



    public function sendCode(Request $request)
    {
        $validate = ApiValidator::validate([
            'email' => 'required|email|unique:agents,email'
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
    public function setToken(Request $request)
    {
        $token=$request->input('token');
        $type =$request->input('type');
        if($type == 'android'){
            $tokenExist=Agent::find($this->user_id);
            if($tokenExist){
                $tokenExist->android_token=$token;
                $tokenExist->save();
                return ApiResponse::success("great work");
            }else{
                return ApiResponse::errors(['error'=>'some thing went wrong']);
            }

        }else{
            $tokenExist=Agent::find($this->user_id);
            if($tokenExist){
                $tokenExist->ios_token=$token;
                $tokenExist->save();
                return ApiResponse::success("great work");
            }else{
                return ApiResponse::errors(['error'=>'some thing went wrong']);
            }
        }
    }
    public function rateUser(Request $request){
        $agent=Agent::find($this->user_id);
        $rate=$request->input('rate');
        $user_id=$request->input('user_id');
        $user=User::find($user_id);

        if($agent && $rate<=5&& $user){
            $newRate=$user->rate+$rate;
            $user->rate=$newRate/2;
            $user->save();
            return ApiResponse::success("great work");
        }else{
            return ApiResponse::errors(['error'=>'some thing went wrong']);
        }
    }
    public function available(){
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {
            if ($this->user->is_available == 1)
                $this->user->update(["is_available"=>0]);
            else
                $this->user->update(["is_available"=>1]);
            return ApiResponse::success("great work");
        } else {
            return ApiResponse::errors(['account' => 'Token is invalid']);
        }

    }
}
