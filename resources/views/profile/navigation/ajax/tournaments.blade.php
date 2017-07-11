@extends('layouts.profile')

@section('content')


<style>
	.get-tornirs{
		display: table;
		width: 100%;
	}
	.participate-block{
		border-radius: 0 0 20px 20px;
		background-color: #F9B109;
		text-align: center;
		font-size: 20px;
		color: #fff;
		padding: 5px;
		font-weight: bold;
		cursor: pointer;
		transition: all .5s;
	}
	.participate-block:hover{
		background-color: #00A0E3;
		transition: all .5s;
	}
	.tornir-left-colum img{
		width: 80%;
		display: table;
		margin: 5px auto;
	}
	.tornir-left-colum{
		background: url('../img/bg-black.jpg');
		background-size: cover;
		display: flex;
		flex-direction: column;
		
		width: 100%;
		justify-content: center;
		align-items: center;
		color: #fff;
		padding: 10px 5px;
	}
	.tornir-button{
		padding: 10px 20px;
		background-color: #00A0E3;
		color: #fff;
		border: none;
		border-radius: 10px;
		margin: 10px 0;
		font-size: 20px;
		font-weight: bold;
	}
	.tornir-activ{
		background-color: #F9B109;
	}


</style>
<div class="tornirs-block">
	<div class="col-md-12">

		<h2>{{ $pageInfo->navigation_title }}</h2>
		<button class="tornir-button tornir-activ">Текущие</button>
		<button class="tornir-button">Прошедшие</button>
		<button class="tornir-button">Мой турнир</button>
	</div>
	@foreach($navData as $navDat)

		<div class="col-md-6">
			<div class="get-tornirs">
				<div class="col-md-3 col-xs-4">
					<div class="row">
						<div class="tornir-left-colum">
							<img src="{{$navDat->turnir_avatar}}" alt="">
		
							<p>Организатор: {{$navDat->turnir_autor}}</p>								
						</div>								
					</div>
				</div>
				<div class="col-md-6 col-xs-8">
					<div class="tornir-right-colum">
						<h3>{{$navDat->turnir_title}}</h3>
						<p>{{$navDat->turnir_description}}</p>							
						<p>Призовой фонд: <span>{{$navDat->turnir_prize_money}} рублей</span></p>
					</div>								
				</div>			
			</div>
			<div class="participate-block">
				<a href="/epic/turnir/{{$navDat->id}}">Учавствовать</a>
			</div>
		</div>
	@endforeach
</div>


@endsection
