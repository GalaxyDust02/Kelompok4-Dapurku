import 'package:apk/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

void main() {
  runApp(const HomeWidget(title: 'Home Page'));
}

class HomeWidget extends StatefulWidget {
  final String title;
  const HomeWidget({super.key, required this.title});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _items =
      List<String>.generate(14, (index) => 'Item $index');

  Widget categoryWidget(String category) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        category,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: "Cari resep",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 500, // Atur tinggi sesuai kebutuhan
            child: GridView.count(
              crossAxisCount: 2,
              children: _items
                  .where((item) => item
                      .toLowerCase()
                      .contains(_searchController.text.toLowerCase()))
                  .map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(item: item)),
                    );
                  },
                  child: Center(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: RecipeScreen()),
    );
  }
}
