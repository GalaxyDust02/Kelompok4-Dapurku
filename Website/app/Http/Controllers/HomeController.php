<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Dish;

class HomeController extends Controller
{
    public function dashboard()
    {
        $dishes = Dish::all();
        return view('home.dashboard', compact('dishes'));
    }

    public function detailmenu(Dish $dish)
    {
        return view('home.detailmenu', compact('dish'));
    }

}
