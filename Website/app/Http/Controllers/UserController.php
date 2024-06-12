<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function register()
    {
        $data['title'] = 'Register';
        return view('user/register', $data);
    }

    public function register_action(Request $request){
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:table_user',
            'password' => 'required',
            'password_confirmation' => 'required|same:password'
        ]);

        $user = new User([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
        $user->save();

        // Redirect to the login route
        return redirect()->route('login')->with('success', 'Registrasi berhasil, silahkan login.');
    }

    public function login(){
        $data['title'] = 'Login';
        return view('user/login', $data);
    }

    public function login_action(Request $request){
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();
        if($user){
            if(Hash::check($request->password, $user->password)){
                return redirect()->route('dashboard')->with('success', 'Login berhasil.');
            }else{
                return redirect()->back()->with('error', 'Password salah.');
            }
        }else{
            return redirect()->back()->with('error', 'Email tidak terdaftar.');
        }
    }

    public function forgotPassword()
    {
        return view('user.forgotpsw');
    }

    public function forgotPasswordAction(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users,email',
        ]);

        $user = User::where('email', $request->email)->first();

        if ($user) {
            // Generate a random password reset token
            $token = Str::random(60);
            $user->password_reset_token = $token;
            $user->save();

            // Send password reset email
            Mail::send('emails.forgotPassword', ['token' => $token], function ($message) use ($user) {
                $message->to($user->email)
                    ->subject('Password Reset Request');
            });

            return redirect()->route('login')->with('success', 'Password reset email sent successfully. Please check your inbox.');
        } else {
            return redirect()->back()->with('error', 'Email not found.');
        }
    }

    public function logout(){
        auth()->logout();
        return redirect()->route('login')->with('success', 'Logout berhasil.');
    }
}
