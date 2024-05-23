import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import 'login_screen.dart';
import 'reset_password_success_screen.dart';
import 'register_screen.dart';
import 'reset_password_screen.dart';
import 'homePage.dart';
import 'Detailmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dapurku',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //Routing ke halaman login
      initialRoute: '/login', // Atur halaman awal di sini
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
        '/password-reset-success': (context) =>
            const PasswordResetSuccessScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

// class AddMenuWidget extends StatelessWidget {
//   const AddMenuWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Kode untuk halaman "Add Menu" Anda
//     return const Center(
//       child: Text('Ini adalah halaman Add Menu'),
//     );
//   }
// }

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Kode untuk halaman "Profile" Anda
    return const Center(
      child: Text('Ini adalah halaman Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex =
      0; // Menambahkan variabel untuk menyimpan index halaman yang sedang aktif

  // Menambahkan fungsi untuk mengubah index halaman yang sedang aktif
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Menambahkan daftar widget untuk setiap halaman
  final List<Widget> _widgetOptions = <Widget>[
    const HomeWidget(title: 'Home Page'),
    const DetailWidget(),
    const ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(
          _selectedIndex), // Menampilkan widget berdasarkan index yang sedang aktif
      bottomNavigationBar: BottomNavigationBar(
        // Menambahkan BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
