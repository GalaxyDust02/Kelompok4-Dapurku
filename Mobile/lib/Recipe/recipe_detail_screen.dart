import 'package:flutter/material.dart';
import 'recipe.dart'; // Pastikan Anda memiliki file recipe.dart yang sesuai

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int _rating = 0;
  String _comment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.recipe.imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipe.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 12,
                        child: Text(
                          widget.recipe.author.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        widget.recipe.author,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.timer, size: 18),
                      const SizedBox(width: 4.0),
                      Text('${widget.recipe.cookingTime} menit'),
                      const SizedBox(width: 16.0),
                      const Icon(Icons.people, size: 18),
                      const SizedBox(width: 4.0),
                      Text('${widget.recipe.serving} orang'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Bahan - Bahan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipe.ingredients
                        .map((ingredient) => Text('• $ingredient'))
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Bahan frosting coklat :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipe.frostingIngredients
                        .map((ingredient) => Text('• $ingredient'))
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Cara Membuat',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipe.instructions
                        .map((instruction) => Text('• $instruction'))
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Catatan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(widget.recipe.notes),
                  const SizedBox(height: 16.0),

                  // Bagian rating & ulasan
                  const Text(
                    'Rating & Ulasan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    children: widget.recipe.reviews
                        .map((review) => ReviewTile(review: review))
                        .toList(),
                  ),

                  const SizedBox(height: 16.0),
                  // Form untuk rating dan komentar
                  const Text(
                    'Berikan Rating dan Komentar Anda',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        ),
                        onPressed: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _comment = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Tulis komentar Anda',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // ... (Logika untuk menyimpan rating dan komentar)
                    },
                    child: const Text('Kirim'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: Colors.orange,
                  radius: 18,
                  child: Text(
                    review.name.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  review.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                Text(
                  review.date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(review.reviewText),
            const SizedBox(height: 8.0),
            Image.asset(
              review.imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < review.rating ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
