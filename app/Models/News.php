<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
}
