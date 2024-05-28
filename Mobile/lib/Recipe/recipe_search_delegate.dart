import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail_screen.dart';

class RecipeSearchDelegate extends SearchDelegate<Recipe?> {
  final List<Recipe> recipes;

  RecipeSearchDelegate({required this.recipes});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Recipe> filteredRecipes = recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredRecipes.length,
      itemBuilder: (context, index) {
        final recipe = filteredRecipes[index];
        return ListTile(
          leading: Image.asset(
            recipe.imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(recipe.title),
          onTap: () {
            close(context, recipe);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailScreen(recipe: recipe),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Recipe> suggestedRecipes = recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestedRecipes.length,
      itemBuilder: (context, index) {
        final recipe = suggestedRecipes[index];
        return ListTile(
          leading: Image.asset(
            recipe.imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(recipe.title),
          onTap: () {
            query = recipe.title;
            showResults(context);
          },
        );
      },
    );
  }
}
