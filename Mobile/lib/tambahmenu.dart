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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Simpan'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Terbitkan'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
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
                            _image!.path as File,
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
              _buildIngredientList(),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Tambah Bahan'),
                            content: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Masukkan bahan',
                              ),
                              onSaved: (value) {
                                _addBahan(value!);
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _formKey.currentState!.save();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Tambahkan'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.add),
                      label: Text('Bahan'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Text(
                'Cara Membuat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildCaraMembuatList(),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Tambah Cara Membuat'),
                            content: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Masukkan langkah',
                              ),
                              onSaved: (value) {
                                _addCaraMembuat(value!);
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _formKey.currentState!.save();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Tambahkan'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.add),
                      label: Text('Langkah'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Text(
                'Catatan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildCatatanList(),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Tambah Catatan'),
                            content: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Masukkan catatan',
                              ),
                              onSaved: (value) {
                                _addCatatan(value!);
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _formKey.currentState!.save();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Tambahkan'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.add),
                      label: Text('Catatan'),
                    ),
                  ),
                ],
              ),
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
        return Dismissible(
          key: Key(_bahan[index]),
          onDismissed: (direction) {
            _removeBahan(index);
          },
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(Icons.more_vert, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _bahan[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Icon(Icons.drag_handle),
              ],
            ),
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
        return Dismissible(
          key: Key(_caraMembuat[index]),
          onDismissed: (direction) {
            _removeCaraMembuat(index);
          },
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(Icons.more_vert, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _caraMembuat[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Icon(Icons.drag_handle),
              ],
            ),
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
        return Dismissible(
          key: Key(_catatan[index]),
          onDismissed: (direction) {
            _removeCatatan(index);
          },
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(Icons.more_vert, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _catatan[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Icon(Icons.drag_handle),
              ],
            ),
          ),
        );
      },
    );
  }
}
