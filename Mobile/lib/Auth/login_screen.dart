import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../main.dart'; // Import layar home
import 'forgot_password_screen.dart'; // Import layar lupa kata sandi
import 'register_screen.dart'; // Import layar daftar

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

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      // Simulasikan proses login (ganti dengan logika Anda)
      await Future.delayed(const Duration(seconds: 1)); // Simulasi delay

      // Periksa apakah login berhasil (ganti dengan logika Anda)
      bool loginSuccess = true; // Ganti dengan hasil pemeriksaan login

      if (loginSuccess) {
        // Login berhasil, navigasi ke HomeWidget
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      } else {
        // Login gagal, tampilkan pesan error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Login gagal. Periksa kembali email dan kata sandi Anda.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // Agar keyboard tidak menutupi tombol
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
                      // Navigasi ke layar lupa kata sandi
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
                  onPressed: _handleLogin, // Panggil fungsi _handleLogin
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(
                        230, 131, 43, 1), // Warna RGB(230, 131, 43)
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
                    // Icon One X
                    InkWell(
                      child: Image.asset(
                        'assets/images/twitter.png', // Ganti path gambar
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Icon Facebook
                    InkWell(
                      child: Image.asset(
                        'assets/images/facebook.png', // Ganti path gambar
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Icon Google
                    InkWell(
                      child: Image.asset(
                        'assets/images/google.png', // Ganti path gambar
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Navigasi ke layar daftar
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
}
