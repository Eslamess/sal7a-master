<?php
namespace App\Libraries;

class ApiResponse{
	public static function errors($errorsArray){
		return response(['status' => false, 'errors' => $errorsArray]);
	}

	public static function data($data){
		return response(['status' => true, 'data' => $data]);
	}

	public static function success($message)
    {
        return response(['status' => true, 'message' => $message]);
    }

    public static function bannedMessage()
    {
        return response(
            [
                'status' => false,
                'errors' => ['un_active_account' => 'حسابك غير مفعل']
            ]
        );
    }


}
