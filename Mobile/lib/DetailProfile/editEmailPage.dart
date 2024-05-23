import 'package:flutter/material.dart';

void main() {
  runApp(EditEmailPage(onEmailChanged: (newEmail) {}));
}

class EditEmailPage extends StatefulWidget {
  final ValueChanged<String> onEmailChanged;

  const EditEmailPage({
    super.key,
    required this.onEmailChanged,
  });

  @override
  _EditEmailPageState createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Baru',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_emailController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Email tidak boleh kosong.'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  widget.onEmailChanged(_emailController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
