<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\dapurkuController;  // Make sure you've created this controller

// Public Routes
Route::get('/', function () {
    return view('landing');
});

Route::get('/recipes', [RecipeController::class, 'index'])->name('recipes.index');
Route::get('/recipes/{recipe}', [RecipeController::class, 'show'])->name('recipes.show');


// Authentication Routes
// (Note: Auth::routes() is included here, it provides all necessary routes for registration, login, password reset)
Auth::routes();

Route::get('/laravel', function () {
    return view('welcome');
});


// Authenticated Routes (Recipes & Dashboard)
Route::middleware(['auth'])->group(function () {

    // Recipe Routes
    Route::get('/recipes/create', [RecipeController::class, 'create'])->name('recipes.create');
    Route::post('/recipes', [RecipeController::class, 'store'])->name('recipes.store');
    Route::get('/recipes/{recipe}/edit', [RecipeController::class, 'edit'])->name('recipes.edit');
    Route::put('/recipes/{recipe}', [RecipeController::class, 'update'])->name('recipes.update');
    Route::delete('/recipes/{recipe}', [RecipeController::class, 'destroy'])->name('recipes.destroy');

    // Dashboard
    Route::get('dashboard', [HomeController::class, 'dashboard'])->name('dashboard');
    Route::get('detailmenu', [HomeController::class, 'detailmenu'])->name('detailmenu');

    // ... other authenticated routes (e.g., for dapurkuController)
});

// Additional Registration & Password Routes
// (These were in the second snippet, better to put them within the auth group)
Route::group(['prefix' => '', 'as' => 'user.'], function () {
    Route::get('register', [UserController::class, 'register'])->name('register');
    Route::post('register', [UserController::class, 'register_action'])->name('register.action');
    Route::get('login', [UserController::class, 'login'])->name('login');
    Route::post('login', [UserController::class, 'login_action'])->name('login.action');
    Route::get('logout', [UserController::class, 'logout'])->name('logout');

    // Forgot Password
    Route::get('forgot-password', [UserController::class, 'forgotPassword'])->name('forgotpassword');
    Route::post('forgot-password', [UserController::class, 'forgotPasswordAction'])->name('forgotpassword.action');
    Route::get('reset-password/{token}/{email}', [UserController::class, 'resetPassword'])->name('resetpassword');
    Route::post('reset-password', [UserController::class, 'resetPasswordAction'])->name('resetpassword.action');
});
