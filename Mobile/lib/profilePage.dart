import 'package:flutter/material.dart';
import 'DetailProfile/editNamePage.dart';
import 'DetailProfile/editEmailPage.dart';

void main() {
  runApp(const ProfileWidget());
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfilePage(),
        '/my_menu': (context) => const MyMenuPage(),
        '/guide': (context) => const GuidePage(),
        '/edit_name': (context) => EditNamePage(onNameChanged: (newName) {}),
        '/edit_email': (context) =>
            EditEmailPage(onEmailChanged: (newEmail) {}),
        '/edit_photo': (context) => const EditPhotoPage(),
        '/edit_password': (context) => const EditPasswordPage(),
        '/delete_account': (context) => const DeleteAccountPage(),
        '/bookmarks': (context) => const BookmarksPage(),
      },
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Nama Pengguna';
  String _email = 'email@example.com';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProfileHeader(name: _name, email: _email),
          Divider(),
          ProfileOption(
            icon: Icons.menu,
            title: 'My Menu',
            route: '/my_menu',
            onTap: () {
              Navigator.pushNamed(context, '/my_menu');
            },
          ),
          ProfileOption(
            icon: Icons.menu_book,
            title: 'Panduan',
            route: '/guide',
            onTap: () {
              Navigator.pushNamed(context, '/guide');
            },
          ),
          ProfileOption(
            icon: Icons.edit,
            title: 'Edit Name',
            route: '/edit_name',
            onTap: () async {
              final newName = await Navigator.pushNamed(context, '/edit_name');
              if (newName is String && newName.isNotEmpty) {
                _updateName(newName);
              }
            },
          ),
          ProfileOption(
            icon: Icons.email,
            title: 'Edit Email',
            route: '/edit_email',
            onTap: () async {
              final newEmail =
                  await Navigator.pushNamed(context, '/edit_email');
              if (newEmail is String && newEmail.isNotEmpty) {
                _updateEmail(newEmail);
              }
            },
          ),
          ProfileOption(
            icon: Icons.photo,
            title: 'Edit Photo',
            route: '/edit_photo',
            onTap: () {
              Navigator.pushNamed(context, '/edit_photo');
            },
          ),
          ProfileOption(
            icon: Icons.lock,
            title: 'Edit Password',
            route: '/edit_password',
            onTap: () {
              Navigator.pushNamed(context, '/edit_password');
            },
          ),
          ProfileOption(
            icon: Icons.delete,
            title: 'Hapus akun',
            route: '/delete_account',
            onTap: () {
              Navigator.pushNamed(context, '/delete_account');
            },
          ),
          ProfileOption(
            icon: Icons.bookmark,
            title: 'List Bookmark',
            route: '/bookmarks',
            onTap: () {
              Navigator.pushNamed(context, '/bookmarks');
            },
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  ProfileHeader({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
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

// class ProfileModel with ChangeNotifier {
//   String _name = 'Nama Pengguna';
//   String _email = 'email@example.com';

//   String get name => _name;
//   String get email => _email;

//   set name(String newName) {
//     _name = newName;
//     notifyListeners();
//   }

//   set email(String newEmail) {
//     _email = newEmail;
//     notifyListeners();
//   }
// }

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;
  final VoidCallback? onTap;

  const ProfileOption({
    required this.icon,
    required this.title,
    required this.route,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panduan')),
      body: const Center(child: Text('Halaman Panduan')),
    );
  }
}

// class EditNamePage extends StatelessWidget {
//   const EditNamePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Edit Name')),
//       body: const Center(child: Text('Halaman Edit Name')),
//     );
//   }
// }

// class EditEmailPage extends StatelessWidget {
//   const EditEmailPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Edit Email')),
//       body: const Center(child: Text('Halaman Edit Email')),
//     );
//   }
// }

class EditPhotoPage extends StatelessWidget {
  const EditPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Photo')),
      body: const Center(child: Text('Halaman Edit Photo')),
    );
  }
}

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Password')),
      body: const Center(child: Text('Halaman Edit Password')),
    );
  }
}

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hapus Akun')),
      body: const Center(child: Text('Halaman Hapus Akun')),
    );
  }
}

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Bookmark')),
      body: const Center(child: Text('Halaman List Bookmark')),
    );
  }
}

class MyMenuPage extends StatelessWidget {
  const MyMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Menu')),
      body: const Center(child: Text('Halaman My Menu')),
    );
  }
}
