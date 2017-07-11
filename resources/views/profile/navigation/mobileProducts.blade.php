@extends('layouts.mobile')

@section('content')
	<div class="products-block">
		<div class="col-xs-10 col-xs-offset-1">
			@foreach($products as $product)
				<div class="col-xs-6">
					<div class="product-coins">
						<img src="{{$product->products_img}}" alt="">
						<p>{{$product->products_price}}</p>
					</div>
					
				</div>
			@endforeach					
		</div>

	</div>

@endsection

