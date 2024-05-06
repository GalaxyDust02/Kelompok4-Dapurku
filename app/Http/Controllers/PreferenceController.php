<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Preference;

class PreferenceController extends Controller
{
    // Method untuk menampilkan formulir
    public function index()
    {
        return view('personalisasi');
    }

    // Method untuk menyimpan preferensi makanan
    public function store(Request $request)
    {

        // Validasi data yang dikirimkan oleh pengguna
        $request->validate([
            'favorite_food' => 'required|string|max:255', // Contoh validasi sederhana, Anda dapat menyesuaikan sesuai kebutuhan
        ]);

        // Buat objek preference baru
        $preference = new Preference();
        // Isi field-field dalam objek preference
        $preference->user_id = auth()->id();
        $preference->favorite_food = $request->input('favorite_food');
        // Simpan objek preference ke dalam database
        $preference->save();

        // Kembalikan respon ke halaman formulir dengan pesan sukses
        return redirect('/personalisasi')->with('success', 'Preferensi makanan berhasil disimpan.');
    }


}
