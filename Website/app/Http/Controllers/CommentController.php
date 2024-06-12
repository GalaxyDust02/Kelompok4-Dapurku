<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'dish_id' => 'required|exists:dishes,id',
            'comment' => 'required|string|max:255', // Maksimal 255 karakter
        ]);

        // ... (Logika untuk mencegah spam)

        Comment::create([
            'user_id' => auth()->id(),
            'dish_id' => $request->dish_id,
            'comment' => $request->comment,
        ]);

        return back()->with('success', 'Komentar berhasil ditambahkan!');
    }
}
