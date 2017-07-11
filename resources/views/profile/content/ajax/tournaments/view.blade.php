@extends('layouts.profile')

@section('content')
<style>

	.tornir-button{
	    padding: 3px 20px;
	    background-color: #00A0E3;
	    color: #fff;
	    border: none;
	    border-radius: 5px;
	    margin: 10px 0;
	    font-size: 15px;
	    font-weight: bold;

	}
	.tornirs-block h2,h3{
		font-family: 'Russo One', sans-serif;
	}
	.get-tornir{
		display: table;
		width: 100%;
	}
	.get-tornir p{
		background: #fff;
		display: table;
		padding: 0 5px;
		border-radius: 5px;
	}
	.mask-block{
		width: 100%;
		display: table;
		background: rgba(255, 255, 255, 0.4);
	}
	.clan-payers-table td{
		text-align: center;
		padding: 5px 10px;
	}
	.clan-payers-table th{
		text-align: center;
		padding: 5px 10px;
	}
	.playr-activ{
		background: #4abd4a;
	    color: #fff;
	    border-radius: 7px;
	    cursor: pointer;
	}
	.clan-play{
		cursor: pointer;
	}
	.clan-noplay{
		cursor: pointer;
	}
	.clan-noplay-active{
		background: #d44646;
	    color: #fff;
	    border-radius: 7px;
	    cursor: pointer;
	}
	.turnir-totol-block{
		margin-top: 20px;
		text-align: center;
		color: #fff;
		font-size: 18px;
	}
	.turnir-totol-block thead th{
		padding: 5px 10px;
		background: #323232;
		border: 1px solid #fff;
	}

	.turnir-totol-block thead th:last-child{
		border-right: none;
	}
	.turnir-totol-block tbody td{
		background: #dbbf3a;
		border: 1px solid #fff;
	}
	.clan-payers-table tbody td{
		border: 2px solid #fff;
	}
	.clan-payers-table{
		margin-top: 15px;
	}
	.clan-payers-table thead th{
		border-top: 2px solid #777;
		border-right: 2px solid #777;	
	}
	.clan-payers-table thead th:last-child{
		border-right: none;
	}
	.turnir-my-clans button{
		padding: 5px 10px;
		border: none;
		border-radius: 5px;
		background: #00a0e3;
		color: #fff;
		font-size: 16px;
		transition: all .5s;
	}
	.turnir-my-clans button:hover{
		background: #f9b109;
		transition: all .5s;
	}
	.turnir-totol-block button{
		background: #777;
	}
</style>
<div class="tornirs-block">
	<div class="col-md-12">
		<h2>Турнир</h2>
		<a href="/tournaments"><button class="tornir-button">Назад</button></a>
	</div>
	<div class="col-md-12">
		<div class="get-tornir" style="background: url({{$Tournament->turnir_avatar}}) right no-repeat; background-size: contain;">
			<div class="mask-block">
				<h3>{{$Tournament->turnir_title}}</h3>
				<div class="col-md-4">
					<div class="row">
						<p>Призовой фонд: <br> {{$Tournament->turnir_prize_money}}</p>
						<p>Организатор: <br> {{$Tournament->turnir_autor}}</p>
						<p>Дата турнира: <br> {{$Tournament->turnir_data}}</p>
					</div>
				</div>
				<div class="col-md-8">
					<div class="row">
						<p>{!!$Tournament->turnir_description!!}</p>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="turnir-my-clans">
							@if(count($MyClans) > 0)
								<h4>Выбор вашего клана:</h4>
								@foreach($MyClans as $MyClan)
									<button data-clan-id="{{$MyClan->id}}">{{$MyClan->clan_name}}</button>
								@endforeach	
							@endif		
						</div>

						<div class="clan-payers"></div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
	<script>
		$(document).on('click', '.turnir-my-clans button', function(){
			let id = $(this).attr('data-clan-id');
			$.ajax({
				url:'/get-clan-payers',
				type:'post',
				data:{
					'_token': window.Laravel.csrfToken,
					'id':id
				},
				success(data){
					$('.clan-payers').html(data);

				}
			});
		});

		let totalPlayers = 0;
		let totalSumm = 150;
		$(document).on('click', '.clan-play', function(){
			$(this).addClass('playr-activ');
			$(this).parent().find('.clan-noplay').removeClass('clan-noplay-active');
			totalPlayers = $(document).find('.playr-activ').length;
			$('#totalPlayers').html(totalPlayers);
			$('#totalSumm').html(totalPlayers*totalSumm);
		});

		$(document).on('click', '.clan-noplay', function(){
			$(this).addClass('clan-noplay-active');
			$(this).parent().find('.playr-activ').removeClass('playr-activ');
			totalPlayers = $(document).find('.playr-activ').length;
			$('#totalPlayers').html(totalPlayers);
			$('#totalSumm').html(totalPlayers*totalSumm);
		});

	</script>

@endsection
