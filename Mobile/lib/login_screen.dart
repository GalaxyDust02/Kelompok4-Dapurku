import 'package:apk/homePage.dart';
import 'package:apk/main.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

// Import halaman lain
import 'forgot_password_screen.dart';
import 'register_screen.dart';
import 'homepage.dart'; // Import halaman utama (Home Screen)

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  'assets/images/logo.png', // Ganti dengan path logo Anda
                  height: 100,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan email Anda';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Masukkan email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Kata Sandi',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan kata sandi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Lupa kata sandi?',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigasi ke halaman utama (HomeScreen) setelah validasi berhasil
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Atau masuk dengan'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tombol login dengan Twitter
                    InkWell(
                      onTap: () {
                        // Tambahkan logika login dengan Twitter di sini
                        // Contoh:
                        _loginWithTwitter();
                      },
                      child: Image.asset(
                        'assets/images/twitter.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Tombol login dengan Facebook
                    InkWell(
                      onTap: () {
                        // Tambahkan logika login dengan Facebook di sini
                        // Contoh:
                        _loginWithFacebook();
                      },
                      child: Image.asset(
                        'assets/images/facebook.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Tombol login dengan Google
                    InkWell(
                      onTap: () {
                        // Tambahkan logika login dengan Google di sini
                        // Contoh:
                        _loginWithGoogle();
                      },
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Belum punya akun? Daftar',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi contoh untuk login dengan Twitter
  void _loginWithTwitter() {
    // Tambahkan logika login dengan Twitter di sini
  }

  // Fungsi contoh untuk login dengan Facebook
  void _loginWithFacebook() {
    // Tambahkan logika login dengan Facebook di sini
  }

  // Fungsi contoh untuk login dengan Google
  void _loginWithGoogle() {
    // Tambahkan logika login dengan Google di sini
  }
}
