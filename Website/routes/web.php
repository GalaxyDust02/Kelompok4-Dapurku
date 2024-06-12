<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\dapurkuController;  // Make sure you've created this controller


Route::get('/laravel', function () {
    return view('welcome');
});

// Public Routes
Route::get('/', function () {
    return view('landing');
});


// Authentication Routes
// (Note: Auth::routes() is included here, it provides all necessary routes for registration, login, password reset)
Auth::routes();
// Authenticated Routes (Recipes & Dashboard)
Route::middleware(['auth'])->group(function () {

    // Recipe Routes
    Route::get('/recipes', [RecipeController::class, 'index'])->name('recipes.index');
    Route::get('/recipes/{recipe}', [RecipeController::class, 'show'])->name('recipes.show');
    Route::get('/recipes/create', [RecipeController::class, 'create'])->name('recipes.create');
    Route::post('/recipes', [RecipeController::class, 'store'])->name('recipes.store');
    Route::get('/recipes/{recipe}/edit', [RecipeController::class, 'edit'])->name('recipes.edit');
    Route::put('/recipes/{recipe}', [RecipeController::class, 'update'])->name('recipes.update');
    Route::delete('/recipes/{recipe}', [RecipeController::class, 'destroy'])->name('recipes.destroy');
// Dashboard
#home
Route::get('/dashboard', [HomeController::class, 'dashboard'])->name('dashboard');
Route::get('/detailmenu/{dish}', [HomeController::class, 'detailmenu'])->name('detailmenu');

Route::post('/ratings', [RatingController::class, 'store'])->name('ratings.store')->middleware('auth');
Route::post('/comments', [CommentController::class, 'store'])->name('comments.store')->middleware('auth');
});

Route::get('/register', [UserController::class, 'register'])->name('register');
Route::post('/register', [UserController::class, 'register_action']);
Route::get('/login', [UserController::class, 'login'])->name('login');
Route::post('/login', [UserController::class, 'login_action']);
Route::get('/forgotpassword', [UserController::class, 'forgotPassword'])->name('forgotpassword');
Route::post('/forgotpassword', [UserController::class, 'forgotPasswordAction'])->name('forgotpassword.action');
Route::get('logout', [UserController::class, 'logout'])->name('logout');
