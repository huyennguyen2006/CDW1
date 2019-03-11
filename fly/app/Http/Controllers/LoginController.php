<?php
namespace App\Http\Controllers;

use App\Model\Login;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\MessageBag;

class LoginController extends Controller {

    use AuthenticatesUsers;

    public function index() {
        return view('/login');
    }

    protected function hasTooManyLoginAttempts(Request $request) {
        return $this->limiter()->tooManyAttempts(
                        $this->throttleKey($request), 3, 30 // <--- Change this
        );
    }

    public function postLogin(Request $request) {
        $validator = Validator::make($request->all(), [
                    'email' => 'required|email',
                    'password' => 'required|min:6'
                        ], [
                    'email.required' => 'Email not connect !',
                    'email.email' => 'Email have .@gmail.com',
                    'password.required' => 'Password not connect!',
                    'password.min' => 'Password lest 8 character !',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        } else {
            $email = $request->input('email');
            $password = $request->input('password');
            $data = Login::where('email', $email)->first();

            if ($this->hasTooManyLoginAttempts($request)) {
                $this->fireLockoutEvent($request);
                return $this->sendLockoutResponse($request);
            } else {
                if (Auth::attempt(['email' => $email, 'password' => $password])) {
                    Session::put('name', $data->name);
                    Session::put('email', $data->email);
                    Session::put('login', TRUE);
                    $this->clearLoginAttempts($request);
                    return redirect()->intended('/index');
                } else {
                    $this->incrementLoginAttempts($request);
                    $count = $this->limiter()->attempts($this->throttleKey($request));
                    $left = 3 - $count;
                    $errors = new MessageBag(['errorlogin' => 'Email or Password not connect, please input again ! ' . $left . ' attempt left!!']);
                    return redirect('/login')->withInput($request->except('password'))->withErrors($errors);
                }
            }
        }
    }

    public function logout() {
        Auth::logout();
        Session::put('login', FALSE);
        return redirect()->route('login');
    }

}
