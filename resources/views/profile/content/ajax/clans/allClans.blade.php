	<div class="all-clans-block">
		@foreach($allClans as $allClan)
			<div class="col-md-4">
				<div class="get-my-clans" @if($allClan->clan_vip_status === true) style="background:#fff url({{$allClan->clan_avatar}}) right no-repeat; background-size: contain;" @endif>
					<div class="col-md-3 col-xs-4">
						<div class="row">
							<div class="clan-left-colum">
								<img src="{{$allClan->clan_avatar}}" alt="">
								@if($allClan->clan_rating >= 100000)
									<img src="/img/icons/grantmaster.png" alt="">
								@elseif($allClan->clan_rating >= 30000 && $allClan->clan_rating < 100000)
									<img src="/img/icons/diamond.png" alt="">
								@elseif($allClan->clan_rating >= 20000 && $allClan->clan_rating < 30000)
									<img src="/img/icons/platinum.png" alt="">
								@elseif($allClan->clan_rating >= 10000 && $allClan->clan_rating < 20000)
									<img src="/img/icons/gold.png" alt="">									
								@elseif($allClan->clan_rating <= 10000 && $allClan->clan_rating >= 5000)
									<img src="/img/icons/silver.png" alt="">
								@else
									<img src="/img/icons/bronze.png" alt="">
								@endif
								<p>Рейт: {{$allClan->clan_rating}}</p>								
							</div>								
						</div>
					</div>
					<div class="col-md-9 col-xs-8">
						<div class="row">
							<div class="clan-right-colum">
								<h3>{{$allClan->clan_name}}</h3>
								<p>{{ $allClan->clan_slogan }}</p>
									@if($allClan->id === Auth::user()->user_activ_clan_id)
										<i class="fa fa-star" aria-hidden="true"></i>
									@endif								
								<div class="gamers-count">Игроков: <span>{{ $allClan->clan_Employed_seats }}</span> из <span>{{ $allClan->clan_seats }}</span></div>
							</div>								
						</div>
					</div>
				</div>
				@if($allClan->clan_recruitment != false && $allClan->clan_Employed_seats != $allClan->clan_seats)
					<a href="/clan/{{$allClan->clan_name}}/{{$allClan->id}}"><button>Подробней</button></a>
				@elseif($allClan->clan_Employed_seats == $allClan->clan_seats)
					<a href="/clan/{{$allClan->clan_name}}/{{$allClan->id}}"><div class="info-clan-close"><i class="fa fa-info-circle" aria-hidden="true"></i> Мест нет</div></a>
				@else
					<div class="info-clan-close">Доступ закрыт</div>
				@endif
			</div>
					
		@endforeach
		{{ $allClans->render() }}
	</div>	
