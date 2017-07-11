@extends('layouts.profile')
<link rel="stylesheet" href="{{ asset('css/news.css') }}">
@section('content')
<h2>{{ $pageInfo->navigation_title }}</h2>
<div class="clear"></div>
<div class="posts-block">
	@if(count($posts) > 0)

		<ul>
			
			@foreach($posts as $post)
			
				<li>
					{!! $post->post_content !!}
				</li>

			@endforeach

		</ul>

	@else
		<h2>Постов нет</h2>
	@endif
</div>
@endsection