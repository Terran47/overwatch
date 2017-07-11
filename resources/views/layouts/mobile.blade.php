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
    <link rel="stylesheet" href="{{ asset('css/mobProducs.css') }}">
</head>
<body>

    @yield('content')
       
</body>
</html>