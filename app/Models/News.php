<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class News extends Model
{
    use HasFactory;

    protected $table = 'news';
    protected $fillable = [
        'title',
        'poster',
        'description',
        'content',
        'favorites'
    ];

    /**
     * belongsToMany
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function cities(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(City::class);
    }

    /**
     * @param $query
     * @param array $genres
     *
     * @return mixed
     */
    public function scopeOfCity($query, string $city)
    {
        $query->with('cities')->whereHas('cities', function ($query) use ($city) {
            $query->where('name', '=', $city);
        });

        return $query;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function users(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(User::class);
    }


    /**
     * This feature determines if a post has been marked as a favorite by an authorized user.
     *
     * @return boolean
     */
    public function isFavorite(): bool
    {
        return (bool) Favorite::where('user_id', Auth::id())
            ->where('news_id', $this->id)
            ->first();
    }

    public function getPosterAttribute($poster): string
    {
        return config('app.url') . $poster;
    }
}
