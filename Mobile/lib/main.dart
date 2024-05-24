import 'package:flutter/material.dart';

import 'forgot_password_screen.dart';
import 'login_screen.dart';
import 'reset_password_success_screen.dart';
import 'register_screen.dart';
import 'reset_password_screen.dart';
import 'homePage.dart'; // Import halaman HomeWidget
import 'HomeDetailMenu/Detailmenu.dart'; // Import halaman DetailWidget
import 'profilePage.dart'; // Import halaman ProfileWidget

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
      initialRoute: '/login', // Halaman awal adalah LoginScreen
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
        '/password-reset-success': (context) =>
            const PasswordResetSuccessScreen(),
        '/home': (context) =>
            const MyHomePage(), // Tambahkan route untuk MyHomePage
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Indeks halaman aktif

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Widget untuk setiap halaman
  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(title: 'Home Page'),
    DetailWidget(), // Contoh halaman Detail, ganti dengan halaman Anda
    ProfileWidget(), // Contoh halaman Profile, ganti dengan halaman Anda
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dapurku'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Add Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange, // Sesuaikan warna tema
        onTap: _onItemTapped,
      ),
    );
  }
}
