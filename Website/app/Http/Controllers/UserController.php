<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use APP\Mail\ForgotPasswordEmail;

class UserController extends Controller
{
    public function register(){
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

    public function forgotpassword()
    {
        return view('user.forgotpassword');
    }

    public function forgotpassword_action(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users', // Validasi email ada di tabel users
        ]);

        $user = User::where('email', $request->email)->first();
        $token = Str::random(64);

        DB::table('password_resets')->insert([
            'email' => $request->email,
            'token' => $token,
            'created_at' => Carbon::now(),
        ]);

        Mail::to($request->email)->send(new ForgotPasswordEmail($token)); // Kirim email

        return back()->with('success', 'Silakan cek email Anda untuk tautan reset password.');
    }

    public function resetpassword(Request $request, $token)
    {
        return view('user.resetpassword', ['token' => $token]);
    }

    public function resetpassword_action(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email|exists:users',
            'password' => 'required|confirmed|min:8',
        ]);

        $passwordReset = DB::table('password_resets')
            ->where('token', $request->token)
            ->where('email', $request->email)
            ->first();

        if (!$passwordReset) {
            return back()->with('error', 'Token reset password tidak valid.');
        }

        $user = User::where('email', $request->email)->first();
        $user->password = Hash::make($request->password);
        $user->save();

        DB::table('password_resets')->where('email', $request->email)->delete();

        return redirect()->route('login')->with('success', 'Password berhasil diubah!');
    }


    public function logout(){
        auth()->logout();
        return redirect()->route('login')->with('success', 'Logout berhasil.');
    }
}
