import 'package:flutter/material.dart';
import 'Recipe/recipe.dart';
import 'Recipe/recipe_screen.dart';
import 'Recipe/recipe_search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const RecipeScreen(), // Pastikan RecipeScreen() ada di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Resep'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: Image.asset('assets/images/logo.png'),
                  ), // Replace with your logo path
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari resep di sini',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      onSubmitted: (query) {
                        showSearch(
                          context: context,
                          delegate: RecipeSearchDelegate(recipes: recipes),
                          query: query,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _widgetOptions[_selectedIndex], // Gunakan _selectedIndex
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
