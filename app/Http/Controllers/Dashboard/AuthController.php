<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Auth;

use App\Admin;
class AuthController extends Controller
{
    use AuthenticatesUsers;

    protected $redirectTo = '/dashboard';

    public function showLoginForm()
    {
        return view('admin.login');
    }

    protected function guard(Request $request)
    {
        $request->validate(Admin::loginRules());

        $email = $request->email;
        $password = $request->password;
        $data = ['email' => $email, 'password' => $password];
        if (Auth::guard('admin')->attempt($data)) {
           Admin::where('id', Auth::guard('admin')->user()->id)->update(['web_token' => $request->web_token]);
            // Success redirect
            return redirect()->intended(route('dashboard.home'));
        } else {
            return redirect()->back()
                ->with('status', 'login_error')
                ->with('message', "البيانات ليست صحيحة");
        }
    }
    public function adminLogout()
    {
        $id=Auth::guard('admin')->user()->id;
        Admin::find($id)->update(['web_token' => null]);
        Auth::guard('admin')->logout();
        return redirect()->route('user.home');
    }
}
