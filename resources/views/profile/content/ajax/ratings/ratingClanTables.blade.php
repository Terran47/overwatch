	<?php $clanNumber = 1; ?>
	<table class="table ratingClans">
		<thead>
			<tr>
				<td>№</td><td>ЛОГОТИП</td><td>НАЗВАНИЕ</td><td>РЕЙТИНГ</td><td>АДМИН</td><td>ИНФО</td>
			</tr>
		</thead>	
		<tbody>
		@foreach($clans as $clan)
			<tr>
				<td><p>{{ $clanNumber++ }}</p></td>
				<td><img src="{{$clan->clan_avatar}}" alt=""></td>
				<td><p>{{ $clan->clan_name }}</p></td>
				<td><p>{{ $clan->clan_rating }}</p></td>
				<td><p>{{ stristr($clan->clan_battle_teg, '#', true) }}</p></td>
				<td><i class="fa fa-info-circle" data-batle-tag="{{$clan->clan_battle_teg}}" aria-hidden="true"></i></td>
			</tr>				
		@endforeach
		</tbody>
	</table>
	{{ $clans->render() }}
	<div class="popup-user-block">
		<div class="popup-user-info">
		</div>
	</div>