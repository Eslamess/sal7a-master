<?php

Route::prefix('/user')->namespace('Api\User')->group(function () {

    // Register
    Route::post('/register', 'AuthController@register');
    Route::post('/register/verify_email', 'AuthController@sendCode');
    Route::post('/register/verify_code', 'AuthController@verifyCode');


    //for test only
    Route::get('/register/get_code', 'AuthController@getCode');


    // Get Profile
    Route::get('/profile', 'AuthController@getProfile');
    Route::post('/profile', 'AuthController@updateProfile');
    Route::post('/password', 'AuthController@updatePassword');


    Route::post('/forgetPassword', 'AuthController@send_forget_password_mail');
    Route::post('/resetPassword', 'AuthController@resetPassword');


    Route::prefix('/order')->group(function () {

        //list orders
        Route::get('list', 'OrderController@index');

        //show order
        Route::get('show', 'OrderController@show');

        //Create Order
        Route::post('/', 'OrderController@create');

        //rate order
        Route::post('rate', 'OrderController@rate');

        Route::post('updateOrder', 'OrderController@updateOrder');

        Route::post('/scan_code', 'OrderController@scan_qr_code');
        // run cron jobs
        Route::get('/checkOfferCron', 'OrderController@checkOfferCron');
        // check offer
        Route::post('/checkOffer', 'OrderController@checkOffer');

    });

    //List offers
    Route::get('offers', 'OfferController@index');
    Route::get('offer_detail', 'OfferController@detail');

    // app rateing
    route::post('addRate', 'AppRateing@index');
    route::get('getRate', 'AppRateing@getRate');
    route::post('updateRate', 'AppRateing@updateRate');

    //notifications
    Route::post('/setToken', 'AuthController@setToken');
    Route::get('/testNotifi', 'AuthController@testNotifi');

//agent rate
    Route::post('/agentRate', 'AuthController@rateAgent');
    //image handeler
    Route::post('/updateImage', 'AuthController@updateImage');


});
