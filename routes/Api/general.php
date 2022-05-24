<?php



route::namespace('Api\General')->group(function () {

    //Login
    Route::post('/login', 'LoginController@login');

    //List Cities
    route::get('/cities', 'CityController@index');
    route::get('/city', 'CityController@show');

    //List Categories
    route::get('/categories', 'CategoryController@index');


    route::get('/page', 'PageController@show');
    //settings
    route::get('/settings', 'settings@getAppSettings');

});

