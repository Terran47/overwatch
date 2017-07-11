<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Clans extends Model
{
    protected $fillable = [
        'clan_name','clan_slogan','clan_description','clan_avatar','clan_user_id'
    ];
}
