import 'package:flutter/material.dart';
import 'Auth/forgot_password_screen.dart';
import 'Auth/login_screen.dart';
import 'Auth/reset_password_success_screen.dart';
import 'Auth/register_screen.dart';
import 'Auth/reset_password_screen.dart';
import 'home_page.dart';
import 'profilePage.dart'; // Import ProfilePage
import 'tambahmenu.dart';
import 'splash_screen.dart'; // Import SplashScreen

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
        // Define your custom color for the bottom navigation bar
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor:
              Color.fromRGBO(230, 131, 43, 1), // RGB(230, 131, 43)
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // Set SplashScreen as initial route
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
        '/password-reset-success': (context) =>
            const PasswordResetSuccessScreen(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    TambahMenuPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
            BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Beranda'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_box), label: 'Tambah Resep'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profil'),
              ],
              currentIndex: _selectedIndex,
              // Selected item color is already defined in ThemeData
              onTap: _onItemTapped,
            ),
          ],
        ),
      ),
    );
  }
}
