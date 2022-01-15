<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Request;

class NewsController extends Controller
{
    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    function index(){
        $city = Request::session()->get('city');
        if(Auth::check()){
            $user = Auth::user();
            $news = $user->news()->latest('created_at')->limit(6)->get();
        }
        else{
            $news = News::latest('created_at')->limit(6)->get();
        }
        $cityNews = News::latest('created_at')->ofCity($city)->limit(6)->get();
        return view('index', ['title' => 'Главная', 'news' => $news, 'cityNews' => $cityNews]);
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    function list(){
        $data = [
            'title'=> 'Список новостей'
        ];

        if($search = Request::input('search')){
            // самый простой и самый слабенький, но это же всё ещё поиск) ...
            $data['news'] = News::where('title', 'LIKE', $search)->paginate(12);
            $data['title'] = 'поиск по новостям';
            $data['search'] = true;
        }
        else{
            $data['news'] = News::paginate(12);
        }

        return view('news', $data);
    }

    /**
     * @param News $item
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    function show(News $item){
        return view('newsShow',
            [
                'title' => 'Список новостей',
                'item' => $item,
                'cities'=> $item->cities,
                'similar_news' => News::latest('created_at')->limit(6)->get(),
            ]);
    }

    /**
     * Adding news to favorites
     * @param News $item
     * @return \Illuminate\Http\RedirectResponse
     */
    function add_favorite(News $item): \Illuminate\Http\RedirectResponse
    {
        $user = Auth::user();
        $item->users()->attach($user->id);

        return redirect()->back();
    }

    /**
     * Removing news favorites
     * @param News $item
     * @return \Illuminate\Http\RedirectResponse
     */
    function remove_favorite(News $item): \Illuminate\Http\RedirectResponse
    {
        $user = Auth::user();
        $item->users()->distinct($user->id);

        return redirect()->back();
    }
}
