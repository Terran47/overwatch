<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use App\User;
use Auth;
use Redirect;
use App\Tournament;
use App\Clans;
class turnirController extends Controller
{

    public function turnirs($id){
        $Tournament = Tournament::where('id',$id)->first();
        $UserId = Auth::user()->id;
        $MyClans = Clans::where('clan_user_id',$UserId)->get();
        return view('profile.content.ajax.tournaments.view', ['Tournament'=>$Tournament, 'MyClans'=>$MyClans]);
    }

    public function getClanPayers(Request $request){
    	$ClanID = $request->input('id');
    	$clanPlayers = User::where('user_activ_clan_id',$ClanID)->get();
    	return view('profile.content.ajax.tournaments.targetClan', ['clanPlayers'=>$clanPlayers]);
    }

}


