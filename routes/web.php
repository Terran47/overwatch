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

Route::get('/', 'HomeController@index');
header("Access-Control-Allow-Origin: *");
Auth::routes();
Route::get('/login', 'userAuthController@login');
Route::get('register', 'userAuthController@register');

Route::get('/battle-net', 'userAuthController@battleNetRedirect');
Route::get('/battle-user', 'userAuthController@battlenetUser');

Route::get('/ref/{code}', 'userAuthController@refCode');

Route::group(['middleware'=>'auth'], function(){
	//navigation
	Route::get('/profile', 'profileController@profile');

	Route::get('/logout', 'profileController@logout');

	Route::get('/{getPage?}', 'profileController@getPage');

	Route::post('/rating-table', 'ratingController@ratingTable');

	//Кланы
	Route::post('/get-clans/{clanPage}', 'clansController@getClans');
	//подробная инфа клана
	Route::get('/clan/{name}/{id}', 'clansController@clanInfo');
	Route::post('/create-clan', 'clansController@createClan');
	Route::post('/apply-now', 'clansController@applyNow');
	Route::post('/edit-clan', 'clansController@editClan');
	Route::post('/upload-img-clan', 'clansController@uploadImgClan');
	Route::post('/join-clan', 'clansController@joinClan');
	Route::post('/save-edit', 'clansController@saveEdit');
	Route::post('/accept-gamer', 'clansController@acceptGamer');
	Route::post('/logout-clan', 'clansController@logoutClan');
	Route::post('/refuse-gamer', 'clansController@refuseGamer');

	//Конец кланы

	//Рейтинг
	Route::post('/get-search', 'ratingController@getsearch');
	Route::post('/update-user-info', 'ratingController@updUserInfo');
	Route::post('/invite-user', 'ratingController@inviteUser');

	//Баланс
	Route::post('/payment/get', 'balanceController@templateBalance');
	Route::get('/payment/success', 'balanceController@success');	
	Route::get('/payment/fail', 'balanceController@fail');
	Route::post('/payment/form', 'balanceController@resultPay');

	Route::get('/mob/products', 'balanceController@mobProducts');

	//Турниры
	Route::get('/epic/turnir/{id}', 'turnirController@turnirs');
	Route::post('/get-clan-payers', 'turnirController@getClanPayers');
});

Route::post('/payment/status', 'balanceController@status');

