<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Socialite;
use Session;
use App\User;
use App\Clans;
use App\Heroes;
use App\RatingHero;
use Auth;
use Redirect;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;

class ratingController extends Controller{

    public function ratingTable(Request $request){

        $ratingTable = $request->input('ratingTable');

        if($ratingTable == 'usersrating'){

            Session::put('url','search-user');
            $users = User::where('user_server','=','eu')->orderBy('user_battle_rating', 'desc')->paginate(20);
            $clans = Clans::all();

            return view('profile.content.ajax.ratings.ratingUserTables', ['users'=>$users,'clans'=>$clans]);
        }else if($ratingTable == 'clansrating'){
            Session::put('url','search-clan');
            $clans = Clans::orderBy('clan_rating', 'desc')->paginate(20);
           
            return view('profile.content.ajax.ratings.ratingClanTables', ['clans'=>$clans]);
        }else if($ratingTable == 'herosrating'){
               
            $yourHero = $request->input('hero');
            $selectHeroes = Heroes::all();
            $users = User::all();
            $allheros = RatingHero::all();
            $heroes = json_decode($allheros, true);
           

            if($yourHero){
                $selectedHero = Heroes::where('hero_name','=',$yourHero)->first();
                       
                $sortHeros = collect($heroes)->sortByDesc(function ($hero, $key) use ($yourHero){

                    $decode = json_decode($hero['rating_heroes'], true);
                    
                    if(count($decode[$yourHero]) > 0 && count($decode[$yourHero][0])>1 && count($decode[$yourHero][0]['win_rate'])>0){
                        return [$decode[$yourHero][0]['wins'], $decode[$yourHero][0]['win_rate']];
                    }

                })->all(); 

                $imgHero = $selectedHero->hero_poster;
            }else if($yourHero == '' || $yourHero == null){
                
                $yourHero = RatingHero::where('user_id',Auth::user()->id)->first()->your_hero;

                $selectedHero = Heroes::where('hero_name','=',$yourHero)->first();

                $sortHeros = collect($heroes)->sortByDesc(function ($hero, $key) use ($yourHero){   
                    $decode = json_decode($hero['rating_heroes'], true);
                    if(count($decode[$yourHero]) > 0 && count($decode[$yourHero][0])>1 && count($decode[$yourHero][0]['win_rate'])>0){
                        return [$decode[$yourHero][0]['wins'], $decode[$yourHero][0]['win_rate']];
                    }
                })->all(); 

                $imgHero = $selectedHero->hero_poster;                                 
            }else{
                return "ОШИБКА: Попробуйте обносить страницу!";
            }              
                return view('profile.content.ajax.ratings.ratingHeros', ['users'=>$users, 'sortHeros'=>$sortHeros, 'selectHeroes'=>$selectHeroes, 'yourHero'=>$yourHero, 'imgHero'=>$imgHero, 'selectedHero'=>$selectedHero]);
        }else{

            return "error";
        }
    }

    public function getsearch(Request $request){
        $page = $request->input('page');
        $wordSearch = $request->input('wordSearch');
        
        if($page == 'usersrating'){

            $usersId = [];

            $resUsers = User::where('user_battle_tag', "LIKE","%$wordSearch%")->get();

            foreach($resUsers as $user){
                $usersId[] = $user->user_activ_clan_id;
            }

            $clans = Clans::whereIn('id',$usersId)->get();

            return response()->json([
                'resUser'=>$resUsers,
                'clans'=>$clans
            ]);

        }else if($page === 'clansrating'){

            echo "string";
        }
    }

    public function updUserInfo(){

        $user =Auth::user();
       
        if($user != Auth::guest()){       
            /*User::where('id','=',Auth::user()->id)->update([
                'user_battle_tag'=>'Excelsior-2181'
            ]);*/              

            $BatleTag = str_replace("#","-",$user->user_battle_tag);
            
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
                    'user_battle_avatar'=>$avatar,
                    'update_info'=>true
                ]);

                RatingHero::where('user_id',$userId)->update([
                    'rating_heroes'=>$JsonDatas,
                    'best_damage'=>$bestDamage,
                    'best_kills'=>$bestKills,
                    'your_hero'=>$yourHero
                ]);               

            });

            $promise->wait();

            return 'ok';  
        }else{
            return 'Ошибка! попробуйте позже';
        } 
    }

    public function inviteUser(Request $request){
        $userID = $request->input('id');

        
    }
}
