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
            <div class="content">
                {!!html_entity_decode($item->content)!!}
            </div>
        </div>
    </main>
@endsection
