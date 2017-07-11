
@extends('layouts.profile')
<link rel="stylesheet" href="{{ asset('css/ratings.css') }}">
@section('content')
		<div class="rating-navigation">
			<div class="col-md-4">
				<div class="clans-rating" data-clans-rating="clansrating">
					<p><i class="fa fa-users" aria-hidden="true"></i>Кланы</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="users-rating" data-users-rating="usersrating">
					<p><i class="fa fa-user" aria-hidden="true"></i>Игроки</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="heros-rating" data-heros-rating="herosrating">
					<p><i class="fa fa-user" aria-hidden="true"></i>Герои</p>
				</div>
			</div>						
		</div>

		<div class="col-md-12">
			<div class="order-block">
				<input type="text" placeholder="Поиск">
				<button>Искать</button>
			</div>
		</div>
		<div class="col-md-12">
			<div id="ratingTables"></div>
		</div>		
	</div>

@endsection

