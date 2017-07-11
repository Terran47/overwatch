<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Russo+One" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="{{ asset('js/jquery.min.js') }}"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('css/confirmJqery.css') }}">
    <link rel="stylesheet" href="{{ asset('css/profile.css') }}">
    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
            'url'=>Session::get('url')
        ]) !!};
    </script>
</head>
<body>
    <div class="update-time-blick">
        <p>Загружаем Ваши данные! Пожалуйста ожидайте</p>
        <div class="load-animate">
            <div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div>
        </div>       
    </div>    
    <div class="header">
        <div class="col-md-2 col-sm-2">
            <div class="header-logo">
                <a href="/"></a>
            </div>
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="header-links">
                @foreach($headerNavs as $headerNav)
                    <a href="/{{ $headerNav->navigation_slug }}">{{ $headerNav->navigation_title }}</a>
                @endforeach
            </div>
        </div>
        <div class="col-md-6 col-sm-6">
            <div class="header-user-links">

                    @if(Auth::user()->update_info === true)
                        <p class="user-info-true">
                            <i class="fa fa-info-circle" aria-hidden="true"></i> Инфа обновлена
                        </p>
                    @else
                        <p class="update-user-info" style="color:#00A0E3;">
                            <i class="fa fa-refresh" aria-hidden="true"></i> Обновить Вашу инфу
                        </p>
                    @endif
                

                <div class="avatar-battletag" style="background:url('{{Auth::user()->user_battle_avatar}}');background-size: cover;"></div>
                <p>{{ Auth::user()->user_battle_tag }}</p>

                <p class="payment-button">{{Auth::user()->user_money}} <img src="/img/icons/1000.png" alt=""></p>
                <a href="/profile"><i class="fa fa-home" aria-hidden="true"></i></a>
                <a href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
            </div>
        </div>
    </div>

    <div class="clear"></div>

    <div class="main-content">
        <div class="col-md-2 col-sm-2">
            <div class="row">
                <div class="main-navigation-block">

                    @foreach($sidebarNavs as $sidebarNav)

                        <a data-link="sidebar" href="/{{ $sidebarNav->navigation_slug }}">
                            <div class="icon-link" style="background:url({{ $sidebarNav->navigation_img }}) no-repeat center;background-size:contain;"></div>
                            <div class="clear"></div>
                            <p>{{ $sidebarNav->navigation_title }}</p>
                        </a>

                    @endforeach

                </div>
            </div>
        </div>
        <div class="col-md-10 col-sm-10">
            <div class="row">
                <div class="main-content-update">

                    @yield('content')

                </div>
            </div>
        </div>
    </div>

    <div class="modal-block">
        <i class="fa fa-close button-close-modal"></i>
        <div class="modal-bloc-list">
            <h1></h1>
            <div class="clear"></div>
            <div class="result-block">
                
            </div>
        </div>
    </div>


    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('js/clan.js') }}"></script>
     <script src="{{ asset('js/rating.js') }}"></script>
    <script src="{{ asset('js/jquery-confirm.js') }}"></script>        
</body>
</html>