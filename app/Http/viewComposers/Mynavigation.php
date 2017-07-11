<?php
namespace App\Http\viewComposers;

use Illuminate\Contracts\View\View;
use Auth;
use App\navigation;

class Mynavigation {

    /**
     * Bind data to the view.
     *
     * @param  View  $view
     * @return void
     */
    public function compose(View $view)
    {   
        if(Auth::check()){
            $headerNavs = navigation::where([['navigation_status','=',true],['navigation_setting','=',1]])->orderBy('navigation_order','asc')->get();
            $sidebarNavs = navigation::where([['navigation_status','=',true],['navigation_setting','=',2]])->orderBy('navigation_order','asc')->get();
            return $view->with(compact('headerNavs','sidebarNavs'));
        }
    }
}