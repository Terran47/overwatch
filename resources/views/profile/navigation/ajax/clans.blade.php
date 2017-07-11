@extends('layouts.profile')
<link rel="stylesheet" href="{{ asset('css/clan.css') }}">
@section('content')
	<div class="col-md-12 col-lg-12">
		<h2 class="title-clan">Кланы <span class="add-clan"><i class="fa fa-plus-square" aria-hidden="true"></i> Создать</span></h2>
		<nav>
			<ul class="clan-navigation">
				<li class="clan-page active-clan-page" data-clan-page="allClans"><i class="fa fa-th" aria-hidden="true"></i> Все</li><li class="clan-page" data-clan-page="joinClans"><i class="fa fa-bullhorn" aria-hidden="true"></i> Вступить</li><li class="clan-page" data-clan-page="clansAdmin"><i class="fa fa-pied-piper-alt" aria-hidden="true"></i> Администрирование</li><li class="clan-page" data-clan-page="сlanGamer"><i class="fa fa-renren" aria-hidden="true"></i> Активный клан</li><li class="clan-page" data-clan-page="myApplyes"><i class="fa fa-handshake-o" aria-hidden="true"></i> Заявки</li>
			</ul>
		</nav>		
	</div>
<div class="col-md-12 col-lg-12" style="max-width: 1300px;">
	<div class="row">
		<div id="clansContent">
			<div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div>
		</div>			
	</div>

</div>

<script>
	$.ajax({
		'url': '/get-clans/allClans',
		'type': 'post',
		'data':{
			'_token': window.Laravel.csrfToken
		},
		success:function(clansPage){
			$(document).find('#clansContent').html(clansPage);
		},
		error:function(error){
			$(document).find('#clansContent').html(error);
		}
	});
</script>

@endsection

