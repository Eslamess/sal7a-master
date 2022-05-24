<?php


Route::prefix('/dashboard')->namespace('Dashboard')->name('dashboard.')->group(function () {
    Route::middleware('admin')->group(function () {
        Route::get('/', 'DashboardController@index')->name('home');
        Route::resource('/admin', 'AdminController')->except('show');


        Route::resource('/user', 'UserController')->except(['edit', 'create', 'store', 'update']);
        Route::post('/user/status', 'UserController@updateStatus')->name('user.status');

        Route::resource('/agent', 'AgentController')->only(['show', 'index', 'destroy','create','store']);
        Route::post('/agent/status', 'AgentController@updateStatus')->name('agent.status');

        Route::resource('/order', 'OrderController')->only(['show', 'index', 'destroy','edit']);

        Route::resource('/city', 'CityController')->except(['destroy']);

        Route::resource('/category', 'CategoryController')->except(['destroy']);

        Route::resource('/offer', 'OfferController')->only(['show', 'index', 'edit', 'update']);

        Route::resource('/page', 'PageController')->only(['show', 'index', 'edit', 'update']);
        Route::get('/rate','RateingController@index')->name('rateings');
        Route::get('/apprateings','RateingController@appRatings')->name('apprateings');
        ///////////////////////////////
        Route::resource('/condactor/', 'PageController')->only(['show', 'index', 'edit', 'update']);


    });
});
