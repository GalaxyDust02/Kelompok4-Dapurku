import 'package:flutter/material.dart';
import 'Detailmenu.dart';

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
  final List<String> _items = List<String>.generate(14, (index) => 'Item $index');

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
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text('KA'),
            ),
          ),
        ],
      ),
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
                labelText: "Cari resep, bahan, dll...",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                // Category widgets
                categoryWidget('tumis'),
                categoryWidget('daging sapi'),
                categoryWidget('mie telur'),
                // Add more categories as needed
              ],
            ),
          ),
          SizedBox(
            height: 500, // Atur tinggi sesuai kebutuhan
            child: GridView.count(
              crossAxisCount: 2,
              children: _items
                  .where((item) => item.toLowerCase().contains(_searchController.text.toLowerCase()))
                  .map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(item: item)),
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
      appBar: AppBar(
        title: Text('Detail $item'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text('KA'),
            ),
          ),
        ],
      ),
      body: const Center(
        child: DetailWidget()
      ),
    );
  }
}