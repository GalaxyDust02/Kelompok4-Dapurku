import 'package:flutter/material.dart';
import 'home_page.dart'; // Import home_page.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personalize Your Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Personalize Your Food'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedPreference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose your preference:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text('Vegan'),
                  value: 'Vegan',
                  groupValue: _selectedPreference,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPreference = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Gourmet'),
                  value: 'Gourmet',
                  groupValue: _selectedPreference,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPreference = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Mix'),
                  value: 'Mix',
                  groupValue: _selectedPreference,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPreference = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Periksa apakah preferensi sudah dipilih
                if (_selectedPreference != null) {
                  // Navigasi ke halaman HomePage (ganti halaman sebelumnya)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomePage(), // Ganti DashboardPage dengan HomePage
                    ),
                  );
                } else {
                  // Tampilkan pesan error jika preferensi belum dipilih
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please choose a preference')),
                  );
                }
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
