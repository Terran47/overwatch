	<div class="admin-clans-block">
		@if(count($myAdminClans)>0)
			@foreach($myAdminClans as $myAdminClan)
				<div class="col-md-4">

					<div class="get-my-clans">
						<div class="col-md-3">
							<div class="row">
								<div class="clan-left-colum">
									<img src="{{$myAdminClan->clan_avatar}}" alt="">
									@if($myAdminClan->clan_rating >= 100000)
										<img src="/img/icons/grantmaster.png" alt="">
									@elseif($myAdminClan->clan_rating >= 30000 && $myAdminClan->clan_rating < 100000)
										<img src="/img/icons/diamond.png" alt="">
									@elseif($myAdminClan->clan_rating >= 20000 && $myAdminClan->clan_rating < 30000)
										<img src="/img/icons/platinum.png" alt="">
									@elseif($myAdminClan->clan_rating >= 10000 && $myAdminClan->clan_rating < 20000)
										<img src="/img/icons/gold.png" alt="">									
									@elseif($myAdminClan->clan_rating <= 10000 && $myAdminClan->clan_rating >= 5000)
										<img src="/img/icons/silver.png" alt="">
									@else
										<img src="/img/icons/bronze.png" alt="">
									@endif
									<p>Рейт: {{$myAdminClan->clan_rating}}</p>								
								</div>								
							</div>
						</div>
						<div class="col-md-9">
							<div class="row">
								<div class="clan-right-colum">
									<h3>{{$myAdminClan->clan_name}}</h3>

									<p>{{ $myAdminClan->clan_slogan }}</p>
									@if($myAdminClan->id === Auth::user()->user_activ_clan_id)
										<i class="fa fa-star" aria-hidden="true"></i>
									@endif
									
									<div class="gamers-count">
										<div class="col-md-12">
											<div class="row">
												Игроков: <span>{{ $myAdminClan->clan_Employed_seats }}</span> из <span>{{ $myAdminClan->clan_seats }}</span>
												<div class="count-apply">
													Заявок в клан: <span>{{ $myAdminClan->clan_count_apply }}</span>
												</div>
											</div>
										</div>									
									</div>
								</div>								
							</div>
						</div>
					</div>
					<button data-clan-id="{{$myAdminClan->id}}" style="font-family: 'Russo One', sans-serif;">Редактировать</button>
				</div>
			@endforeach
		@else
			<h2>У Вас нет кланов под управлением</h2>
		@endif
	</div>