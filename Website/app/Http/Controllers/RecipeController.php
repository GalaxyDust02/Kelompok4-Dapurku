<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Recipe;
use App\Http\Requests\CreateRecipeRequest;
use App\Http\Requests\UpdateRecipeRequest;
use Illuminate\Support\Facades\Storage; // Add this for file deletion

class RecipeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except(['index', 'show']);
    }

    public function index()
    {
        $recipes = Recipe::latest()->paginate(10);
        return view('recipes.index', compact('recipes'));
    }

    public function show(Recipe $recipe)
    {
        return view('recipes.show', compact('recipe'));
    }

    public function create()
    {
        return view('recipes.create');
    }

    public function store(CreateRecipeRequest $request)
    {
        $recipeData = $request->validated();

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('recipe_images', 'public');
            $recipeData['image'] = $imagePath;
        }

        $recipeData['user_id'] = auth()->id();
        $recipe = Recipe::create($recipeData);

        return redirect()->route('recipes.show', $recipe)->with('success', 'Resep berhasil ditambahkan!');
    }

    public function edit(Recipe $recipe)
    {
        // Make sure only the recipe owner can edit
        $this->authorize('update', $recipe);

        return view('recipes.edit', compact('recipe'));
    }

    public function update(UpdateRecipeRequest $request, Recipe $recipe)
    {
        // Authorization
        $this->authorize('update', $recipe);

        $recipeData = $request->validated();

        // Handle image update
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($recipe->image) {
                Storage::disk('public')->delete($recipe->image);
            }

            $imagePath = $request->file('image')->store('recipe_images', 'public');
            $recipeData['image'] = $imagePath;
        }

        $recipe->update($recipeData);

        return redirect()->route('recipes.show', $recipe)->with('success', 'Resep berhasil diperbarui!');
    }

    public function destroy(Recipe $recipe)
    {
        // Authorization
        $this->authorize('delete', $recipe);

        // Delete the image associated with the recipe
        if ($recipe->image) {
            Storage::disk('public')->delete($recipe->image);
        }

        $recipe->delete();

        return redirect()->route('recipes.index')->with('success', 'Resep berhasil dihapus!');
    }
}
