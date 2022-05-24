<?php

Route::prefix('/admin')->namespace('Api\Admin')->group(function () {

    Route::prefix('/agent')->group(function () {
        //Register as agent
        Route::post('/register', 'AuthController@register');
    });

    Route::prefix('/city')->group(function () {
        //Add a city
        Route::post('/add', 'CityController@create');
    });


    Route::prefix('/category')->group(function () {
        //add a category
        Route::post('/add', 'CategoryController@create');
    });

});
