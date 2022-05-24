<?php


Route::prefix('/dashboard')->namespace('Dashboard')->name('dashboard.')->group(function () {

    Route::get('/login', 'AuthController@showLoginForm')->name('login');
    Route::get('/logout', 'AuthController@adminLogout')->name('logout');
    Route::post('/login', 'AuthController@guard')->name('login');

    Route::middleware('admin')->group(function () {
        Route::get('/', 'DashboardController@index')->name('home');
        Route::resource('/admin', 'AdminController')->except('show');
        Route::resource('/user', 'UserController')->except(['edit', 'create', 'store', 'update']);
        Route::post('/user/status', 'UserController@updateStatus')->name('user.status');

        Route::resource('/agent', 'AgentController')->only(['show', 'index', 'destroy','create','store','update','edit']);
        Route::post('/agent/status', 'AgentController@updateStatus')->name('agent.status');

        Route::resource('/order', 'OrderController')->only(['show', 'index', 'destroy','edit']);

        Route::resource('/city', 'CityController')->except(['destroy']);

        Route::resource('/category', 'CategoryController')->except(['destroy']);

        Route::resource('/offer', 'OfferController')->only(['show', 'index', 'edit', 'update']);

        Route::resource('/page', 'PageController')->only(['show', 'index', 'edit', 'update']);
        Route::get('/rate','RateingController@index')->name('rateings');
        Route::get('/apprateings','RateingController@appRatings')->name('apprateings');
        ///////////// condactror section /////////////
        Route::get('/contractor/agent', 'ContractorDataController@index')->name('contractor.agent');
        Route::resource('/contractor', 'ContractorController')->only(['index','edit', 'create', 'store', 'update']);
        Route::resource('/contractorAgent', 'ContractorAgent')->only(['index','edit', 'create', 'store', 'update','destroy','show']);
        Route::resource('/contractorOrder', 'ContractorOrder')->only(['index','edit', 'create', 'store', 'update','destroy','show']);

        ///////////// offer section ////////////////
        Route::resource('/offers', 'offerController');
        ///////////// home section ////////////////
        Route::get('/changeStatue/{id}', 'AgentController@quikChange');

        /////////////points////////////////
        Route::resource('/point', 'PointsController')->only(['edit' ,'update']);
//        Route::get('/contractorData/show', 'ContractorDataController@show')->name('contractorData.show');
//        Route::post('/contractorData/edit/{agent}', 'ContractorDataController@edit')->name('contractorData.edit');
//        Route::post('/contractorData/update/{agent}', 'ContractorDataController@update')->name('contractorData.update');

    });
});
