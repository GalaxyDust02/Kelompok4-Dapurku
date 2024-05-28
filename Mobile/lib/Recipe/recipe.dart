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
    ],
  ),
  Recipe(
    imagePath: 'assets/images/brownies.png',
    title: 'Brownies Legit',
    author: 'Chef A',
    cookingTime: 30,
    serving: 12,
    ingredients: [
      '100 gr dark chocolate',
      '100 gr unsalted butter',
      '2 butir telur',
      '1 sdt vanilla extract',
      '1/2 cup gula pasir',
      '1/2 cup tepung terigu',
      '1/4 cup cocoa powder',
      '1/4 sdt garam',
    ],
    frostingIngredients: [],
    instructions: [
      'Lelehkan dark chocolate dan butter dalam panci bain marie atau microwave.',
      'Kocok telur dan gula pasir hingga mengembang.',
      'Campurkan adonan telur dengan lelehan coklat, lalu masukkan vanilla extract.',
      'Campurkan tepung terigu, cocoa powder, dan garam. Ayak dan masukkan ke dalam adonan coklat secara bertahap.',
      'Aduk rata hingga tercampur sempurna.',
      'Tuang adonan ke dalam loyang yang sudah diolesi minyak dan dialas kertas roti.',
      'Panggang dalam oven yang sudah dipanaskan dengan suhu 175 derajat Celcius selama 25-30 menit.',
      'Biarkan brownies dingin sebelum dipotong dan disajikan.'
    ],
    notes: 'Brownies yang lembut dan legit, cocok untuk teman ngopi atau teh.',
    reviews: [
      Review(
          name: 'John Doe',
          date: '10 Feb 2024',
          reviewText: 'Rasanya enak banget! Bikin ketagihan.',
          imagePath: 'assets/images/brownies.png',
          rating: 5),
    ],
  ),
  Recipe(
    imagePath: 'assets/images/cookies.png',
    title: 'Chocolate Chip Cookies',
    author: 'Baker B',
    cookingTime: 20,
    serving: 20,
    ingredients: [
      '1 cup unsalted butter',
      '1 cup granulated sugar',
      '1/2 cup packed brown sugar',
      '2 large eggs',
      '2 tsp vanilla extract',
      '2 1/4 cups all-purpose flour',
      '1 tsp baking soda',
      '1/2 tsp salt',
      '1 cup chocolate chips',
    ],
    frostingIngredients: [],
    instructions: [
      'Cream together butter and sugars until light and fluffy.',
      'Beat in eggs one at a time, then stir in vanilla extract.',
      'In a separate bowl, whisk together flour, baking soda, and salt.',
      'Gradually add dry ingredients to wet ingredients, mixing until just combined.',
      'Stir in chocolate chips.',
      'Drop by rounded tablespoons onto ungreased baking sheets.',
      'Bake in a preheated oven at 375 degrees F (190 degrees C) for 10-12 minutes.',
      'Let cookies cool on baking sheets for a few minutes before transferring to a wire rack to cool completely.',
    ],
    notes: 'Classic chocolate chip cookies, always a crowd-pleaser.',
    reviews: [
      Review(
          name: 'Jane Doe',
          date: '20 Feb 2024',
          reviewText: 'Cookiesnya lembut dan gurih, cocok banget buat cemilan.',
          imagePath: 'assets/images/cookies.png',
          rating: 4),
    ],
  ),
  Recipe(
    imagePath: 'assets/images/cake.png',
    title: 'Vanilla Cake',
    author: 'Chef C',
    cookingTime: 60,
    serving: 12,
    ingredients: [
      '2 1/4 cups all-purpose flour',
      '2 1/2 tsp baking powder',
      '1/2 tsp salt',
      '1 cup unsalted butter',
      '2 cups granulated sugar',
      '4 large eggs',
      '1 cup milk',
      '1 tsp vanilla extract',
    ],
    frostingIngredients: [
      '1 cup unsalted butter',
      '3 cups powdered sugar',
      '1/4 cup milk',
      '1 tsp vanilla extract',
    ],
    instructions: [
      'Preheat oven to 350 degrees F (175 degrees C). Grease and flour a 9x13 inch baking pan.',
      'In a medium bowl, whisk together flour, baking powder, and salt.',
      'In a large bowl, cream together butter and sugar until light and fluffy.',
      'Beat in eggs one at a time, then stir in vanilla extract.',
      'Gradually add dry ingredients to wet ingredients, alternating with milk, beginning and ending with dry ingredients.',
      'Beat until just combined.',
      'Pour batter into prepared baking pan.',
      'Bake in preheated oven for 30-35 minutes, or until a toothpick inserted into the center comes out clean.',
      'Let cake cool in pan for 10 minutes before inverting onto a wire rack to cool completely.',
      'Frost with vanilla buttercream frosting.',
    ],
    notes: 'A simple and delicious vanilla cake, perfect for any occasion.',
    reviews: [
      Review(
          name: 'Jack Doe',
          date: '1 Mar 2024',
          reviewText: 'Kuenya lembut dan manisnya pas, frostingnya juga enak.',
          imagePath: 'assets/images/cake.png',
          rating: 5),
    ],
  ),
  Recipe(
    imagePath: 'assets/images/pie.png',
    title: 'Apple Pie',
    author: 'Baker D',
    cookingTime: 60,
    serving: 8,
    ingredients: [
      '1 (9-inch) pie crust',
      '6 cups sliced apples (about 6 medium apples)',
      '1/2 cup granulated sugar',
      '1/4 cup packed brown sugar',
      '2 tbsp all-purpose flour',
      '1 tsp ground cinnamon',
      '1/4 tsp nutmeg',
      '1/4 cup butter, cut into small pieces',
    ],
    frostingIngredients: [],
    instructions: [
      'Preheat oven to 425 degrees F (220 degrees C).',
      'In a large bowl, combine sliced apples, sugars, flour, cinnamon, and nutmeg.',
      'Pour apple mixture into pie crust.',
      'Dot with butter pieces.',
      'Bake in preheated oven for 15 minutes.',
      'Reduce oven temperature to 375 degrees F (190 degrees C).',
      'Bake for another 30-40 minutes, or until crust is golden brown and filling is bubbly.',
      'Let pie cool completely before serving.',
    ],
    notes: 'A classic apple pie recipe, perfect for fall.',
    reviews: [
      Review(
          name: 'Jill Doe',
          date: '5 Mar 2024',
          reviewText:
              'Apple pie-nya enak banget! Crustnya renyah, fillingnya manis dan asam.',
          imagePath: 'assets/images/pie.png',
          rating: 4),
    ],
  ),
  Recipe(
    imagePath: 'assets/images/pancakes.png',
    title: 'Fluffy Pancakes',
    author: 'Chef E',
    cookingTime: 20,
    serving: 4,
    ingredients: [
      '1 1/2 cups all-purpose flour',
      '2 tbsp sugar',
      '2 tsp baking powder',
      '1/2 tsp salt',
      '1 large egg',
      '1 1/4 cups milk',
      '2 tbsp melted butter',
    ],
    frostingIngredients: [],
    instructions: [
      'In a large bowl, whisk together flour, sugar, baking powder, and salt.',
      'In a separate bowl, whisk together egg, milk, and melted butter.',
      'Pour wet ingredients into dry ingredients and stir until just combined. Do not overmix.',
      'Heat a lightly oiled griddle or skillet over medium heat.',
      'Pour 1/4 cup batter onto hot griddle for each pancake.',
      'Cook for 2-3 minutes per side, or until golden brown and cooked through.',
      'Serve immediately with your favorite toppings.',
    ],
    notes: 'Fluffy and delicious pancakes, perfect for breakfast or brunch.',
    reviews: [
      Review(
          name: 'Ken Doe',
          date: '10 Mar 2024',
          reviewText: 'Pancakesnya lembut dan fluffy, rasanya enak banget!',
          imagePath: 'assets/images/pancakes.png',
          rating: 5),
    ],
  ),
  Recipe(
    imagePath: 'assets/images/pizza.png',
    title: 'Homemade Pizza',
    author: 'Baker F',
    cookingTime: 45,
    serving: 4,
    ingredients: [
      '1 (14 oz) package pizza dough',
      '1 cup pizza sauce',
      '1 cup shredded mozzarella cheese',
      '1/2 cup pepperoni slices',
      '1/4 cup sliced mushrooms',
      '1/4 cup sliced onions',
    ],
    frostingIngredients: [],
    instructions: [
      'Preheat oven to 450 degrees F (230 degrees C).',
      'Roll out pizza dough onto a lightly floured surface to a 12-inch circle.',
      'Place dough on a baking sheet.',
      'Spread pizza sauce over dough, leaving a 1/2 inch border.',
      'Top with mozzarella cheese, pepperoni, mushrooms, and onions.',
      'Bake in preheated oven for 12-15 minutes, or until crust is golden brown and cheese is melted and bubbly.',
      'Let cool for a few minutes before slicing and serving.',
    ],
    notes: 'A simple and delicious homemade pizza recipe.',
    reviews: [
      Review(
          name: 'Lisa Doe',
          date: '15 Mar 2024',
          reviewText:
              'Pizza-nya enak banget! Crustnya renyah, toppingnya banyak.',
          imagePath: 'assets/images/pizza.png',
          rating: 4),
    ],
  ),
  Recipe(
    imagePath: 'assets/images/pasta.png',
    title: 'Spaghetti with Tomato Sauce',
    author: 'Chef G',
    cookingTime: 30,
    serving: 4,
    ingredients: [
      '1 lb spaghetti',
      '1 tbsp olive oil',
      '1 onion, chopped',
      '2 cloves garlic, minced',
      '1 (28 oz) can crushed tomatoes',
      '1 (15 oz) can tomato sauce',
      '1 tsp dried oregano',
      '1/2 tsp salt',
      '1/4 tsp black pepper',
      '1/4 cup grated Parmesan cheese',
    ],
    frostingIngredients: [],
    instructions: [
      'Cook spaghetti according to package directions.',
      'While spaghetti is cooking, heat olive oil in a large saucepan over medium heat.',
      'Add onion and cook until softened, about 5 minutes.',
      'Stir in garlic and cook for 1 minute more.',
      'Add crushed tomatoes, tomato sauce, oregano, salt, and pepper.',
      'Bring to a simmer and cook for 15 minutes, stirring occasionally.',
      'Drain spaghetti and add to tomato sauce.',
      'Toss to combine.',
      'Serve immediately with grated Parmesan cheese.',
    ],
    notes:
        'A classic and comforting spaghetti recipe with a simple tomato sauce.',
    reviews: [
      Review(
          name: 'Mark Doe',
          date: '20 Mar 2024',
          reviewText: 'Spaghettinya enak! Saus tomatanya gurih dan asam.',
          imagePath: 'assets/images/pasta.png',
          rating: 5),
    ],
  ),
  Recipe(
    imagePath: 'assets/images/salad.png',
    title: 'Caesar Salad',
    author: 'Baker H',
    cookingTime: 15,
    serving: 4,
    ingredients: [
      '1 head romaine lettuce, chopped',
      '1/2 cup grated Parmesan cheese',
      '1/4 cup croutons',
      '1/4 cup Caesar dressing',
    ],
    frostingIngredients: [],
    instructions: [
      'In a large bowl, combine chopped romaine lettuce, grated Parmesan cheese, and croutons.',
      'Pour Caesar dressing over salad and toss to combine.',
      'Serve immediately.',
    ],
    notes:
        'A classic Caesar salad recipe, perfect for a light lunch or dinner.',
    reviews: [
      Review(
          name: 'Nancy Doe',
          date: '25 Mar 2024',
          reviewText: 'Caesar saladnya segar dan enak! Dressingnya pas.',
          imagePath: 'assets/images/salad.png',
          rating: 4),
    ],
  ),
  Recipe(
    imagePath: 'assets/images/soup.png',
    title: 'Tomato Soup',
    author: 'Chef I',
    cookingTime: 45,
    serving: 4,
    ingredients: [
      '1 tbsp olive oil',
      '1 onion, chopped',
      '2 cloves garlic, minced',
      '1 (28 oz) can crushed tomatoes',
      '4 cups chicken broth',
      '1 tsp dried oregano',
      '1/2 tsp salt',
      '1/4 tsp black pepper',
      '1/2 cup heavy cream (optional)',
    ],
    frostingIngredients: [],
    instructions: [
      'Heat olive oil in a large saucepan over medium heat.',
      'Add onion and cook until softened, about 5 minutes.',
      'Stir in garlic and cook for 1 minute more.',
      'Add crushed tomatoes, chicken broth, oregano, salt, and pepper.',
      'Bring to a simmer and cook for 20 minutes, stirring occasionally.',
      'If desired, stir in heavy cream.',
      'Serve hot.',
    ],
    notes: 'A classic and comforting tomato soup recipe.',
    reviews: [
      Review(
          name: 'Oliver Doe',
          date: '30 Mar 2024',
          reviewText: 'Tomato soupnya enak! Gurih dan asam.',
          imagePath: 'assets/images/soup.png',
          rating: 5),
    ],
  ),
];
