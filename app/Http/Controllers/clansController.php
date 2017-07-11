<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use App\Clans;
use App\User;
use Auth;
use Redirect;
use File;
use App\Apply;
class clansController extends Controller{



    public function getClans($clanPage = null){
        //навигация на стр клана

        $userId = Auth::user()->id;
        if($clanPage == 'allClans'){

            $allClans = Clans::orderBy('clan_seats', 'desc')->paginate(9);
            return view('profile.content.ajax.clans.allClans', ['allClans'=>$allClans]);  

        }else if($clanPage == 'joinClans'){

            $joinClans = Clans::where('clan_recruitment','=',true)->orderBy('clan_seats', 'desc')->paginate(9);

            return view('profile.content.ajax.clans.joinClans', ['joinClans'=>$joinClans]);    

        }else if($clanPage == 'сlanGamer'){

            $ClanGamer = Auth::user();
            
            $clanID = $ClanGamer->user_activ_clan_id;
            
            $myClan = Clans::where('id','=',$clanID)->first();

            if(count($myClan) >0){
                Session::put('clanId', $clanID);
                $users = User::where([['user_activ_clan_id','=',$clanID],['user_clan_status','=',true]])->get();
                return view('profile.content.ajax.clans.myClan', ['myClan'=>$myClan,'users'=>$users]);
            }else{
                return view('profile.content.ajax.clans.myClan', ['myClan'=>$myClan]);
            }
            
        }else if($clanPage == 'clansAdmin'){
           
            $myAdminClans = Clans::where('clan_user_id','=',$userId)->orderBy('clan_seats', 'desc')->paginate(9);
            return view('profile.content.ajax.clans.myAdminClans', ['myAdminClans'=>$myAdminClans]);

        }else if($clanPage == 'myApplyes'){
        	$myApplys = Apply::where('user_id',Auth::user()->id)->paginate(20);
            $clans = Clans::all();
        	return view('profile.content.ajax.clans.myApplyes', ['myApplys'=>$myApplys,'clans'=>$clans]);
        }else{
            return 'Страницы не существует!';
        } 
    }

    public function clanInfo(Request $request, $name, $id){
        //Подробная информация клана

        if(count($id) > 0){
            $clan = Clans::where('id','=',$id)->first();
            $users = User::where([['user_activ_clan_id','=',$id],['user_clan_status','=',true]])->paginate(20);
            $applyCheck = Apply::where([['user_id','=',Auth::user()->id],['clan_id','=',$id]])->first();
            $checkApplyes = Apply::where('user_id',Auth::user()->id)->first();
            if(count($applyCheck) > 0){
                $apply = $applyCheck;
            }else{ 
                $apply = [];
            }
            return view('profile.navigation.clanInfo', ['clan'=>$clan,'users'=>$users, 'apply'=>$apply, 'checkApplyes'=>$checkApplyes]);            
        }else{
            return 'ОШИБКА! попробуйте обновить сайт';
        }

    }

    public function createClan(Request $request){

        //Добавление нового клана
        $clanName = $request->input('clanName');
        $clanSlogan = $request->input('clanSlogan');
        $clanDescription = $request->input('clanDescription');
        $clanLogo = $request->input('logo');
        $user = Auth::user();

        if($clanLogo != '' && $clanName != ''){
            $checkName = Clans::where('clan_name',$clanName)->first();
            if(count($checkName)==0){
                Clans::firstOrCreate([
                    'clan_name'=>$clanName,
                    'clan_slogan'=>$clanSlogan,
                    'clan_description'=>$clanDescription,
                    'clan_avatar'=>$clanLogo,
                    'clan_user_id'=>$user->id
                ]);
                return response()->json([
                    'success'=>'Клан успешно создан.',
                    'checkName'=>false
                ]);          
            }else{
                return response()->json([
                    'checkName'=>true
                ]);
            }
        }else{

            return response()->json([
                'error'=>'Заполните все поля'
            ]);

        }  

    }

