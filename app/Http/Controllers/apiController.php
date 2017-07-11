<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Mail;
use Auth;

class apiController extends Controller
{
    public function getBattleTag($battletag = null, $battletagNumber = null){

    	if($battletag != null || $battletag != '' && $battletagNumber != null || $battletagNumber != ''){

    		$mainBattleTagUser = $battletag.'#'.$battletagNumber;

    		$searchUser = User::where('user_battle_tag','=',$mainBattleTagUser)->first();

    		if(count($searchUser) > 0){

    			if($searchUser->email != null || $searchUser->email != ''){

    				$numberRundom = rand(1111,9999);

    				User::where('user_battle_tag','=',$mainBattleTagUser)->update([
    					'user_email_code'=>$numberRundom
    				]);

    				$userToEmail = $searchUser->email;

    				Mail::send('emails.api.code', ['code'=>$numberRundom], function($message) use ($userToEmail){
                        $message->subject('Код подтверждения');
					    $message->from('info@overwatch-clans.com', 'overwatch clans');
					    $message->to($userToEmail);
					});

	    			return response()->json([
	    				'mail'=>'На вашу почту был отпрален код, введите его'
	    			]);

    			}else{

	    			return response()->json([
	    				'notMail'=>'У данного пользователя нет email адреса. Добавьте email в настройках на overwatch-clans.com'
	    			]);

    			}


    		}else{

    			return response()->json([
    				'notFound'=>'BattleTag '.$mainBattleTagUser.' не найден'
    			]);

    		}

    	}else{

	    	return responce()->json([
	    		'error' => ''
	    	]);

    	}

    }

    public function getEmailCode($battletag = null, $battletagNumber = null, $code = null){

    	if($battletag != null && $battletagNumber != null && $code != null){

    		$mainBattleTagUser = $battletag.'#'.$battletagNumber;

    		$searchUser = User::where('user_battle_tag','=',$mainBattleTagUser)->first();

    		if($searchUser->user_email_code == $code){

    			return response()->json([
    				'success'=>$searchUser
    			]);

    		}else{

    			return response()->json([
    				'errorCode'=>'Введенный код не верный'
    			]);

    		}

    	}

    }

    public function getUserToken($token = null){

    	if($token != null){

    		$searchUser = User::where('user_api_token','=',$token)->first();

    		if(count($searchUser) > 0){
    			return response()->json([
    				'user'=>$searchUser
    			]);
    		}

    	}

    }

}
