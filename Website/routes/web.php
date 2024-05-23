<?php

use App\Controllers\dapurkuController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades;

Auth::routes();

Route::get('/laravel', function () {
    return view('welcome');
});

Route::get('/', function () {
    return view('landing');
});

#auth
Route::get('register', [UserController::class, 'register'])->name('register');
Route::post('register', [UserController::class, 'register_action'])->name('register.action');
Route::get('login', [UserController::class, 'login'])->name('login');
Route::post('login', [UserController::class, 'login_action'])->name('login.action');
Route::get('logout', [UserController::class, 'logout'])->name('logout');

#forgot password
Route::get('forgot-password', [UserController::class, 'forgotpassword'])->name('forgotpassword');
Route::post('forgot-password', [UserController::class, 'forgotpassword_action'])->name('forgotpassword.action');
Route::get('reset-password/{token}/{email}', [UserController::class, 'resetpassword'])->name('resetpassword');
Route::post('reset-password', [UserController::class, 'resetpassword_action'])->name('resetpassword.action');

#home
Route::get('dashboard', [HomeController::class, 'dashboard'])->name('dashboard');
Route::get('detailmenu', [HomeController::class, 'detailmenu'])->name('detailmenu');

