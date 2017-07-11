<?php $countApply = 1; $countInvite = 1; ?>

<div id="myApplyes-block">
		@if(count($myApplys) > 0)
			<div class="col-md-12">
				<h3>Моя заявка в клан</h3>
				<table class="table table-clan-Applyes">
					<thead>
						<tr>
							<td>№</td>
							<td>Клан лого</td>
							<td>Название клана</td>
							<td>Дата заявки</td>
							<td>Статус заявки</td>
							<td>Удалить</td>
						</tr>
					</thead>
					<tbody>
						@foreach($myApplys as $myApply)
							@foreach($clans as $clan)
								@if($myApply->clan_id === $clan->id)
									<tr class="apply-event">
										<td>{{$countApply++}}</td>
										<td><img src="{{$clan->clan_avatar}}" alt=""></td>
										<td>{{$clan->clan_name}}</td>
										<td>{{$myApply->created_at}}</td>
										<td>{!! $myApply->apply_status !!}</td>
										<td style="display: flex; justify-content: center; align-items: center;">
											<div class="apply-refuse" data-refuse-id="{{Auth::user()->id}}" data-refuse-clan="{{$clan->id}}">
												<i class="fa fa-trash-o" aria-hidden="true"></i>
											</div>
										</td>
									</tr>
								@endif
							@endforeach
						@endforeach
					</tbody>
				</table>
			</div>
			<div class="col-md-12">
				<h3>Приглашения в клан</h3>
				<table class="table table-clan-invite">
					<thead>
						<tr>
							<td>№</td>
							<td>Клан лого</td>
							<td>Название клана</td>
							<td>Дата приглашения</td>
							<td>Принять</td>
							<td>Удалить</td>
						</tr>
					</thead>
					<tbody>
						@foreach($myApplys as $myApply)
							@foreach($clans as $clan)
								@if($myApply->clan_id === $clan->id)
									<tr class="invite-event">
										<td>{{$countInvite++}}</td>
										<td><img src="{{$clan->clan_avatar}}" alt=""></td>
										<td>{{$clan->clan_name}}</td>
										<td>{{$myApply->created_at}}</td>
										<td><button><i class="fa fa-plus-square" aria-hidden="true"></i></button></td>
										<td>
											<button class="apply-refuse" style="background: #9e201d;" data-refuse-id="{{Auth::user()->id}}" data-refuse-clan="{{$clan->id}}">
												<i class="fa fa-trash-o" aria-hidden="true"></i>
											</button>
										</td>
									</tr>
								@endif
							@endforeach
						@endforeach		
					</tbody>
				</table>						
			</div>
		@else
			<div class="col-md-12"><h2>У Вас нет заявок</h2></div>
		@endif	
</div>

