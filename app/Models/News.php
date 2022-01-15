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

    public function cities()
    {
        return $this->belongsToMany(City::class);
    }
}
