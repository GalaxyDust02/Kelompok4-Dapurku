<?php

use App\Controllers\dapurkuController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HomeController;

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


#home
Route::get('dashboard', [HomeController::class, 'dashboard'])->name('dashboard');
Route::get('detailmenu', [HomeController::class, 'detailmenu'])->name('detailmenu');

