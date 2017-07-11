<style>
	.main-block-payment{
		display: table;
	}
	.main-block-payment strong{
	    color: #ffffff;
	    width: 100%;
	    text-align: center;
	    background: #2661bd;
	    display: block;
	    padding: 3px 20px;
	    margin: 5px 0;
	    text-shadow: 1px 1px 0 #333;
	    border-radius: 6px;
	}
	.input-gold-value{
	    display: table;
	    padding: 15px;
	    border: 5px solid rgb(254, 194, 20);
	    border-radius: 4px;
	}
	.input-gold-value input{
	    text-align: center;
	    height: 35px;
	    border: none;
	    background: #fff;
	    border-radius: 4px;
	    outline: none;
	    font-size: 22px;
	    width: 100%;
	}
	.input-gold-value p{
	    margin: 10px 0 0 0;
	    padding: 0;
	    font-size: 22px;
	    color: #ffbe00;
	    text-align: center;
	    text-transform: uppercase;
	    font-weight: bold;
	}
	.main-block-payment a{
		display: block;
	    margin: 5px 0 0;
	    width: 100%;
	    text-align: center;
	    padding: 5px 0;
	    background: #ffbe00;
	    color: #fff;
	    text-transform: uppercase;
	    font-size: 25px;
	    text-shadow: 1px 1px 0 rgba(51, 51, 51, 0.56);
	}
	.main-block-payment a:hover{
		text-decoration: none;
	}
</style>
<div class="main-block-payment">
	<strong>1 рубль = 2 монеты</strong>

	<div class="clear"></div>

	<div class="input-gold-value">
		<input type="text" class="pay-summa" value="500">
		<div class="clear"></div>
		<p>монеты</p>
	</div>

	<div class="clear"></div>

	<a href="#" class="pay-form">купить</a>
	
</div>

<script>
	$(document).off('click', '.pay-form').on('click', '.pay-form', function(e){
		e.preventDefault();
		let summa = $(document).find('.pay-summa').val();
		$.ajax({
			url:'/payment/form',
			type:'post',
			data:{
				'_token':window.Laravel.csrfToken,
				'summa':summa
			},
			success:function(summResult){
				console.log(summResult);
				if(summResult !='error'){
					$(document).find('.main-block-payment').html(summResult);
				}else{
					$.alert('Ошибка');
				}
				
			}

		});
	});
</script>
