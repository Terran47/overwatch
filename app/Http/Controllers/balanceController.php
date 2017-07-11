<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use App\Product;
use App\UserPayment;
class balanceController extends Controller
{
    public function templateBalance(){
    	return view('profile.balance.index');
    }

    public function getPayment(){
    	return 'getPayment';
    }

    public function resultPay(Request $request){
        if(!Auth::guest()){

            $summa = intval(($request->input('summa')/2).'.00');
            $summa = number_format($summa, 2, '.', ' ');

            $email = Auth::user()->email;
            $userId = Auth::user()->id;
            $orderId = mt_rand(11111111111, 99999999999);
            $m_shop = '358065338';
            $m_desc = base64_encode('Оплата. id '.$orderId);
            $m_curr = 'RUB';
            $m_key = 'Jtq6OjRCb6nQrDix';

            $arHash = array(
                $m_shop,
                $orderId,
                $summa,
                $m_curr,
                $m_desc,
                $m_key
            );

            $sign = strtoupper(hash('sha256', implode(':', $arHash)));

            $createOrder = UserPayment::create([
                'pay_user_id'=>$userId,
                'pay_code_tranzaction'=>$orderId,
                'pay_coins'=>$summa*2,
                'pay_money'=>$summa
            ]);

            if($createOrder){

                echo '<form method="post" action="https://payeer.com/merchant/">'.
                    '<input type="hidden" name="m_shop" value="'.$m_shop.'">'.
                    '<input type="hidden" name="m_orderid" value="'.$orderId.'">'.
                    '<input type="hidden" name="m_amount" value="'.$summa.'">'.
                    '<input type="hidden" name="m_curr" value="'.$m_curr.'">'.
                    '<input type="hidden" name="m_desc" value="'.$m_desc.'">'.
                    '<input type="hidden" name="m_sign" value="'.$sign.'">'.
                    '<input type="submit" name="m_process" value="оплатить" />'.
                '</form>';

            }else{

                echo 'error';

            }

        }
    }


    public function success(){
    	return 'success';
    }

    public function fail(){
    	return 'fail';
    }

    public function status(){
		if (!in_array($_SERVER['REMOTE_ADDR'], array('185.71.65.92', '185.71.65.189', '149.202.17.210'))) return;

		if (isset($_POST['m_operation_id']) && isset($_POST['m_sign']))
		{

			$m_key = 'Jtq6OjRCb6nQrDix';

			$arHash = array(
				$_POST['m_operation_id'],
				$_POST['m_operation_ps'],
				$_POST['m_operation_date'],
				$_POST['m_operation_pay_date'],
				$_POST['m_shop'],
				$_POST['m_orderid'],
				$_POST['m_amount'],
				$_POST['m_curr'],
				$_POST['m_desc'],
				$_POST['m_status']
			);

			if (isset($_POST['m_params']))
			{
				$arHash[] = $_POST['m_params'];
			}

			$arHash[] = $m_key;

			$sign_hash = strtoupper(hash('sha256', implode(':', $arHash)));

			if ($_POST['m_sign'] == $sign_hash && $_POST['m_status'] == 'success')
			{
				$paymentSearch = UserPayment::where('pay_code_tranzaction','=',intval($_POST['m_orderid']))->first();

				if(count($paymentSearch) > 0){

		            UserPayment::where('pay_code_tranzaction','=',intval($_POST['m_orderid']))->update([
		                'pay_status'=>true
		            ]);
		            $resultPay = intval($_POST['m_amount'])*2;
		            User::where('id',$paymentSearch->pay_user_id)->increment('user_money',$resultPay);

		            exit;

	            }

			}

			echo $_POST['m_orderid'].'|error';
		}
    }

    public function mobProducts(){

    	$headerNav = $this->headerNav;
    	$sidebarNav = $this->sidebarNav;
    	$products = Product::all();

    	return view('profile.navigation.mobileProducts', ['products'=>$products, 'headerNav'=>$headerNav, 'sidebarNav'=>$sidebarNav]);
    }     

}
