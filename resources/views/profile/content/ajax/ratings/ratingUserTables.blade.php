	<?php $userNumber = 1; ?>
	<table class="table ratingUsers">
		<thead>
			<tr>
				<td>№</td><td>ЗНАЧЕК</td><td>NICKNAME</td><td>КЛАН-ЛОГО</td><td>НАЗВАНИЕ КЛАНА</td><td>ИНФО</td>
			</tr>
		</thead>	
		<tbody>
			@foreach($users as $user)
				<tr>
					<td><p>{{ $userNumber++ }}</p></td>
					<td><img src="{{$user->user_battle_avatar}}" alt=""></td>
					<td><p>{{ stristr($user->user_battle_tag, '#', true) }}</p></td>
					@if($user->user_clan_status === true)
			
						@foreach($clans as $clan)
							
							@if($user->user_activ_clan_id === $clan->id)
								<td><img src="{{$clan->clan_avatar}}" alt=""></td>
								<td id="infoClan" data-clan-name="{{ $clan->clan_name }}"  data-clan-ava="{{$clan->clan_avatar}}"><p>{{ $clan->clan_name }}</p></td>
							@endif
						@endforeach
					@else
						<td></td>
						<td><p><button data-invite-id="{{$user->id}}">ПРИГЛАСИТЬ В КЛАН</button></p></td>
					@endif
					<td><i class="fa fa-info-circle" data-batle-tag="{{$user->user_battle_tag}}"  aria-hidden="true"></i></td>
				</tr>				
			@endforeach
		</tbody>
	</table>
	{{ $users->render() }}

	<div class="popup-user-block">
		<div class="popup-user-info">
		</div>
	</div>
	

