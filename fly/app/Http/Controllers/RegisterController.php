<?php
namespace App\Http\Controllers;

use App\Model\Register;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller{
    
    public function index(){
        return view('/register');
    }
    
    public function postRegister(Request $request) {
        $validator = Validator::make($request->all(), [
                    'email' => 'required|email|unique:users',
                    'password' => 'required|min:8',
                    'name' => 'required',
                    'phone' => 'required',
                        ], [
                'email.required'=>'Email not connect !',
                'password.required'=>'Password lest 8 character',
                'name.required'=>'Name not connect',
                'phone.required'=>'Your phone number not connect',
        ]);
        if ($validator->fails()) {
            // dd($validator->errors());
            return redirect()->route('register')->withErrors($validator);
        } else {
            DB::table('users')->insert([
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'name' => $request->name,
                'phone' => $request->phone,
            ]);
            return redirect()->route('register')->with('success', 'Congratulations on successful registration!');
        }
    }
    
}
