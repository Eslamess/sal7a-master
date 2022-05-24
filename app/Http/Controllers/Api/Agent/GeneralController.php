<?php

namespace App\Http\Controllers\Api\Agent;

use App\Agent;
use App\Http\Controllers\Controller;
use App\Libraries\ApiResponse;
use App\Libraries\ApiValidator;
use Illuminate\Http\Request;

class GeneralController extends Controller
{
    public function change_status(Request $request)
    {
        if ($this->user_id && $this->user_type && $this->user_type == 'agent') {
            $validate = ApiValidator::validate([
                'status' => 'required|in:0,1'
            ]);
            if ($validate)
                return ApiResponse::errors($validate);


            $status = $request->input('status');

            $user = Agent::find($this->user_id);
            $user->update(['is_available' => $status]);

            return ApiResponse::success('تم بنجاح');
        }

        return ApiResponse::errors(['account' => 'Token is invalid']);
    }
}
