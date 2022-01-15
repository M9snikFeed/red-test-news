@extends('layouts.app')

@section('main')
    <main class="show-page">
        <div class="container">
            <div class="info">
                <div class="poster">
                    <img class="image" src="/assets/images/notFound.png" alt="">
                </div>
                <div class="text">
                    <h2>{{$item->title}}</h2>
                    <p>{{$item->description}}</p>
                </div>
            </div>
            <section class="content">
                {!!html_entity_decode($item->content)!!}
            </section>

            <section class="similar-news">
                <h3>Похожие новости</h3>
                <section class="news-list">
                    @foreach ($similar_news as $news_item)
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
            </section>
        </div>
    </main>
@endsection