    public function applyNow(Request $request){
    	
        //заявка в клан
        $clanId = Session::get('clanId');
        $userId = Auth::user()->id;
        Apply::firstOrCreate([
            'user_id'=>$userId,
            'clan_id'=>$clanId
        ]);

        Clans::where('id',$clanId)->increment('clan_count_apply');

        return 'Заявка успешно подана!'; 
    }

    public function editClan(Request $request){

        $clanId = $request->input('clanId');

        if(count($clanId) > 0){

            Session::put('clanId', $clanId);
            Session::put('url', '/join-clan');

            $clanApplys = Apply::where('clan_id',$clanId)->get();
            $allusers = User::all();

            $clan = Clans::where('id','=',$clanId)->first();

            $users = User::where([['user_clan_status','=',true],['user_activ_clan_id','=',$clanId]])->orderBy('user_battle_rating', 'desc')->paginate(20);

            $applyCheck = Apply::where([['user_id','=',Auth::user()->id],['clan_id','=',$clanId]])->first();

            if(count($applyCheck) > 0){
                $apply = $applyCheck;
            }else{
                $apply = [];
            }

            return view('profile.content.ajax.clans.editClan', ['clan'=>$clan, 'users'=>$users, 'apply'=>$apply,'clanApplys'=>$clanApplys, 'allusers' => $allusers]); 
        }         
    }

    public function uploadImgClan(Request $request){

        $image = $request->file('logo');

        $userinfo = Auth::user();

        if($request->hasFile('logo')){


            $imageName = $image->getClientOriginalName();

            $path = public_path('img') . '/ClanLogos/' . $userinfo->id;

            if(!File::exists($path)){

                File::makeDirectory($path, 0777, true);

                $image->move($path, $imageName);

                return response()->json([
                    'image'=>'/img/ClanLogos/' . $userinfo->id . '/' .$imageName,
                ]);

            }else{

                $image->move($path, $imageName);

                return response()->json([
                    'image'=>'/img/ClanLogos/' . $userinfo->id . '/' .$imageName,
                    'nameimage'=>$imageName
                ]);

            }

        }else{

            return response()->json([
                'error'=>'Ошибка, попробуйте еще раз'
            ]);

        }  
    }

    public function joinClan(){

        $clanId = Session::get('clanId');
        $user = Auth::user();
        $newClan = Clans::where('id',$clanId)->first();

        if($newClan->clan_Employed_seats != $newClan->clan_seats){

            $checkApply = Apply::where('user_id',$user->id)->first();

            if(count($checkApply) > 0){
                Clans::where('id',$checkApply->clan_id)->decrement('clan_count_apply',1);
                Apply::where('user_id',$user->id)->delete();
            }

            if($user->user_clan_status === true ){
                Clans::where('id',$user->user_activ_clan_id)->decrement('clan_Employed_seats',1);
                Clans::where('id',$user->user_activ_clan_id)->decrement('clan_rating',$user->user_battle_rating);                
            }

	        $joinClan = User::where('id','=',$user->id)->update([
	            'user_activ_clan_id'=>$clanId,
	            'user_clan_status'=>true
	        ]);

	        Clans::where('id',$clanId)->increment('clan_Employed_seats',1);
	        Clans::where('id',$clanId)->increment('clan_rating',$user->user_battle_rating);

	        if($joinClan > 0){
	            return 'Вы успешно вступили в клан';
	        }else{
	            return 'Ошибка попробуйте обносить страницу';
	        } 	        
        }else{
        	return 'В данном клане нет свободных мест';
        }
    }

