class Recipe {
  final String imagePath;
  final String title;
  final String author;
  final int cookingTime;
  final int serving;
  final List<String> ingredients;
  final List<String> frostingIngredients;
  final List<String> instructions;
  final String notes;
  final List<Review> reviews;

  Recipe({
    required this.imagePath,
    required this.title,
    required this.author,
    required this.cookingTime,
    required this.serving,
    required this.ingredients,
    required this.frostingIngredients,
    required this.instructions,
    required this.notes,
    required this.reviews,
  });
}

class Review {
  final String name;
  final String date;
  final String reviewText;
  final String imagePath;
  final int rating;

  Review({
    required this.name,
    required this.date,
    required this.reviewText,
    required this.imagePath,
    required this.rating,
  });
}

final List<Recipe> recipes = [
  Recipe(
    imagePath: 'assets/images/cupcake.png',
    title: 'Snow Chocolate Cupcake',
    author: 'Psyche Poli',
    cookingTime: 45,
    serving: 10,
    ingredients: [
      '1 kotak tepung pondan coklat',
      '6 butir telur',
      'Margarin sesuai dengan instruksi kemasan tepung'
    ],
    frostingIngredients: [
      'Whipped cream bubuk + air es, sesuai instruksi kemasan',
      '1 sdm selai coklat',
      'Strawberry dan hiasan sesuai selera'
    ],
    instructions: [
      'Pecahkan telur, kocok hingga mengembang dengan menggunakan mixer',
      'Lelehkan margarin, masukkan tepung pondan instant ke dalam adonan aduk merata, kemudian masukkan margarin cair. Aduk kembali hingga merata',
      'Tuang adonan coklat kedalam kertas cupcake dengan ketinggian 3/4',
      'Panggang 170 celcius selama 20 menit hingga matang. Test kematangan dengan tusukan kue. Biarkan kue dingin terlebih dahulu baru dihias',
      'Untuk frosting : saya pakai whipped cream bubuk, air es dan selai coklat aduk dengan mixer hingga mengembang dan rata',
      'Hias diatas cupcake yang sudah dingin, kemudian beri hiasan. Selamat mencoba',
    ],
    notes:
        'Pernah dengar games Cupcakes Fever? Atau serial TV DC Cupcakes? Yup, seheboh itulah fenomena kue cantik yang satu ini. Lain halnya dengan cakes lain berukuran besar, cake ini memiliki ukuran personal dengan aneka topping. Tak hanya cantik, kue ini juga sangat menggugah selera. Tapi saking cantiknya, terkadang anda jadi sayang untuk melahapnya.\n\nMembuat cupcakes ini ternyata sangat sederhana. Anda cukup buat 2 adonan yaitu adonan dasar kue dan adonan topping. Setelah kue matang, tinggal serahkan sisanya pada kreativitas anda untuk menghiasnya dengan topping!',
    reviews: [
      Review(
          name: 'Psyche Poli',
          date: '25 Jan 2024',
          reviewText:
              'Aku udah recook, hasilnya sesuai, rasanya enak. Thank you ya kak resepnya!',
          imagePath: 'assets/images/cupcake.png',
          rating: 4),
      Review(
          name: 'Psyche Poli',
          date: '25 Jan 2024',
          reviewText:
              'Aku udah recook, hasilnya sesuai, rasanya enak. Thank you ya kak resepnya!',
          imagePath: 'assets/images/cupcake.png',
          rating: 4),
      Review(
          name: 'Psyche Poli',
          date: '25 Jan 2024',
          reviewText:
              'Aku udah recook, hasilnya sesuai, rasanya enak. Thank you ya kak resepnya!',
          imagePath: 'assets/images/cupcake.png',
          rating: 4),
      Review(
          name: 'Psyche Poli',
          date: '25 Jan 2024',
          reviewText:
              'Aku udah recook, hasilnya sesuai, rasanya enak. Thank you ya kak resepnya!',
          imagePath: 'assets/images/cupcake.jpg',
          rating: 4),
    ],
  ),
  // Tambahkan resep lainnya di sini...
];
