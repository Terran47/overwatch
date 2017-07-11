/*$('.main-navigation-block a, .header-links a').on('click', function(e){

	e.preventDefault();

	let that = this;

	let hrefData = $(that).attr('href');
	let dataSetting = $(that).attr('data-link');

	$('.header-links a').removeClass('active-link');
	$('.main-navigation-block a').removeClass('active-link');

	if(dataSetting == 'sidebar'){

		$(that).addClass('active-link');

	}else if(dataSetting == 'header'){

		$(that).addClass('active-link');

	}

	$.ajax({
		url:hrefData,
		type:'get',
		data:{
			'_token':window.Laravel.csrfToken
		},
		success:function(page){

			$('.main-content-update').html(page);
			
		},
		error:function(){
			alert('Ошибка');
		}
	});

});*/

    $(document).on('click', '.payment-button', function(){

        $(document).find('.modal-block').addClass('modal-block-opened');
        $(document).find('.modal-bloc-list h1').html('Покупка золота');
        
        $.ajax({
            url:'/payment/get',
            type:'post',
            data:{
                '_token':window.Laravel.csrfToken
            },
            success:function(balance){
                $(document).find('.result-block').html(balance);
            }
        });
        
    });  

    $(document).on('click', '.button-close-modal', function(){

        $(document).find('.modal-block').removeClass('modal-block-opened');

    });

     $(document).on('click', '.update-user-info', function(){
     	$('.update-time-blick').css({'visibility':'visible', 'opacity':'1'});

     	
        $.ajax({
            url:'/update-user-info',
            type:'post',
            data:{
                '_token':window.Laravel.csrfToken
            },
            success:function(data){
                if(data == 'ok'){
                	$('.update-time-blick').css({'visibility':'hidden', 'opacity':'0'});
                	$('.update-user-info').html('<i class="fa fa-info-circle" aria-hidden="true"></i> Инфа обновлена');
                	$('.update-user-info').removeClass('update-user-info');
                    $.alert('Ваша информация успешно обновлена!');
                }else{
                    $.alert(data);
                    $('.update-time-blick').css({'visibility':'hidden', 'opacity':'0'});
                }           
            },
            error(error){
                $.alert(error);
                $('.update-time-blick').css({'visibility':'hidden', 'opacity':'0'});
            }
        });
    });  