import 'package:flutter/material.dart';

void main() {
  runApp(const DetailWidget());
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Image.asset('assets/snow_chocolate_cupcake.jpg'),
          const SizedBox(height: 16.0),
          const Text(
            'Snow Chocolate Cupcake',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          const Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 4.0),
              Text('Psyche Poli'),
              SizedBox(width: 16.0),
              Icon(Icons.timer),
              SizedBox(width: 4.0),
              Text('45 menit'),
              SizedBox(width: 16.0),
              Icon(Icons.people),
              SizedBox(width: 4.0),
              Text('10 orang'),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Bahan - Bahan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          const Text('• 1 kotak tepung pondan coklat'),
          const Text('• 6 butir telur'),
          const Text('• Margarin sesuai dengan instruksi kemasan tepung'),
          const SizedBox(height: 16.0),
          const Text(
            'Bahan frosting coklat:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          const Text('• Whipped cream bubuk + air, sesuai instruksi kemasan'),
          const Text('• 1 sdm selai coklat'),
          const Text('• Strawberry dan hiasan sesuai selera'),
          const SizedBox(height: 16.0),
          const Text(
            'Cara Membuat',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          const Text(
              '1. Pecahkan telur, kocok hingga mengembang dengan menggunakan mixer'),
          const Text(
              '2. Lelehkan margarin, masukkan tepung pondan instant ke dalam adonan aduk merata, kemudian masukkan margarin cair. Aduk kembali hingga merata'),
          const Text(
              '3. Tuang adonan coklat ke dalam kertas cupcake dengan ketinggian 3/4'),
          const Text(
              '4. Panggang 170 celcius selama 20 menit hingga matang. Test kematangan dengan tusukan kue. Biarkan kue dingin terlebih dahulu baru dihias'),
          const Text(
              '5. Untuk frosting: saya pakai whipped cream bubuk, air es dan selai coklat aduk dengan mixer hingga mengembang dan rata'),
          const Text(
              '6. Hias diatas cupcake yang sudah dingin, kemudian beri hiasan. Selamat mencoba'),
          const SizedBox(height: 16.0),
          const Text(
            'Catatan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          const Text(
              'Pernah dengar games Cupcakes Fever? Atau serial TV DC Cupcakes? Yup, seheboh itulah fenomena kue cantik yang satu ini. Lain halnya dengan cakes lain berukuran besar, cake ini memiliki ukuran personal dengan aneka topping. Tak hanya cantik, kue ini juga sangat menggugah selera. Tapi saking cantiknya, terkadang anda jadi sayang untuk melahapnya.'),
          const Text(
              'Membuat cupcakes ini ternyata sangat sederhana. Anda cukup buat 2 adonan yaitu adonan dasar kue dan adonan topping. Setelah kue matang, tinggal serahkan sisanya pada kreativitas anda untuk menghiasnya dengan topping!'),
          const SizedBox(height: 16.0),
          const Text(
            'Rating & Ulasan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          buildReview(
              'Psyche Poli',
              '25 Jan 2024',
              'Aku udah recook, hasilnya sesuai, rasanya enak. Thank you ya kak resepnya!',
              'assets/review_image.jpg',
              4),
          buildReview(
              'Psyche Poli',
              '25 Jan 2024',
              'Aku udah recook, hasilnya sesuai, rasanya enak. Thank you ya kak resepnya!',
              'assets/review_image.jpg',
              4),
          buildReview(
              'Psyche Poli',
              '25 Jan 2024',
              'Aku udah recook, hasilnya sesuai, rasanya enak. Thank you ya kak resepnya!',
              'assets/review_image.jpg',
              4),
          buildReview(
              'Psyche Poli',
              '25 Jan 2024',
              'Aku udah recook, hasilnya sesuai, rasanya enak. Thank you ya kak resepnya!',
              'assets/review_image.jpg',
              4),
        ],
      ),
    );
  }

  Widget buildReview(
      String name, String date, String review, String imagePath, int rating) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(name[0]),
                ),
                const SizedBox(width: 8.0),
                Text(name),
                const SizedBox(width: 8.0),
                Text(date),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(review),
            const SizedBox(height: 8.0),
            Image.asset(imagePath),
            const SizedBox(height: 8.0),
            Row(
              children: List.generate(rating, (index) {
                return const Icon(Icons.star, color: Colors.orange);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
