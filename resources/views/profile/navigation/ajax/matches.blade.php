<h2>{{ $pageInfo->navigation_title }}</h2>
<hr>
<div class="filter-block">
	<div class="col-md-4">
		<p>Battletag</p>
		<div class="clear"></div>
		<input type="text" class="battletag-user" value="{{ Auth::user()->user_battle_tag }}">
	</div>
	<div class="col-md-4">
		<p>Сервер</p>
		<div class="clear"></div>
		<select class="user-server">
			<option value="eu">Европа</option>
			<!--<option value="kr">Корея</option>
			<option value="us">Северная Америка</option>-->
		</select>
	</div>
	<div class="col-md-4">
		<p>Платформа</p>
		<div class="clear"></div>
		<select class="user-platform">
			<option value="pc">Pc</option>
			<!--<option value="psn">PS4</option>
			<option value="xbl">XBox</option>-->
		</select>
	</div>
	<div class="col-md-12">
		<input type="submit" value="найти" class="user-button-search">
	</div>
</div>

<div class="clear"></div>

<div class="result-search">
	
</div>

<script>

let battleAvatar = '';
let battleRankAvatar = '';
	
$(document).off('click','.user-button-search').on('click','.user-button-search',function(){

	let battleTag = $(document).find('.battletag-user').val();
	battleTag = battleTag.replace('#', '-');

	let serverUser = $(document).find('.user-server').val();
	let platformUser = $(document).find('.user-platform').val();

	let urlServer = '';

	$('.result-search').html('<h2>Ищем...</h2>');

	if(serverUser == 'kr' || serverUser == 'us'){
		urlServer = serverUser;
	}else{
		urlServer = serverUser+'/';
	}

	$.ajax({
		url:'https://owapi.net/api/v3/u/'+battleTag+'/blob',
		type:'get',
		success:function(user){

			console.log(user);

			switch(serverUser){
				case 'eu' :

					let battleAvatar = user.eu.stats.competitive.overall_stats.avatar;
					let battleRankAvatar = user.eu.stats.competitive.overall_stats.rank_image;

					$(document).find('.result-search').html('<p>Ваш аватар</p><div class="clear"></div><img src="'+battleAvatar+'"><hr/><div class="clear"></div><p>ранг аватар</p><div class="clear"></div><img src="'+battleRankAvatar+'">');

				default :
					return false;
			}
		},
		error:function(err){
			console.log(err)
			$('.result-search').html('ошибка');
		}
	});

});

</script>