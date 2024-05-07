<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

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

    public function forgotpassword(){
        return view('user/forgotpassword');
    }

    public function forgotpassword_action(Request $request){
        $request->validate([
            'email' => 'required|email',
        ]);
        $token = Str :: random(64);
        DB:table('table_password')->insert([
            'email' => $request->email,
            'token' => $token,
            'created_at' => Carbon::now()
        ]);

        Mail::send("email.forgotpassword", ['token' => $token], function($message) use ($request){
            $message->to($request->email);
            $message->subject("Reset Password");
        });

        return redirect()->route('forgotpassword')->with('success', 'Silahkan cek email untuk reset password.');

    }

    public function resetpassword($token){
        return view('user/resetpassword', compact('token'));
    }

    public function resetpassword_action(Request $request){
        $request->validate([
            'password' => 'required',
            'password_confirmation' => 'required|same:password'
        ]);

        $updatePassword = DB::table('table_password')->where([
            'email' => $request->email,
            'token' => $request->token,
            'created_at' => '>=', Carbon::now()->subHours(1)
        ])->first();

        if($updatePassword){
            return redirect()->to(route('resetpassword', $request->token))->with('error', 'Token sudah kadaluarsa.');
        }

        User::where('email', $request->email)->update([
            'password' => Hash::make($request->password)
        ]);

        DB::table('table_password')->where([
            'email' => $request->email,
            'token' => $request->token
        ])->delete();

        return redirect()->to(route('login'))->with('success', 'Password berhasil direset, silahkan login.');
    }


    public function logout(){
        auth()->logout();
        return redirect()->route('login')->with('success', 'Logout berhasil.');
    }
}
