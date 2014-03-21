<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	return View::make('index');
});

Route::post('/login', array(
  'before' => 'csrf',
  'uses' => 'UsersController@login'
));

Route::post('/logout','UsersController@logout');
Route::resource('sidebar', 'SidebarsController');