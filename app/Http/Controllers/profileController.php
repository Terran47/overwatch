<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Auth;
use Redirect;
use App\navigation;
use App\posts;
use App\User;
use App\Heroes;
use App\Tournament;
class profileController extends Controller
{
    public function profile(){

    	return view('profile.index');
    }

    public function logout(){

    	Auth::logout();

    	return Redirect::to('/');

    }

    public function getPage($getPage = null){

    	if($getPage != null || $getPage != ''){

    		$searchLink = navigation::where([['navigation_status','=',true],['navigation_slug','=',$getPage]])->first();
            $posts = [];
            $navData = [];
            //dd($searchLink->navigation_slug);

    		if(count($searchLink) > 0){

	            switch ($searchLink->navigation_slug) {
	            	case 'tournaments':
	            		$navData = Tournament::all();
	            		break;
	            	
	            	default: 
	            		$navData = [];
	            		break;
	            }

                $posts = posts::where('post_setting','=',$searchLink->navigation_slug)->paginate(5);

    			return view('profile.navigation.ajax.'.$searchLink->navigation_slug, ['pageInfo'=>$searchLink, 'posts'=>$posts, 'navData'=>$navData]);

    		}else{

	    		return '<h5>Страницы не найдено</h5>';

    		}

    	}else{

    		return '<h5>Страницы не найдено</h5>';

    	}

    }


}
