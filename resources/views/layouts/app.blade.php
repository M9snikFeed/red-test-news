<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{$title}}</title>
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500&display=swap" rel="stylesheet">    <script src="https://kit.fontawesome.com/46f170b3e0.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="wrapper">
    <header>
        <div class="container">
            <a href="/" class="logo">Новости</a>
            <ul class="links close" id="dropdown_menu">
                <li class="link"><a href="/">Главная</a></li>
                <li class="link"><a href="/news">Новости</a></li>
            </ul>
            <ul class="buttons">
                <li class="search" title="Поиск...">
                    <a class="search-line">
                        <form action="/news" method="GET">
                            <label class="search">
                                <input name="search" type="text" placeholder="Поиск ..">
                            </label>
                            <button type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </a>
                    <i class="fas fa-search"></i>
                </li>
                @if (Route::has('login'))
                    @auth
                        <li class="profile" title="выйти из учетной записи">
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <x-dropdown-link :href="route('logout')"
                                                 onclick="event.preventDefault();
                                                 this.closest('form').submit();">
                                    <i class="fas fa-user"></i>
                                </x-dropdown-link>
                            </form>
                        </li>
                    @else
                        <li class="profile" title="авторизация">
                            <a href="{{ route('login') }}"><i class="fas fa-user"></i></a>
                        </li>
                    @endauth
                @endif
                <li class="menu" id="menu_button">
                    <i class="fas fa-align-justify"></i>
                </li>
                <li class="nav-item">
                    @if (Session::get('city') === 'moscow')
                        <a class="nav-link" href="{{ route('city', ['city' => 'yekaterinburg']) }}">Москва</a>
                    @else
                        <a class="nav-link" href="{{ route('city', ['city' => 'moscow']) }}">Екатеринбург</a>
                    @endif
                </li>
            </ul>
        </div>
    </header>
</div>

@section('main')
    <main class="home">
        home
    </main>
@show


@extends('layouts.footer')

<script src="/assets/js/main.js"></script>
</body>
</html>
