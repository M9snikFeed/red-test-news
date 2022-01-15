@extends('layouts.app')

@section('main')
    <main class="news-page">
        <div class="container">
            <section class="news-list">
                @foreach ($news as $news_item)
                    <div class="news-item">
                        <div class="poser">
                            <img class="image" src="/assets/images/notFound.png" alt="">
                        </div>
                        <div class="info">
                            <h3 title="{{$news_item->description}}">{{$news_item->title}}</h3>
                        </div>
                        <div class="more-block">
                            <a class="btn more-btn" href="{{route('news.show', ['item' => $news_item->id])}}">Подробнее</a>
                        </div>
                    </div>
                @endforeach
            </section>
            {{ $news->links()}}
        </div>
    </main>
@endsection
