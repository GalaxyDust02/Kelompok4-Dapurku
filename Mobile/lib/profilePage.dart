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
  String _email = 'email@example.com';
  List<Menu> _myMenus = []; // List untuk menyimpan data menu
  String? _currentPassword; // Variabel untuk password saat ini
  final _formKey = GlobalKey<FormState>(); // Key untuk form edit password
  bool _isLoading = false; // Variabel untuk loading indicator
  List<Recipe> _bookmarkedRecipes = []; // List untuk bookmark

  void _updateName(String newName) {
    setState(() {
      _name = newName;
    });
  }

  void _updateEmail(String newEmail) {
    setState(() {
      _email = newEmail;
    });
  }

  Future<void> _showEditDialog(BuildContext context, String title,
      String initialValue, Function(String) onSave) async {
    String newValue = initialValue;
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: TextEditingController(text: initialValue),
            onChanged: (value) {
              newValue = value;
            },
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
                onSave(newValue);
                Navigator.of(context).pop();
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

  // Fungsi untuk edit password
  Future<void> _editPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      // Simulasikan update password dengan delay
      await Future.delayed(const Duration(seconds: 2));
      // Reset form dan loading
      _formKey.currentState!.reset();
      setState(() {
        _isLoading = false;
      });
      // Tampilkan pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password berhasil diubah!')),
      );
    }
  }

  // Fungsi untuk hapus akun
  Future<void> _deleteAccount() async {
    // Simulasikan penghapusan akun dengan delay
    await Future.delayed(const Duration(seconds: 2));
    // Tampilkan pesan sukses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Akun berhasil dihapus!')),
    );
    // Navigasi ke halaman lain (misalnya halaman login)
    Navigator.pushReplacementNamed(context, '/login');
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

  String? _newPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          ProfileHeader(
            name: _name,
            email: _email,
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(Icons.menu, 'My Menu', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyMenuPage(menus: _myMenus)),
                  );
                }),
                _buildMenuItem(Icons.edit, 'Edit Name',
                    onTap: () => _showEditDialog(
                        context, 'Edit Name', _name, _updateName)),
                _buildMenuItem(Icons.email, 'Edit Email',
                    onTap: () => _showEditDialog(
                        context, 'Edit Email', _email, _updateEmail)),
                _buildMenuItem(Icons.lock, 'Edit Password', onTap: () {
                  // Tampilkan dialog untuk edit password
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Edit Password'),
                        content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Password Saat Ini',
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Masukkan password saat ini';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _currentPassword = value;
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Password Baru',
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Masukkan password baru';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _newPassword = value;
                                },
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Batal'),
                          ),
                          ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () {
                                    _formKey.currentState!.save();
                                    _editPassword();
                                  },
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text('Simpan'),
                          ),
                        ],
                      );
                    },
                  );
                }),
                _buildMenuItem(Icons.delete, 'Hapus akun',
                    onTap: _deleteAccount),
                _buildMenuItem(Icons.bookmark, 'List Bookmark', onTap: () {
                  // Navigasi ke halaman bookmark
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookmarkPage(
                            bookmarkedRecipes: _bookmarkedRecipes)),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addMenu(context); // Panggil fungsi untuk menambah menu
        },
        child: const Icon(Icons.add),
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
  final String email;

  ProfileHeader({
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
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
            backgroundColor:
                Colors.orange, // Warna latar belakang circle avatar
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
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
        title: const Text('My Menu'),
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
