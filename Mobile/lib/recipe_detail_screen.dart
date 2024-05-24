import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              recipe.imagePath,
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
                    recipe.title,
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
                          recipe.author.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        recipe.author,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.timer, size: 18),
                      const SizedBox(width: 4.0),
                      Text('${recipe.cookingTime} menit'),
                      const SizedBox(width: 16.0),
                      const Icon(Icons.people, size: 18),
                      const SizedBox(width: 4.0),
                      Text('${recipe.serving} orang'),
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
                    children: recipe.ingredients
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
                    children: recipe.frostingIngredients
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
                    children: recipe.instructions
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
                  Text(recipe.notes),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Rating & Ulasan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    children: recipe.reviews
                        .map(
                          (review) => ReviewTile(review: review),
                        )
                        .toList(),
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
