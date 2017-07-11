<?php $countGamers = 1; Session::put('clanId', $clan->id); ?>

<div class="my-clans-block" data-clan-id="{{ $clan->id }}">
	<div class="col-md-6">
		<div class="myClan-clan-info">
			<div class="col-md-5">
				<div class="row">
					<div class="myClan-left-ifoblock">

						<img src="{{$clan->clan_avatar}}" alt="">
						<div class="clan-badge-img">
							@if($clan->clan_rating >= 100000)
								<img src="/img/icons/grantmaster.png" alt="">
							@elseif($clan->clan_rating >= 30000 && $clan->clan_rating < 100000)
								<img src="/img/icons/diamond.png" alt="">
							@elseif($clan->clan_rating >= 20000 && $clan->clan_rating < 30000)
								<img src="/img/icons/platinum.png" alt="">
							@elseif($clan->clan_rating >= 10000 && $clan->clan_rating < 20000)
								<img src="/img/icons/gold.png" alt="">									
							@elseif($clan->clan_rating <= 10000 && $clan->clan_rating >= 5000)
								<img src="/img/icons/silver.png" alt="">
							@else
								<img src="/img/icons/bronze.png" alt="">
							@endif
						</div>
						
						<p><span>Рейтинг: </span> {{$clan->clan_rating}}</p>				
					</div>
				</div>	
			</div>
			<div class="col-md-7">

				<div class="myClan-right-ifoblock">
					<h2> {{$clan->clan_name}}</h2>
					<div class="clear"></div>
					<div class="info-text">
						<span>Глава: </span><p><i id="clanBoss"></i></p>
					</div>
					<div class="clear"></div>
					<div class="info-text">
						<span>Слоган: </span><p> {{ $clan->clan_slogan }}</p>
					</div>
					<div class="clear"></div>
					<div class="info-text">
						<span>Дата основания: </span><p> {{ $clan->created_at }}</p>	
					</div>
				
					<div class="clear"></div>					
				</div>
			</div>
			<div class="clear"></div>			
		</div>
			<div class="info-text-descript">
				<span>Описание: </span><p> {{ $clan->clan_description }}</p>
			</div>
		<button class="rules-info">Правила</button>

		<div class="count-gamers-block">Игроков: <span>{{ $clan->clan_Employed_seats }}</span> из <span>{{ $clan->clan_seats }}</span></div>

		<div class="apply-block">
			@if(Auth::user()->user_clan_status != true)
				@if($apply != [])
					<div class="filed">Заявка на рассмотрении</div>
				@else
					@if(count($checkApplyes) == 0)
						<button class="apply-now">Подать заявку</button>
					@else
						<div class="filed">Нельзя подать заявку больше одного раза</div>
					@endif
				@endif
			@else
				<div class="filed">Нельзя подать заявку пока вы в клане</div>
			@endif
		</div>		
		<table class="clan-table-gamers">
			@foreach($users as $user)
				@if($user->user_activ_clan_id === Auth::user()->user_activ_clan_id && $user->user_activ_clan_id === $clan->id)
					<script>
						$(document).find('.apply-block').html('<div class="filed">Вы состоите в этом клане</div>');		
					</script>
				@endif
				@if($clan->clan_user_id === $user->id)
					<script>
						$(document).find('#clanBoss').text('{{ stristr($user->user_battle_tag, "#", true) }}');
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
		{{ $users->render() }}

	
	</div>
	<div class="col-md-6">
		@if($clan->clan_widget != '')
			<iframe src="https://discordapp.com/widget?id={{$clan->clan_widget}}&theme=dark" width="350" height="500" allowtransparency="true" frameborder="0"></iframe>
		@endif
		
	</div>

	<div class="rulies-popup-block">
		<i class="fa fa-window-close" aria-hidden="true"></i>
		<p>{{ $clan->clan_rules }}</p>
	</div>

	<div class="popup-user-block">
		<div class="popup-user-info">
		</div>
	</div>

	





