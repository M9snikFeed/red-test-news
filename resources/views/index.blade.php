@extends('layouts.app')

@section('main')
    <main class="home-page">
        <div class="container">
            @if(Auth::check())
                <h2 class="mb-4">Изрбанные новости</h2>
            @else
                <h2 class="mb-4">Рекомендуемые новости</h2>
            @endif

            <section class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                @foreach ($news as $news_item)<div class="col">
                    <div class="card shadow-sm">
                        <img src="{{$news_item->poster}}" class="bd-placeholder-img card-img-top" width="100%" height="252"  role="img">
                        <div class="card-body">
                            <h3 class="card-text">{{$news_item->title}}</h3>
                            <p class="card-text">{{$news_item->description}}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a type="button" href="{{route('news.show', ['item' => $news_item->id])}}" class="btn btn-sm btn-outline-secondary">Читать</a>
                                    <a href="{{route('news.favorite.remove', ['item' => $news_item->id])}}" class="btn btn-sm btn-outline-secondary">Удалить из избранного</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </section>
            <h2 class="my-4">Новости из вашего города</h2>
            <section class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 mb-4">
                @foreach ($cityNews as $news_item)<div class="col">
                    <div class="card shadow-sm">
                        <img src="{{$news_item->poster}}" class="bd-placeholder-img card-img-top" width="100%" height="252"  role="img">
                        <div class="card-body">
                            <h3 class="card-text">{{$news_item->title}}</h3>
                            <p class="card-text">{{$news_item->description}}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="{{route('news.show', ['item' => $news_item->id])}}" class="btn btn-sm btn-outline-secondary">Читать</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </section>
        </div>
    </main>
@endsection