    public function acceptGamer(Request $request){
        $clanId = Session::get('clanId');
        $userId = $request->input('id');
        $chekUser = User::where('id',$userId)->first();
        if($chekUser->user_clan_status === false){
            User::where('id',$userId)->update([
                'user_clan_status'=>true,
                'user_activ_clan_id'=>$clanId
            ]);
            Apply::where([['user_id',$userId],['clan_id',$clanId]])->delete();
            Clans::where('id',$clanId)->decrement('clan_count_apply',1);

            Clans::where('id',$clanId)->increment('clan_Employed_seats',1);
            Clans::where('id',$clanId)->increment('clan_rating',$chekUser->user_battle_rating);

            return "Игрок успешно добавлен в клан";
        }else{
            return "Ошибка";
        }
    }

    public function saveEdit(Request $request){    

        $clanID = Session::get('clanId');

        $imageLogo = $request->input('logo');
        $clanSlogan = $request->input('clanSlogan');
        $clanWidget = $request->input('clanWidget');
        $clanDescription = $request->input('clanDescription');
        $clanRules = $request->input('clanRules');

        if($imageLogo != null){

            Clans::where('id',$clanID)->update([
                'clan_avatar'=>$imageLogo,
                'clan_slogan'=>$clanSlogan,
                'clan_description'=>$clanDescription,
                'clan_widget'=>$clanWidget,
                'clan_rules'=>$clanRules,
            ]);

            return response()->json([
                'success'=>'Ваши изменения сохранены!',
                'imgsrc'=>$imageLogo
            ]);                        

        }else{
           
            Clans::where('id',$clanID)->update([
                'clan_slogan'=>$clanSlogan,
                'clan_description'=>$clanDescription,
                'clan_widget'=>$clanWidget,
                'clan_rules'=>$clanRules,
            ]);
            return response()->json([
                'success'=>'Ваши изменения сохранены!',
            ]);
        }          
    }

    public function logoutClan(Request $request){

        $clanId = Session::get('clanId');
        $user = Auth::user();

        Clans::where('id',$user->user_activ_clan_id)->decrement('clan_Employed_seats',1);
        Clans::where('id',$user->user_activ_clan_id)->decrement('clan_rating',$user->user_battle_rating);

        $userUpdate = User::where([['id','=',$user->id],['user_activ_clan_id','=',$clanId],['user_clan_status','=',true]])->update([
            'user_clan_status'=>false,
            'user_activ_clan_id'=>0
        ]);



        if($userUpdate){
            return 'Вы не состоите в клане';
        }else{
            return 'ошибка попробуйте обновить страницу!';
        }
                  
    }

    public function refuseGamer(Request $request){
        $clanIdRefuse = $request->input('clanRefuse');

        if($clanIdRefuse != ''){
            $clanId = $clanIdRefuse;
            
            $userId = $request->input('idRefuse');
     
            $chekUser = User::where('id',$userId)->first();
            if($chekUser->user_clan_status === false){

                $applyAnswer = Apply::where([['user_id',$userId],['clan_id',$clanId]])->first()->apply_answer;

                if($applyAnswer === false){
                    Clans::where('id',$clanId)->decrement('clan_count_apply',1);  
                }

                Apply::where([['user_id',$userId],['clan_id',$clanId]])->delete();

                return response()->json([
                    'success'=>'Заявка удалена!',
                    'delete'=>'удалена',
                ]);
            }else{
                return response()->json([
                    'error'=>'Ошибка!',
                ]);
            }             
        }else{
            $clanId = Session::get('clanId');

            $userId = $request->input('idRefuse');
     
            $chekUser = User::where('id',$userId)->first();
            if($chekUser->user_clan_status === false){

                Apply::where([['user_id',$userId],['clan_id',$clanId]])->update([
                    'apply_status'=>'<span style="color:red">Отказано</span>',
                    'apply_answer'=>true
                ]);
                Clans::where('id',$clanId)->decrement('clan_count_apply',1);
                return response()->json([
                    'success'=>'Игроку отказано!',
                    'refuse'=>'отказано'
                ]);
            }else{
                return response()->json([
                    'error'=>'Ошибка!',
                ]);
            }            
        }
        
       
    }

}