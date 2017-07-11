<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Socialite;
use Session;
use App\User;
use App\referal_user;
use App\RatingHero;
use Auth;
use Redirect;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;

class userAuthController extends Controller
{

    public function battleNetRedirect(){

    	if(Auth::guest()){

        	Session::put('bnet.region', 'ue');

        	return Socialite::with('battlenet')->redirect();

    	}else{

    		return Redirect::to('/profile');

    	}

    }

    public function battlenetUser(Request $request){

        $user = Socialite::driver('battlenet')->user();
        
        if($user){

        	$searchUser = User::where('user_battle_id','=',$user->id)->first();

        	if(count($searchUser) > 0){
                Auth::loginUsingId($searchUser->id, true);

                User::where('id','=',Auth::user()->id)->update([
                    'user_battle_tag'=>$user->nickname
                ]);                

                $BatleTag = str_replace("#","-",$user->nickname);
                
                $client = new \GuzzleHttp\Client(array( 'curl' => array( CURLOPT_SSL_VERIFYPEER => false, ) )); 
                
                $res = new \GuzzleHttp\Psr7\Request('GET', 'https://overwatch-clans.com:8081/api/'.$BatleTag);

                $promise = $client->sendAsync($res)->then(function ($response) {
                   
                    $userData = json_decode($response->getBody(), true);
                    
                    $JsonDatas =json_encode($userData['heroes']);

                    $userId = Auth::user()->id;

                    $yourHero = $userData['your_hero'];
                    $bestKills = $userData['bestKills'];
                    $bestDamage = $userData['bestDamage'];
                    $countRating = $userData['competitiveRankNumber'];

                    $avatar = $userData['avatar'];

                    User::where('id','=',$userId)->update([
                        'user_battle_rating'=>$countRating,
                        'user_battle_avatar'=>$avatar
                    ]);

                    RatingHero::where('user_id','=',$userId)->update([
                        'rating_heroes'=>$JsonDatas,
                        'best_damage'=>$bestDamage,
                        'best_kills'=>$bestKills,
                        'your_hero'=>$yourHero
                    ]);               

                });

                $promise->wait();

        		return Redirect::to('/profile');

        	}else{

                $refCode = Session('ref_code');

                $refGenerate = str_random(5);

        		$createUser = User::firstOrCreate([
        			'user_battle_id'=>$user->id,
        			'user_battle_tag'=>$user->nickname,
        			'user_battle_token'=>$user->token,
                    'user_referal_code'=>$refGenerate
        		]);

                if($createUser){

                    $userID = User::where('user_battle_id','=',$user->id)->first()->id;

                    RatingHero::firstOrCreate([
                        'user_id'=>$userID
                    ]);

                    if($refCode != null || $refCode != ''){

                        $searchRefUser = User::where('user_referal_code','=',$refCode)->first();

                        if(count($searchRefUser) > 0){
                            referal_user::create([
                                'reg_user_id'=>$createUser->id,
                                'ref_user_id'=>$searchRefUser->id
                            ]);
                        }

                    }

                }
                
        		Auth::loginUsingId($createUser->id, true);
        		return Redirect::to('/profile');
        	}
        }else{

            return Redirect::to('/')->with(['error'=>'Ошибка авторизации']); 
        }
    }


    public function register(){
        return Redirect::to('/');
    }

    public function login(){
        return Redirect::to('/');
    }

    public function refCode($code = null){

        if($code != null){

            $searchUser = User::where('user_referal_code','=',$code)->first();

            if(count($searchUser) > 0){

                Session::put('ref_code',$code);

                return Redirect::to('/');

            }else{

                return Redirect::to('/');

            }

        }else{

            return Redirect::to('/');

        }

    }

}


