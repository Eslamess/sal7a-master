<?php

Route::prefix('/agent')->namespace('Api\Agent')->group(function () {


    //Register
    Route::post('/register', 'AuthController@register');
    Route::post('/register/verify_email', 'AuthController@sendCode');
    Route::post('/register/verify_code', 'AuthController@verifyCode');


    //for test only
    Route::get('/register/get_code', 'AuthController@getCode');
    Route::get('/available', 'AuthController@available');

    Route::post('/forgetPassword', 'AuthController@send_forget_password_mail');
    Route::post('/resetPassword', 'AuthController@resetPassword');


    //change available status
    Route::post('/status', 'GeneralController@change_status');

    //image handeler
    Route::post('/updateImage', 'AuthController@updateImage');

    //notifications
    Route::post('/setToken', 'AuthController@setToken');

//user rate
    Route::post('/userRate', 'AuthController@rateUser');




    // Get Profile
    Route::get('/profile', 'AuthController@getProfile');
    Route::post('/profile', 'AuthController@updateProfile');
    Route::post('/password', 'AuthController@updatePassword');

    Route::prefix('/order')->group(function () {

        //list orders
        Route::get('list', 'OrderController@index');

        //show order
        Route::get('show', 'OrderController@show');

        Route::post('updateOrder', 'OrderController@updateOrder');

        Route::get('/statistics', 'OrderController@get_agent_statistics');

        Route::post('/qr_code', 'OrderController@get_qr_code');
    });

});
