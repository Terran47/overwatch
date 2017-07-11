
<div id="ratingHeros">

	<?php $HeroNumber = 1; ?>
	
		<div id="heros-menu">
			<div class="col-md-4">
				<img src="{{$imgHero}}" alt="">				
			</div>
			<div class="col-md-8">
				<div class="col-md-10 col-md-offset-1">
					<div class="row">
						<p>Лучшие игроки на герое: <span>{{$selectedHero->hero_ru_name}}</span></p>
						<h2>Герои:</h2>
						<select name="" id="getHero">
							@foreach($selectHeroes as $selectHero)
								<option value="{{$selectHero->hero_name}}" selected>{{$selectHero->hero_ru_name}}</option>
							@endforeach															
						</select>
						<button>выбрать</button>
					</div>				
				</div>
			</div>
		</div>
		

	<table class="table ratingHeroes">	
		<thead>
			<tr>
				<td>№</td><td>ЗНАЧЕК</td><td>NICKNAME</td><td>Победы</td><td>Процент побед</td><td>Герой</td>
			</tr>
		</thead>	
		<tbody>
			@foreach($sortHeros as $sortHero)
				
				@foreach($users as $user)		
					@if($user->id === $sortHero['user_id'])
						@if($sortHero['rating_heroes'] != null )
							<?php $heroes = json_decode($sortHero['rating_heroes']); ?>
	
					       		@foreach($heroes->$yourHero as $hero)
					       			@if($hero != '')		       			
										<tr>
											<td><p>#{{ $HeroNumber++ }}</p></td>
											<td><img src="{{ $user->user_battle_avatar }}" alt=""></td>
											<td><p>{{ stristr($user->user_battle_tag, '#', true) }}</p></td>
												@if(preg_match("/%/i",$hero->win_rate))
													<td><p>{{$hero->wins}}</p></td>
										       		<td><p>{{$hero->win_rate}}</p></td>
												@else
													<td><p>нет игр</p></td>
										       		<td><p>нет игр</p></td>										
												@endif
								       		<td><p>{{$selectedHero->hero_ru_name}}</p></td>
									    </tr>
									@endif
					       		@endforeach	
				       							
						@endif					
					@endif
				@endforeach				
			@endforeach
		</tbody>
	</table>
	
	<div class="popup-user-block">
		<div class="popup-user-info">
		</div>
	</div>

</div>




