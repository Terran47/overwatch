<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserPayment extends Model
{
    protected $fillable = [
        'pay_code_tranzaction', 'pay_coins', 'pay_money', 'pay_status', 'pay_user_id'
    ];	
}
