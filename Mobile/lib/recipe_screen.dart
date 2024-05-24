import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail_screen.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(recipe: recipes[index]);
        },
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipe: recipe),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(16.0),
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 18),
                      const SizedBox(width: 4.0),
                      Text('${recipe.cookingTime} menit'),
                      const SizedBox(width: 16.0),
                      const Icon(Icons.people, size: 18),
                      const SizedBox(width: 4.0),
                      Text('${recipe.serving} orang'),
                    ],
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
