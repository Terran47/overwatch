<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class referal_user extends Model
{
    protected $fillable = [
        'ref_user_id', 'reg_user_id'
    ];
}
