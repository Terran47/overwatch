<?php $countGamers = 1; ?>

@if($myClan != null)
<div class="my-clans-block" data-clan-id="{{ $myClan->id }}">
	<div class="col-md-6">
		<div class="myClan-clan-info">
			<div class="logout-clan">
				<i class="fa fa-grav" aria-hidden="true"></i>
				<span>Покинуть</span>
			</div>
			<div class="col-md-5">
				<div class="row">
					<div class="myClan-left-ifoblock">

						<img src="{{$myClan->clan_avatar}}" alt="">
						<div class="clan-badge-img">
							@if($myClan->clan_rating >= 100000)
								<img src="/img/icons/grantmaster.png" alt="">
							@elseif($myClan->clan_rating >= 30000 && $myClan->clan_rating < 100000)
								<img src="/img/icons/diamond.png" alt="">
							@elseif($myClan->clan_rating >= 20000 && $myClan->clan_rating < 30000)
								<img src="/img/icons/platinum.png" alt="">
							@elseif($myClan->clan_rating >= 10000 && $myClan->clan_rating < 20000)
								<img src="/img/icons/gold.png" alt="">									
							@elseif($myClan->clan_rating <= 10000 && $myClan->clan_rating >= 5000)
								<img src="/img/icons/silver.png" alt="">
							@else
								<img src="/img/icons/bronze.png" alt="">
							@endif
						</div>
						
						<p><span>Рейтинг: </span> {{$myClan->clan_rating}}</p>				
					</div>
				</div>	
			</div>
			<div class="col-md-7">

				<div class="myClan-right-ifoblock">
					<h2> {{$myClan->clan_name}}</h2>
					<div class="clear"></div>
					<div class="info-text">
						<span>Глава: </span><p><i id="clanBoss"></i></p>
					</div>
					<div class="clear"></div>
					<div class="info-text">
						<span>Слоган: </span><p> {{ $myClan->clan_slogan }}</p>
					</div>
					<div class="clear"></div>
					<div class="info-text">
						<span>Дата основания: </span><p> {{ $myClan->created_at }}</p>	
					</div>
				
					<div class="clear"></div>					
				</div>
			</div>
			<div class="clear"></div>			
		</div>

		<div class="info-text-descript">
			<span>Описание: </span><p> {{ $myClan->clan_description }}</p>
		</div>

		<button class="rules-info">Правила</button>

		<div class="count-gamers-block">Игроков: <span>{{ $myClan->clan_Employed_seats }}</span> из <span>{{ $myClan->clan_seats }}</span></div>
		<table class="clan-table-gamers">
			@foreach($users as $user)
				@if($myClan->clan_user_id === $user->id)
					<script>
						$(document).find('#clanBoss').text(' {{ stristr($user->user_battle_tag, "#", true) }}');
					</script>
				@endif
				<tr>
					<td>{{$countGamers++}}</td>
					<td><img src="{{$user->user_battle_avatar}}" alt=""></td>
					<td><p>{{ stristr($user->user_battle_tag, '#', true) }}</p></td>
					<td><p><i class="fa fa-info-circle" data-batle-tag="{{$user->user_battle_tag}}" aria-hidden="true"></i></p></td>
				</tr>
			@endforeach			
		</table>
	</div>
	<div class="col-md-6">
		@if($myClan->clan_widget != '')
			<iframe src="https://discordapp.com/widget?id={{$myClan->clan_widget}}&theme=dark" width="350" height="500" allowtransparency="true" frameborder="0"></iframe>
		@endif
		
	</div>

	
	<div class="rulies-popup-block">
		<i class="fa fa-window-close" aria-hidden="true"></i>
		<p>{{ $myClan->clan_rules }}</p>
	</div>		
	
	<div class="popup-user-block">
		<div class="popup-user-info">
		</div>
	</div>
</div>

@else
	<div class="col-md-12"><h2>Вы не состоите в клане.</h2></div>
@endif		

