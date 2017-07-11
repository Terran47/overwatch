	<div class="all-clans-block">
		@foreach($joinClans as $joinClan)
			@if($joinClan->clan_Employed_seats != $joinClan->clan_seats)
				<div class="col-md-4">
					<div class="get-my-clans" @if($joinClan->clan_vip_status === true) style="background:#fff url({{$joinClan->clan_avatar}}) right no-repeat; background-size: contain;" @endif>
						<div class="col-md-3 col-xs-4">
							<div class="row">
								<div class="clan-left-colum">
									<img src="{{$joinClan->clan_avatar}}" alt="">
									@if($joinClan->clan_rating >= 100000)
										<img src="/img/icons/grantmaster.png" alt="">
									@elseif($joinClan->clan_rating >= 30000 && $joinClan->clan_rating < 100000)
										<img src="/img/icons/diamond.png" alt="">
									@elseif($joinClan->clan_rating >= 20000 && $joinClan->clan_rating < 30000)
										<img src="/img/icons/platinum.png" alt="">
									@elseif($joinClan->clan_rating >= 10000 && $joinClan->clan_rating < 20000)
										<img src="/img/icons/gold.png" alt="">									
									@elseif($joinClan->clan_rating <= 10000 && $joinClan->clan_rating >= 5000)
										<img src="/img/icons/silver.png" alt="">
									@else
										<img src="/img/icons/bronze.png" alt="">
									@endif
									<p>Рейт: {{$joinClan->clan_rating}}</p>								
								</div>								
							</div>
						</div>
						<div class="col-md-9 col-xs-8">
							<div class="row">
								<div class="clan-right-colum">
									<h3>{{$joinClan->clan_name}}</h3>
									<p>{{ $joinClan->clan_slogan }}</p>
										@if($joinClan->id === Auth::user()->user_activ_clan_id)
											<i class="fa fa-star" aria-hidden="true"></i>
										@endif								
									<div class="gamers-count">Игроков: <span>{{ $joinClan->clan_Employed_seats }}</span> из <span>{{ $joinClan->clan_seats }}</span></div>
								</div>								
							</div>
						</div>
					</div>
						<a href="/clan/{{$joinClan->clan_name}}/{{$joinClan->id}}"><button>Подробней</button></a>
				</div>
			@endif	
		@endforeach
		{{ $joinClans->render() }}
	</div>	