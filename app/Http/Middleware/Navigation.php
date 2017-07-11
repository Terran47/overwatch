<?php

namespace App\Http\Middleware;

use Closure;
use App;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Config;
use App\navigation;
class Mynavigation
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(){

       
        $this->headerNav = navigation::where([['navigation_status','=',true],['navigation_setting','=',1]])->orderBy('navigation_order','asc')->get();
        $this->sidebarNav = navigation::where([['navigation_status','=',true],['navigation_setting','=',2]])->orderBy('navigation_order','asc')->get();
       
    }
}