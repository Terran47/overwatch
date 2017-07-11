		let ratingTable = '';
		//Рейтинг игроков
		$(document).on('click', '.users-rating', function(){
			$(document).find('.order-block').css({'display':'flex'});
			$(document).find('#ratingTables').html('<div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div>');	

			ratingTable = $(this).attr('data-users-rating');

			$.ajax({
				'url':'/rating-table',
				'type':'post',
				'data':{
					'_token': window.Laravel.csrfToken,
					'ratingTable':ratingTable
				},
				success(rangTable){
					$(document).find('#ratingTables').html(rangTable);
				}
			});
		});
		//Рейтинг кланов
		$(document).on('click', '.clans-rating', function(){
			$(document).find('.order-block').css({'display':'flex'});
			$(document).find('#ratingTables').html('<div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div>');			
			ratingTable = $(this).attr('data-clans-rating');
			$.ajax({
				'url':'/rating-table',
				'type':'post',
				'data':{
					'_token': window.Laravel.csrfToken,
					'ratingTable':ratingTable					
				},
				success(rangTable){
					$(document).find('#ratingTables').html(rangTable);
				}
			});
		});
		//Рейтинг твоего героея
		$(document).on('click', '.heros-rating', function(){
			$(document).find('.order-block').css({'display':'none'});

			$(document).find('#ratingTables').html('<div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div>');			
			ratingTable = $(this).attr('data-heros-rating');
			$.ajax({
				'url':'/rating-table',
				'type':'post',
				'data':{
					'_token': window.Laravel.csrfToken,
					'ratingTable':ratingTable					
				},
				success(rangTable){					
					$(document).find('#ratingTables').html(rangTable);				
				},
				error:function(error){
					$(document).find('#ratingTables').html(error);
				}			
			});				
		});	
		//выбор рейтинга героя
		$(document).on('click', '#heros-menu button', function(){
			let yourHero = $(document).find('#getHero').val();
			
			$(document).find('#ratingTables').html('<div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div>');
			$.ajax({
				'url': '/rating-table',
				'type':'post',
				'data':{
					'_token': window.Laravel.csrfToken,
					'hero':yourHero,
					'ratingTable':ratingTable
				},
				success:function(data){
					$(document).find('#ratingTables').html(data);
				},
				error:function(error){
					$(document).find('#ratingTables').html(error);
				}
			});
		});	

		$(document).on('click', '.order-block button', function(){
			let token = window.Laravel.csrfToken;
			let page = ratingTable;
			let wordSearch = $(document).find('.order-block input').val();
			let url = '/get-search';
			search(token, page, wordSearch, url);
		});

		function search(token, page, wordSearch, url){
			if(wordSearch.length >0){
				$.ajax({
					'url':url,
					'type':'post',
					'data':{
						'_token':token,
						'page':page,
						'wordSearch':wordSearch
					},
					success:function(search){

						$(document).find('.modal-block').addClass('modal-block-opened');

						if(search.resUser != null || search.resUser != undefined || search.resUser != ''){

							let searchLength = search.resUser.length;
							let y = 0;
							let u = 0;
							let clanName = '';

							$(document).find('.result-block').html('<ul></ul>');

							$(document).find('.modal-block h1').html('Данные поиска: '+wordSearch);

							for(y; y < searchLength; y++){

								if(search.resUser[y].user_clan_status === true){

									for(u; u < search.clans.length; u++){
										//console.log('clan: '+search.clans[u].id+', user: '+search.resUser[y].user_activ_clan_id);
										if(search.clans[u].id === search.resUser[y].user_activ_clan_id){
											
											clanName = search.clans[u].clan_name;

										}
									}

								}else{
									clanName = 'Нет';
								}
								
								$(document).find('.result-block ul').append('<li>batleteg: '+search.resUser[y].user_battle_tag.split('#')[0]+', id: '+search.resUser[y].id+'<div class="clear"></div>clan: '+clanName+'</li>');

							}

						}else{

							$(document).find('.modal-block h1').html('Ничего не найдено');

						}


					}
				});
			}else{
				alert('НЕТУ')
			}
		}
		//Подробна инфа о игроке
		$(document).on('click', '.ratingUsers tbody .fa-info-circle', function(){
			$(document).find('.popup-user-block').css({
				'display':'table'
			});

			$(document).find('.popup-user-info').html('<div class="col-md-2"></div><div class="col-md-10"><div class="ajax-loader"><div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div></div></div>');

			let battleTag = $(this).attr('data-batle-tag');
			let clanName = $(this).parent().parent().find('#infoClan').attr('data-clan-name');
			let clanAva = $(this).parent().parent().find('#infoClan').attr('data-clan-ava');
		    battleTag = battleTag.replace('#', '-');
		    $.ajax({
		    	url:'https://overwatch-clans.com:8081/api/user-rating/'+battleTag,
		    	type:'get',
		    	dataType:'json',
		    	success:function(userInfo){
		    		battleTag = battleTag.replace('-', '#');
		    		$('.popup-user-info').html(
		    			'<div class="col-md-2"></div><div class="col-md-10">'+
							'<table class="table">'+
				    			'<thead>'+
				    				'<tr>'+
				    					'<td></td>'+
				    					'<td>Информация об игроке<div class="closse-user-info"><i class="fa fa-times" aria-hidden="true"></i></div></td>'+
				    				'</tr>'+
				    			'</thead>'+
				    			'<tbody>'+
					    			'<tr>'+
					    				'<td><img src="'+userInfo.avatar+'" alt="" /></td>'+
					    				'<td><p>'+battleTag+'</p></td>'+
					    			'</tr>'+
					    			'<tr>'+
					    				'<td><img src="'+clanAva+'" alt="" /></td>'+
					    				'<td><p>'+clanName+'</p></td>'+
					    			'</tr>'+
					    			'<tr>'+
					    				'<td><img src="'+userInfo.competitiveRank+'" alt="" /></td>'+
					    				'<td><p>'+userInfo.competitiveRankNumber+'</p></td>'+
					    			'</tr>'+			    					    			
				    			'</tbody></table>'+
		    			'</div>');
		    	},
		    	error:function(error){
		    		console.log(error);
		    		$(document).find('.popup-user-block').css({
						'display':'none'
					});
		    	}
		    });
		});

		$(document).on('click', '.closse-user-info', function(){
			$(document).find('.popup-user-info').html();
			$(document).find('.popup-user-block').css({
				'display':'none'
			});		
		});

		$(document).on('click', '.pagination a', function(event){
			event.preventDefault();
			let urlPage = $(this).attr('href');
			$.ajax({
				url:urlPage,
				type:'post',
				data:{
					'_token': window.Laravel.csrfToken,
					'ratingTable':ratingTable
				},
				success: function(data){
					$(document).find('#ratingTables').html(data);
				}
			});
		});

		$(document).on('click', '.ratingUsers button', function(){
			let id = (this).attr('data-invite-id');
			$.ajax({
				url:'/invite-user',
				type:'post',
				data:{
					'_token':window.Laravel.csrfToken,
					'id':id
				},
				success:function(data){
					
				},
				error:function(error){
					console.log(error);
				}
			});
		});		
	