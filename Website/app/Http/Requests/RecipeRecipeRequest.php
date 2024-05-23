<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateRecipeRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'required|image|mimes:jpeg,png,jpg|max:2048',
            'prep_time' => 'required|integer|min:1',
            'cook_time' => 'required|integer|min:1',
            'servings' => 'required|integer|min:1',
            'ingredients' => 'required|string',
            'instructions' => 'required|string',
            'notes' => 'nullable|string',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'Judul resep wajib diisi.',
            'title.string' => 'Judul resep harus berupa teks.',
            'title.max' => 'Judul resep tidak boleh lebih dari :max karakter.',

            'image.required' => 'Gambar wajib diisi.',
            'image.image' => 'File yang diunggah harus berupa gambar.',
            'image.mimes' => 'Format gambar yang diizinkan: JPEG, PNG, JPG.',
            'image.max' => 'Ukuran gambar maksimal :max KB.',

            'prep_time.required' => 'Waktu persiapan wajib diisi.',
            'prep_time.integer' => 'Waktu persiapan harus berupa angka.',
            'prep_time.min' => 'Waktu persiapan minimal :min menit.',

            'cook_time.required' => 'Waktu memasak wajib diisi.',
            'cook_time.integer' => 'Waktu memasak harus berupa angka.',
            'cook_time.min' => 'Waktu memasak minimal :min menit.',

            'servings.required' => 'Jumlah porsi wajib diisi.',
            'servings.integer' => 'Jumlah porsi harus berupa angka.',
            'servings.min' => 'Jumlah porsi minimal :min.',

            'ingredients.required' => 'Bahan-bahan wajib diisi.',
            'ingredients.string' => 'Bahan-bahan harus berupa teks.',

            'instructions.required' => 'Cara membuat wajib diisi.',
            'instructions.string' => 'Cara membuat harus berupa teks.',
        ];
    }
}
