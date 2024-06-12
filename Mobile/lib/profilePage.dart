import 'package:apk/Recipe/recipe.dart';
import 'package:apk/Recipe/recipe_detail_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Nama Pengguna';
  List<Menu> _myMenus = [];
  List<Recipe> _bookmarkedRecipes = [];

  // Fungsi untuk menampilkan popup edit nama
  void _showEditNameDialog() {
    TextEditingController _nameController = TextEditingController(text: _name);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Nama'),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nama Baru'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _name = _nameController.text;
                });
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menambahkan menu baru (contoh sederhana)
  void _addMenu(BuildContext context) async {
    String? namaMenu;
    String? durasiMenu;
    String? porsiMenu;

    await showDialog<Map<String, String>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambahkan Menu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Nama Menu'),
                onChanged: (value) {
                  namaMenu = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Durasi'),
                onChanged: (value) {
                  durasiMenu = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Porsi'),
                onChanged: (value) {
                  porsiMenu = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                if (namaMenu != null &&
                    durasiMenu != null &&
                    porsiMenu != null) {
                  setState(() {
                    _myMenus.add(Menu(
                        nama: namaMenu!,
                        durasi: durasiMenu!,
                        porsi: porsiMenu!));
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Tambahkan'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk toggle bookmark
  void _toggleBookmark(Recipe recipe) {
    if (_bookmarkedRecipes.contains(recipe)) {
      setState(() {
        _bookmarkedRecipes.remove(recipe);
      });
    } else {
      setState(() {
        _bookmarkedRecipes.add(recipe);
      });
    }
  }

  // Fungsi untuk menghapus akun
  Future<void> _deleteAccount() async {
    // Tampilkan dialog konfirmasi
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Penghapusan Akun'),
          content: const Text('Apakah Anda yakin ingin menghapus akun ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      // Simulasikan penghapusan akun dengan delay
      await Future.delayed(const Duration(seconds: 2));
      // Tampilkan pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Akun berhasil dihapus!')),
      );
      // Navigasi ke halaman lain (misalnya halaman login)
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              ProfileHeader(
                name: _name,
                onTap: _showEditNameDialog,
              ),
              const SizedBox(height: 20),

              // Menu Lainnya
              _buildMenuItem(Icons.menu, 'ResepKu', onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyMenuPage(menus: _myMenus)),
                );
              }),
              _buildMenuItem(Icons.bookmark, 'List Bookmark', onTap: () {
                // Navigasi ke halaman bookmark
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BookmarkPage(bookmarkedRecipes: _bookmarkedRecipes)),
                );
              }),
              _buildMenuItem(Icons.delete, 'Hapus akun', onTap: _deleteAccount),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;

  ProfileHeader({
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: Text(
                  name.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: const Color.fromRGBO(
                    230, 131, 43, 1), // Warna latar belakang circle avatar
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4), // Jarak antara nama dan keterangan
                  Text(
                    'Klik nama untuk merubah',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyMenuPage extends StatelessWidget {
  final List<Menu> menus;

  const MyMenuPage({Key? key, required this.menus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResepKu'),
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menus[index].nama),
            subtitle: Text(
                'Durasi: ${menus[index].durasi}, Porsi: ${menus[index].porsi}'),
          );
        },
      ),
    );
  }
}

// Model Data untuk Menu
class Menu {
  final String nama;
  final String durasi;
  final String porsi;

  Menu({required this.nama, required this.durasi, required this.porsi});
}

// Halaman Bookmark
class BookmarkPage extends StatelessWidget {
  final List<Recipe> bookmarkedRecipes;

  const BookmarkPage({Key? key, required this.bookmarkedRecipes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: bookmarkedRecipes.isEmpty
          ? const Center(child: Text('Tidak ada bookmark'))
          : ListView.builder(
              itemCount: bookmarkedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = bookmarkedRecipes[index];
                return ListTile(
                  leading: Image.asset(recipe.imagePath),
                  title: Text(recipe.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(
                          recipe: recipe,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
