	<table class="clan-payers-table">
		<thead>
			<tr>
				<th>Батлтег</th>
				<th>Учавствует</th>
				<th>Нет</th>
			</tr>
		</thead>
		<tbody>

			@foreach($clanPlayers as $clanPlayer)

				<tr>
					<td style="border-bottom: 2px solid #777;">{{ stristr($clanPlayer->user_battle_tag, '#', true) }}</td>
					<td class="clan-play"><i class="fa fa-check" aria-hidden="true"></i></td>
					<td class="clan-noplay clan-noplay-active"><i class="fa fa-times" aria-hidden="true"></i></td>										
				</tr>	

			@endforeach																		
		</tbody>
	</table>

	<div class="turnir-totol-block">
		<table>
			<thead>
				<tr>
					<th>Участников</th>
					<th>Сумма</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="totalPlayers">0</td>
					<td id="totalSumm">0</td>
				</tr>
			</tbody>
		</table>
		<button>Подать заявку</button>
	</div>


