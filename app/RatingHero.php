<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RatingHero extends Model
{
    protected $fillable = [
        'user_id', 'rating_heroes', 'your_hero', 'reaper_win_rate', 'bastion_win_rate', 'best_kills', 'best_damage'
    ];
}
