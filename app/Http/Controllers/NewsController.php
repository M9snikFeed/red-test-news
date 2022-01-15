<?php

namespace App\Http\Controllers;

use App\Models\News;

class NewsController extends Controller
{
    function index(){
        $news = News::latest('created_at')->whereFavorites(true)->limit(6)->get();
        return view('index', ['title' => 'Главная', 'news' => $news]);
    }
    function list(){
        $news = News::paginate(12);
        return view('news', ['news' => $news, 'title' => 'Список новостей']);
    }
    function show(News $item){
        return view('newsShow', ['title' => 'Список новостей', 'item' => $item]);
    }
}
