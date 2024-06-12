<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DishesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('dishes')->insert([
            [
                'name' => 'Contoh Menu 1',
                'description' => 'Deskripsi menu contoh 1.',
                'image_path' => 'path/to/image1.jpg', // Ganti dengan path gambar yang valid
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Contoh Menu 2',
                'description' => 'Deskripsi menu contoh 2.',
                'image_path' => 'path/to/image2.jpg', // Ganti dengan path gambar yang valid
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
