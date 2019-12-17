<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function () {

    Route::post('login', 'AuthController@login');
    Route::get('logout', 'AuthController@logout');
    Route::get('refresh', 'AuthController@refresh');
    Route::get('me', 'AuthController@me');

});
Route::middleware('auth:api')->group(function () {
    //---------------------------------- REFERENCES -----------------------------------------------
    //DASHBOARD
    Route::get('dashboard/index/{payment_type}', 'References\DashboardController@index');
    Route::get('dashboard/payment/{payment_type}/{is_string}', 'References\DashboardController@getPaymentLine');
    //END DASHBOARD
    // List of Charges
});
