<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/', 'Web\HomeController@home')->name('user.home');
Route::get('/about', 'Web\HomeController@about')->name('user.about');
Route::get('/contact', 'Web\HomeController@contact')->name('user.contact');


require_once 'admin.php';
