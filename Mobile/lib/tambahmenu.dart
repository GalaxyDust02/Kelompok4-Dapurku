import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';

class TambahMenuPage extends StatefulWidget {
  @override
  _TambahMenuPageState createState() => _TambahMenuPageState();
}

class _TambahMenuPageState extends State<TambahMenuPage> {
  final _formKey = GlobalKey<FormState>();
  String? _judul;
  String? _porsi;
  String? _lamaMemasak;
  final List<String> _bahan = [];
  final List<String> _caraMembuat = [];
  final List<String> _catatan = [];
  XFile? _image;
  final TextEditingController _catatanController = TextEditingController();
  final TextEditingController _bahanController = TextEditingController();
  final TextEditingController _caraMembuatController = TextEditingController();

  void _selectImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        setState(() {
          _image = image;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _addBahan(String bahan) {
    setState(() {
      _bahan.add(bahan);
      _bahanController
          .clear(); // Bersihkan text field setelah menambahkan bahan
    });
  }

  void _removeBahan(int index) {
    setState(() {
      _bahan.removeAt(index);
    });
  }

  void _addCaraMembuat(String cara) {
    setState(() {
      _caraMembuat.add(cara);
      _caraMembuatController
          .clear(); // Bersihkan text field setelah menambahkan cara membuat
    });
  }

  void _removeCaraMembuat(int index) {
    setState(() {
      _caraMembuat.removeAt(index);
    });
  }

  void _addCatatan(String catatan) {
    setState(() {
      _catatan.add(catatan);
      _catatanController
          .clear(); // Bersihkan text field setelah menambahkan catatan
    });
  }

  void _removeCatatan(int index) {
    setState(() {
      _catatan.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.camera_alt),
                            title: Text('Ambil dari Kamera'),
                            onTap: () {
                              _selectImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.photo),
                            title: Text('Pilih dari Galeri'),
                            onTap: () {
                              _selectImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                      border: _image != null
                          ? null
                          : Border.all(color: Colors.grey),
                    ),
                    child: _image != null
                        ? Image.file(
                            File(_image!
                                .path), // Ubah _image!.path menjadi File(_image!.path)
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.grey[600],
                          ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Tambahkan foto resep',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Foto hasil akhir masakanmu',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Judul',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _judul = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Porsi',
                ),
                onSaved: (value) {
                  _porsi = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Lama Memasak',
                ),
                onSaved: (value) {
                  _lamaMemasak = value;
                },
              ),
              SizedBox(height: 32),
              Text(
                'Bahan-bahan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Inputan bahan
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _bahanController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan bahan...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      _addBahan(_bahanController.text);
                    },
                    child: Text('Tambahkan'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Menampilkan daftar bahan yang sudah ditambahkan
              _buildIngredientList(),
              SizedBox(height: 32),
              Text(
                'Cara Membuat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Inputan langkah cara membuat
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _caraMembuatController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan langkah...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      _addCaraMembuat(_caraMembuatController.text);
                    },
                    child: Text('Tambahkan'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Menampilkan daftar cara membuat yang sudah ditambahkan
              _buildCaraMembuatList(),
              SizedBox(height: 32),
              Text(
                'Catatan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // Menggunakan TextFormField untuk kolom catatan
              TextFormField(
                controller: _catatanController,
                decoration: InputDecoration(
                  hintText: 'Tulis catatan tambahan...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 16),
              // Button untuk menambahkan catatan
              ElevatedButton(
                onPressed: () {
                  _addCatatan(_catatanController.text);
                },
                child: Text('Tambahkan Catatan'),
              ),
              SizedBox(height: 16),
              // Menampilkan daftar catatan yang sudah ditambahkan
              _buildCatatanList(),
              SizedBox(height: 32), // Jarak antara catatan dan button publish
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 16), // Padding button
                  child: Text('Publish',
                      style: TextStyle(fontSize: 18)), // Ukuran text button
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(
                      230, 131, 43, 1), // Warna RGB(230, 131, 43)
                  minimumSize: Size(double.infinity, 50), // Ukuran button
                ),
              ),
              SizedBox(height: 16), // Jarak bawah button publish
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _bahan.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.check_circle),
          title: Text(_bahan[index]),
          trailing: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _removeBahan(index);
            },
          ),
        );
      },
    );
  }

  Widget _buildCaraMembuatList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _caraMembuat.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.sort),
          title: Text(_caraMembuat[index]),
          trailing: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _removeCaraMembuat(index);
            },
          ),
        );
      },
    );
  }

  Widget _buildCatatanList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _catatan.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.note),
          title: Text(_catatan[index]),
          trailing: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _removeCatatan(index);
            },
          ),
        );
      },
    );
  }
}
