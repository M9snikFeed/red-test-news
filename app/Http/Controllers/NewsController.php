<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\Support\Facades\Request;

class NewsController extends Controller
{
    function index(){
        $news = News::latest('created_at')->whereFavorites(true)->limit(6)->get();
        return view('index', ['title' => 'Главная', 'news' => $news]);
    }

    function list(){
        if($search = Request::input('search')){
            // самый простой и самый слабенький, но это же всё ещё поиск) ...
            $news = News::where('title', 'LIKE', $search)->paginate(12);
        }
        else{
            $news = News::paginate(12);
        }

        return view('news', ['news' => $news, 'title' => 'Список новостей']);
    }

    function show(News $item){
        return view('newsShow',
            [
                'title' => 'Список новостей',
                'item' => $item,
                'similar_news' => News::latest('created_at')->whereFavorites(true)->limit(6)->get(),
            ]);
    }
}
