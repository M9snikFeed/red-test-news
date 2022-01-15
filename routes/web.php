<?php

use App\Http\Controllers\NewsController;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});

Route::get('/', [NewsController::class, 'index'])->name('index');
Route::get('/news', [NewsController::class, 'list'])->name('news.list');
Route::get('/news/{item}', [NewsController::class, 'show'])->name('news.show');
Route::get('city/{city}', function ($city) {
    Request::session()->put('city', $city);
    Request::session()->save();
    return redirect()->back();
})->name('city');

Route::get('/news/favorite/add/{item}', [NewsController::class, 'add_favorite'])
    ->name('news.favorite.add');
Route::get('/news/favorite/remove/{item}', [NewsController::class, 'add_favorite'])
    ->name('news.favorite.remove');

require __DIR__.'/auth.php';
