@extends('layouts.home')

@section('content')

<link rel="stylesheet" href="{{ asset('css/music-player.css') }}">

<div class="contant-block">

    <div class="contant-block-bg">
        <div id="container" class="container">

            <div id="output" class="container"></div>  

            <div class="contant-block-description">
               
                <a href="/"><img src="{{ asset('img/overwatch-logo.png') }}" alt="logo"></a>
                <p>Добро пожаловать на OVERWATCH-CLANs.COM</p>
                <div class="login">
                    <button class="user"><a href="/battle-net">Войти</a></button>     
                </div>

                <div class="main-music-player">

                	<div class="main-music-player-play">
                		<i class="fa fa-pause" data-play="true" aria-hidden="true"></i>
                	</div>

                	<div class="main-music-player-volume">
                		<i class="fa fa-minus volume-minus" aria-hidden="true"></i>
                		<i class="fa fa-volume-down volume-icon" aria-hidden="true"></i>
                		<i class="fa fa-plus volume-plus" aria-hidden="true"></i>
                		<i class="fa fa-random music-random" aria-hidden="true"></i>
                	</div>

                </div>

            </div>

        </div>
        <div id="controls" class="controls"></div>
        <div id="canvascontainer">
            <canvas id="buffer"></canvas>
            <canvas id="canvas"></canvas>
        </div> 
    </div>  

</div>

<script>
	
	function randomInteger(min, max) {
	  var rand = min + Math.random() * (max - min)
	  rand = Math.round(rand);
	  return rand;
	}

	let volumeMusic = 0.3;
	let stapVolume = 0.1;
	let minVolue = 0.0;
	let maxVolume = 1.0;
	let tracksCount = 5;
	let playTrack = randomInteger(1,5);

	let music = new Audio('{{ asset("music") }}/'+playTrack+'.mp3');
	music.loop = true;
	music.play();
	music.volume = volumeMusic;


	$('.music-random').on('click', function(){

		playTrack++;

		let dataPlay = $('.main-music-player-play').find('i').attr('data-play');

		if(dataPlay == 'false'){

			$('.main-music-player-play').find('i').attr('data-play','true');
			$('.main-music-player-play').find('i').removeClass('fa-play').addClass('fa-pause');

		}

		if(playTrack >= tracksCount+1){

			playTrack = 1;

			music.pause();
			music.currentTime = 0;
			music.src = '{{ asset("music") }}/'+playTrack+'.mp3';
			music.play();

		}else{

			music.pause();
			music.currentTime = 0;
			music.src = '{{ asset("music") }}/'+playTrack+'.mp3';
			music.play();

		}


	});

	$('.volume-plus').on('click', function(){
		volumeMusic += stapVolume;

		if(volumeMusic <= maxVolume){

			music.volume = volumeMusic;

			if(volumeMusic > 0.0 && volumeMusic < 0.1){
				$('.volume-icon').removeClass('fa-volume-up fa-volume-down').addClass('fa-volume-off');
			}else if(volumeMusic > 0.1 && volumeMusic < 0.5){
				$('.volume-icon').removeClass('fa-volume-up fa-volume-off').addClass('fa-volume-down');
			}else if(volumeMusic > 0.6 && volumeMusic < 1.0){
				$('.volume-icon').removeClass('fa-volume-down fa-volume-off').addClass('fa-volume-up');
			}

		}else{
			volumeMusic = maxVolume;
		}

	});

	$('.volume-minus').on('click', function(){
		volumeMusic -= stapVolume;

		if(volumeMusic >= minVolue){

			music.volume = volumeMusic;

			console.log(volumeMusic)

			if(volumeMusic > 0.0 && volumeMusic < 0.1){
				$('.volume-icon').removeClass('fa-volume-up fa-volume-down').addClass('fa-volume-off');
			}else if(volumeMusic > 0.1 && volumeMusic < 0.5){
				$('.volume-icon').removeClass('fa-volume-up fa-volume-off').addClass('fa-volume-down');
			}else if(volumeMusic > 0.6 && volumeMusic < 1.0){
				$('.volume-icon').removeClass('fa-volume-down fa-volume-off').addClass('fa-volume-up');
			}

		}else{
			volumeMusic = minVolue;
		}

	});

	$('.main-music-player-play').on('click', function(){

		let that = this;

		let dataPlay = $(that).find('i').attr('data-play');

		if(dataPlay == 'true'){

			$(that).find('i').attr('data-play','false');
			$(that).find('i').removeClass('fa-pause').addClass('fa-play');
			music.pause();

		}else{

			$(that).find('i').attr('data-play','true');
			$(that).find('i').removeClass('fa-play').addClass('fa-pause');
			music.play();

		}

	});

</script>


@endsection
