	<div class="edit-clan-block">
		<?php $countGamers = 1; $countApply = 1; ?>
		<div class="col-md-6">
			<h2>Настройки клана </h2>

			<table class="table editClan-table">
				<tr>
					<td id="editAvatar"><img src="{{$clan->clan_avatar}}" alt=""></td>
					<td>
						<label for="">Изменить лого: </label>
						<input class="imgLogo" type="file">
					</td>
				</tr>
				<tr>
					<td><label for="">Название: </label></td>
					<td>{{$clan->clan_name}}</td>
				</tr>
				<tr>
					<td><label>Слоган: </label></td>
					<td><input type="text" id="clanSlogan" value="{{$clan->clan_slogan}}"></td>
				</tr>
				<tr>
					<td>
						<label>
							Для общения в клане Вам нужно добавить виджет Discord в клан,
							для этого создайте сервер на https://discordapp.com
							после вставте id сервера:
						</label>
					</td>
					<td><input type="text" placeholder="ID Discord" id="clanWidget" value="{{$clan->clan_widget}}"></td>

				</tr>							
				<tr>
					<td><label>Дата основания: </label></td>
					<td>{{$clan->created_at}}</td>
				</tr>
				<tr>
					<td colspan="2"><label>Описание:</label><br><textarea id="clanDescription" cols="30" rows="6">{{$clan->clan_description}}</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><label>Правила клана:</label><br><textarea id="clanRules" cols="30" rows="6">{{$clan->clan_rules}}</textarea></td>
				</tr>										
			</table>

			<button class="save-edit-clan">Сохранить</button>

			<label>Количество мест в клене:</label>
			<select name="" id="">
				<option value="">5</option>    
				<option value="">10</option>
				<option value="">15</option>
				<option value="">20</option>
				<option value="">25</option>
				<option value="">30</option>
			</select>
			<button class="up-seats">Увеличить</button>

			<div class="apply-block">
				@if(Auth::user()->user_activ_clan_id == $clan->id)
					
					<div class="filed">Вы состоите в этом клане</div>

				@else 
					<button class="join-clan">Вступить в этот клан</button>

				@endif	
			</div>		

		<div class="count-gamers-block">Игроков: <span id="seats">{{ $clan->clan_Employed_seats }}</span> из <span>{{ $clan->clan_seats }}</span></div>	
		<table class="clan-table-gamers">
			<tbody>
				@foreach($users as $user)
					<tr>
						<td>{{$countGamers++}}</td>
						<td><img src="{{$user->user_battle_avatar}}" alt=""></td>
						<td><p>{{ stristr($user->user_battle_tag, '#', true) }}</p></td>
						<td><p><i class="fa fa-info-circle" data-batle-tag="{{$user->user_battle_tag}}" aria-hidden="true"></i></p></td>
						<td><i class="fa fa-user-times" aria-hidden="true"></i></td>
					</tr>
				@endforeach					
			</tbody>		
		</table>
			 {{ $users->render() }}
		</div>
		<div class="col-md-6">
			@if(count($clanApplys) > 0)
				<h2>Заявки в клан</h2>
				<table class="table table-clan-Applyes">
					<thead>
						<tr>
							<td>№</td>
							<td>ЗНАЧЕК</td>
							<td>БАТЛТЕГ</td>
							<td>Рейтинг</td>
							<td>Дата заявки</td>
							<td>РЕШЕНИЕ</td>
						</tr>
					</thead>
					<tbody>
						@foreach($clanApplys as $clanApply)
							@foreach($allusers as $alluser)
								@if($clanApply->user_id === $alluser->id  && $clanApply->apply_answer === false)
									<tr class="apply-event">
										<td>{{$countApply++}}</td>
										<td><img src="{{$alluser->user_battle_avatar}}" alt=""></td>
										<td>{{$alluser->user_battle_tag}}</td>
										<td>{{$alluser->user_battle_rating}}</td>
										<td>{{$clanApply->created_at}}</td>
										<td style="display: flex; justify-content: center; align-items: center;">
											<div class="apply-add" data-add-id="{{$clanApply->user_id}}">
												<i class="fa fa-plus" aria-hidden="true"></i>
											</div>
											<div class="apply-refuse" data-refuse-id="{{$clanApply->user_id}}">
												<i class="fa fa-minus" aria-hidden="true"></i>
											</div>	
										</td>
									</tr>
								@endif
							@endforeach
						@endforeach		
					</tbody>
				</table>

			@else
				<h2>Заявок в клан нет</h2>
			@endif			
		</div>
	</div>
	<div class="popup-user-block">
		<div class="popup-user-info">
		</div>
	</div>

<script>
	$(document).off('click', '.join-clan').on('click', '.join-clan', function(){
		

		$.confirm({
			title: 'Если вступите в этот клан, Вы покинете ваш нынешний клан!',
			animation: 'RotateY',
    		closeAnimation: 'RotateY',
		    buttons: {
		        Вступить: function(){
		    		$.ajax({
		    			'url':'/join-clan',
						'type':'post',
						'data':{
							_token: window.Laravel.csrfToken,
						},
						success:function(data){
							$(document).find('.apply-block').html(data);
							let seats = $(document).find('#seats').text();

							let resultSeats = (+seats)+1;
							
							$(document).find('#seats').text(resultSeats);

							$(document).find('.clan-table-gamers tbody').append('<tr><td>'+"{{$countGamers++}}"+'</td><td><img src="'+"{{Auth::user()->user_battle_avatar}}"+'" alt=""></td><td><p>'+"{{ stristr(Auth::user()->user_battle_tag, '#', true) }}"+'</p></td><td><p><i class="fa fa-info-circle" data-batle-tag="'+"{{Auth::user()->user_battle_tag}}"+'" aria-hidden="true"></i></p></td></tr>');

							$.alert(data);
						},
						error:function(error){
							$(document).find('.apply-block').html(error);
							$.alert(error);
						}
					});
					
		        },
		        somethingElse: {
		            text: 'Передумал!',
		            btnClass: 'btn-green'
		        }
		    }
		});	
	});
</script>