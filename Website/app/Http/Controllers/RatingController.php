<?php

namespace App\Http\Controllers;

use App\Models\Rating;
use Illuminate\Http\Request;

class RatingController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'dish_id' => 'required|exists:dishes,id',
            'rating' => 'required|integer|between:1,5',
        ]);

        // Cek apakah user sudah pernah memberikan rating untuk menu ini
        $existingRating = Rating::where('user_id', auth()->id())
            ->where('dish_id', $request->dish_id)
            ->first();

        if ($existingRating) {
            return back()->with('error', 'Anda sudah pernah memberikan rating untuk menu ini.');
        }

        Rating::create([
            'user_id' => auth()->id(),
            'dish_id' => $request->dish_id,
            'rating' => $request->rating,
        ]);

        return back()->with('success', 'Rating berhasil ditambahkan!');
    }
}
