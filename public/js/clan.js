$(document).ready(function(){

	let clanPage = 'allClans';

	//Навигация по кланам
	$(document).on('click', '.clan-navigation li', function(){
		$(document).find('.add-clan').css({'display':'inline'});

		$(document).find('#clansContent').html('<div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div>');

		clanPage = $(this).attr('data-clan-page');
		$(document).find('.clan-page').removeClass('active-clan-page');
		$(this).addClass('active-clan-page');

		$.ajax({
			'url': '/get-clans/'+clanPage,
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
	});

	//Подробно инфа
	$(document).on('click', '#clansContent a', function(e){
		$(document).find('.clan-page').removeClass('active-clan-page');
		$(document).find('.add-clan').css({'display':'inline'});
		e.preventDefault();
		let links = $(this).attr('href');
		$.ajax({
			url:links,
			type: 'get',
			data:{
				'_token': window.Laravel.csrfToken
			},
			success:function(infoClan){
				$(document).find('#clansContent').html(infoClan);
			}
		});
	});

	$(document).on('click', '.add-clan', function(){
		$(document).find('.clan-page').removeClass('active-clan-page');
		$(document).find('.add-clan').css({'display':'none'});
		$.ajax({
			'url':'/addClan',
			'type':'get',
			'data':{
				'_token': window.Laravel.csrfToken
			},
			success:function(addClan){
				$(document).find('#clansContent').html(addClan);
			}						
		});
	});
	//Подача заявки в клан
	$(document).on('click', '.apply-now', function(){
		$(document).find('.apply-block').html('<div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div>');
		$.ajax({
			url: '/apply-now',
			type: 'post',
			data: {
				'_token': window.Laravel.csrfToken
			},
			success:function(data){
				$(document).find('.apply-block').html('<div class="filed">'+data+'</div>');
			},
			error:function(error){
				$(document).find('.apply-block').html('<div class="filed">'+error+'</div>');
			}
		});
	});

	let ClanInfo = {
		'logo':'',
		'clanName':'',
		'clanSlogan':'',
		'clanDescription':'',
		'_token': window.Laravel.csrfToken
	};

	//Добавление нового клана
	let imageFiles = new FormData();
	
	$(document).off('change', '#clanLogo').on('change', '#clanLogo', function(){

	    let imageFile = this.files[0];

	    let photoSize = Math.round(imageFile.size / 1024);

	    if(photoSize < 1000){

	    	imageFiles.append('logo', imageFile);
			imageFiles.append('_token', window.Laravel.csrfToken);

			$.ajax({
				'url':'/upload-img-clan',
				'type':'post',
				'processData': false,
				'contentType': false,			
				'data':imageFiles,
				success:function(data){
					if(data.image != undefined && data.image != ''){
						ClanInfo.logo = data.image;
						$.alert(data.image);
					}
				}
			});
	    }else{

	    	$.alert('Логотип должен весить не больше 1000kb');
	    }	  	 
	});		

	$(document).on('click', '.add-clan-description button', function(){
		let clanName = $(document).find('#clanName').val();
		let clanSlogan = $(document).find('#clanSlogan').val();
		let clanDescription = $(document).find('.add-clan-description textarea').val();

		ClanInfo.clanName = clanName;
		ClanInfo.clanSlogan = clanSlogan;
		ClanInfo.clanDescription = clanDescription;

		$.ajax({
			'url':'/create-clan',
			'type':'post',
			'data':ClanInfo,
			success:function(data){

				if(data.error != undefined && data.error != ''){
					$.alert(data.error);
				}else if(data.checkName == false && data.success != undefined && data.success != ''){
					$.alert(data.success);
					$.ajax({
						'url': '/get-clans/clansAdmin',
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
				}else if(data.checkName == true){
					$.alert('Клан с таким названием уже существует!');
				}else{
					$.alert('Попробуйте обновить страницу');
				}
			}
		});
	});

	//Редактирование клана
	$(document).on('click', '.admin-clans-block button', function(){
		$(document).find('.clan-page').removeClass('active-clan-page');
		let clanID = $(this).attr('data-clan-id');
		$(document).find('#clansContent').html('<div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div>');		
		$.ajax({
			url:'/edit-clan',
			type:'post',
			data:{
				'_token': window.Laravel.csrfToken,
				'clanId':clanID
			},
			success:function(data){
				$(document).find('#clansContent').html(data);
			},
			error:function(error){
				$(document).find('#clansContent').html(error);
			}
		});
	});



	let ClanEdit = {
		'logo':'',
		'clanName':'',
		'clanSlogan':'',
		'clanDescription':'',
		'clanRules':'',
		'clanWidget':'',
		'_token': window.Laravel.csrfToken
	};

	//Изменения клана
	let editAvaFiles = new FormData();
	$(document).on('change', '.imgLogo', function(){
		
	    let editAvaFile = this.files[0];

	    photoSize = Math.round(editAvaFile.size / 1024);

	    if(photoSize < 1000){

	    	editAvaFiles.append('logo', editAvaFile);
			editAvaFiles.append('_token', window.Laravel.csrfToken);

			$.ajax({
				'url':'/upload-img-clan',
				'type':'post',
				'processData': false,
				'contentType': false,			
				'data':editAvaFiles,
				success:function(data){
					if(data.image != undefined && data.image != ''){
						ClanEdit.logo = data.image;
					}
					
				}
			});
	    }else{

	    	$.alert('Логотип должен весить не больше 1000kb');
	    }  	 
	});			


	$(document).on('click', '.save-edit-clan', function(){

		let clanName = $(document).find('#clanName').val();
		let clanSlogan = $(document).find('#clanSlogan').val();
		let clanWidget = $(document).find('#clanWidget').val();
		let clanDescription = $(document).find('#clanDescription').val();
		let clanRules = $(document).find('#clanRules').val();

		ClanEdit.clanName = clanName;
		ClanEdit.clanSlogan = clanSlogan;
		ClanEdit.clanDescription = clanDescription;
		ClanEdit.clanRules = clanRules;
		ClanEdit.clanWidget = clanWidget;

		$.ajax({
			url:'/save-edit',
			type:'post',			
			data:ClanEdit,
			success:function(data){
				$.alert(data.success);
				if(data.imgsrc != '' && data.imgsrc != null && data.imgsrc != undefined){
					$(document).find('#editAvatar').html('<img src="'+data.imgsrc+'" alt="" />');	
				}
					
			}
		});

	});

	//принять игрока в клан по заявке
	$(document).on('click', '.apply-add', function(){
		let id = $(this).attr('data-add-id');

		let that = this;

		$.confirm({
			title: 'Принять в клан!',
			animation: 'RotateY',
    		closeAnimation: 'RotateY',
		    buttons: {
		        ОТМЕНА: function(){},
		        somethingElse: {
		            text: 'ДА',
		            btnClass: 'btn-green',
		            keys: ['enter', 'shift'],
		            action: function(){
						$.ajax({
							url:'/accept-gamer',
							type:'post',
							data:{
								'_token': window.Laravel.csrfToken,
								'id':id
							},
							success:function(data){
								$(that).parent().parent().parent().find('.apply-event').css({'display':'none'});
								$.alert('Игрок успешно добавлен в клан!');
							}
						});
						
		            }
		        }
		    }
		});	


	});
	//Отклонить заявку в клан
	$(document).on('click', '.apply-refuse', function(){
		let idRefuse = $(this).attr('data-refuse-id');
		let clanRefuse = $(this).attr('data-refuse-clan');
		let title = 'Удалить заявку!';

		let that = this;

		if(clanRefuse == undefined){
			title = 'Отказать!';
		}

		$.confirm({
			title: title,
			animation: 'RotateY',
    		closeAnimation: 'RotateY',
		    buttons: {
		        ОТМЕНА: function(){},
		        somethingElse: {
		            text: 'ДА',
		            btnClass: 'btn-red',
		            keys: ['enter', 'shift'],
		            action: function(){
						$.ajax({
							url:'/refuse-gamer',
							type:'post',
							data:{
								'_token': window.Laravel.csrfToken,
								'idRefuse':idRefuse,
								'clanRefuse':clanRefuse
							},
							success:function(data){
								if(data.delete == 'удалена'){
									$.alert(data.success);
									$(that).parent().parent().parent().find('.apply-event').css({'display':'none'});
								}else if(data.refuse == 'отказано'){
									$(that).parent().parent().parent().find('.apply-event').css({'display':'none'});
									$.alert(data.success);
								}else{
									$.alert('Ошибка попробуйте обность страницу!');
								}
								
							}
						});
						
		            }
		        }
		    }
		});
	});

	//покинуть клан
	$(document).on('click', '.logout-clan span', function(){

		$.confirm({
			title: 'Покинуть клан!',
			animation: 'RotateY',
    		closeAnimation: 'RotateY',
		    buttons: {
		        Покинуть: function(){
					$.ajax({
						url:'/logout-clan',
						type:'post',
						data:{
							'_token': window.Laravel.csrfToken
						},
						success:function(data){
							$(document).find('.my-clans-block').html('<div class="col-md-12"><h2>'+data+'</h2></div>');
						}
					});
					$.alert('Вы успешно покинули клан!');
		        },
		        somethingElse: {
		            text: 'Передумал!',
		            btnClass: 'btn-green'
		        }
		    }
		});		
	});

	$(document).on('click', '.rules-info', function(){
		$(document).find('.rulies-popup-block').css({'visibility':'visible', 'opacity':1, 'transition':'all .5s'});
	});

	$(document).on('click', '.rulies-popup-block .fa-window-close', function(){
		$(document).find('.rulies-popup-block').css({'visibility':'hidden','opacity':0,'transition':'all .5s'});
	});

	//Подробна инфа о игроке
	$(document).on('click', '.clan-table-gamers p .fa-info-circle', function(){
		$(document).find('.popup-user-block').css({
			'display':'table'
		});

		$(document).find('.clan-table-gamers p:last').html('<div class="col-md-2"></div><div class="col-md-10"><div class="ajax-loader"><div class="cssload-loader"><div class="cssload-inner cssload-one"></div><div class="cssload-inner cssload-two"></div><div class="cssload-inner cssload-three"></div></div></div></div>');

		let battleTag = $(this).attr('data-batle-tag');
	    battleTag = battleTag.replace('#', '-');
	    $.ajax({
	    	url:'https://overwatch-clans.com:8081/api/'+battleTag,
	    	type:'get',
	    	dataType:'json',
	    	success:function(userInfo){
	    		$(document).find('.clan-table-gamers p:last').html('<i class="fa fa-info-circle" data-batle-tag="'+battleTag+'" aria-hidden="true"></i>');
	    		battleTag = battleTag.replace('-', '#');
	    		$('.popup-user-info').html(
	    			'<div class="col-md-2"></div><div class="col-md-10">'+
						'<table class="table">'+
			    			'<thead>'+
			    				'<tr>'+
			    					'<td colspan="2"><div class="info-user-title"><h3>Информация об игроке</h3></div><div class="closse-user-info"><i class="fa fa-times" aria-hidden="true"></i></div></td>'+
			    				'</tr>'+
			    			'</thead>'+
			    			'<tbody>'+
				    			'<tr>'+
				    				'<td><img src="'+userInfo.avatar+'" alt="" /></td>'+
				    				'<td><p>'+battleTag+'</p></td>'+
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

});