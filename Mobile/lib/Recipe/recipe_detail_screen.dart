import 'package:flutter/material.dart';
import 'recipe.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:share_plus/share_plus.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int _rating = 0;
  String _comment = '';
  File? _selectedImage;
  bool _isBookmarked = false; // Variabel untuk bookmark

  // Fungsi untuk memilih gambar dari galeri atau kamera
  Future<void> _getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  // Fungsi untuk berbagi resep
  void _shareRecipe() async {
    await Share.share(
      '${widget.recipe.title}\n'
      '${widget.recipe.imagePath}\n'
      '${widget.recipe.author}\n',
      subject: 'Resep: ${widget.recipe.title}',
    );
  }

  // Fungsi untuk toggle bookmark
  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    // TODO: Simpan status bookmark ke database atau penyimpanan lokal
  }

  // Fungsi untuk menyimpan rating dan komentar
  void _saveRatingAndComment() {
    // Validasi jika komentar kosong
    if (_comment.isEmpty) {
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Komentar tidak boleh kosong')),
      );
      return;
    }

    // Simpan rating dan komentar ke list di recipe
    widget.recipe.reviews.insert(
      0,
      Review(
        name: 'Kamu',
        date: DateTime.now().toString(),
        reviewText: _comment,
        rating: _rating,
        imagePath: '', // Ganti dengan path gambar
      ),
    );

    // Reset rating dan komentar
    setState(() {
      _rating = 0;
      _comment = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kembali"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.recipe.imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipe.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 12,
                        child: Text(
                          widget.recipe.author.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        widget.recipe.author,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.timer, size: 18),
                      const SizedBox(width: 4.0),
                      Text('${widget.recipe.cookingTime} menit'),
                      const SizedBox(width: 16.0),
                      const Icon(Icons.people, size: 18),
                      const SizedBox(width: 4.0),
                      Text('${widget.recipe.serving} orang'),
                      const Spacer(), // Dorong tombol ke kanan
                      // Tombol Bookmark
                      IconButton(
                        onPressed: _toggleBookmark,
                        icon: Icon(
                          _isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: _isBookmarked ? Colors.orange : Colors.orange,
                        ),
                      ),
                      // Tombol Share
                      IconButton(
                        onPressed: _shareRecipe,
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Bahan - Bahan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipe.ingredients
                        .map((ingredient) => Text('• $ingredient'))
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Cara Membuat',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipe.instructions
                        .map((instruction) => Text('• $instruction'))
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  // Bagian rating & ulasan
                  const Text(
                    'Rating & Ulasan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Tampilkan komentar yang baru disimpan
                  // Komentar baru akan tampil di atas
                  if (_comment.isNotEmpty || _rating > 0)
                    ReviewTile(
                      review: Review(
                        name: 'Kamu',
                        date: DateTime.now().toString(),
                        reviewText: _comment,
                        rating: _rating,
                        imagePath: '', // Ganti dengan path gambar
                      ),
                    ),
                  // Tampilkan komentar dari user lain
                  Column(
                    children: widget.recipe.reviews
                        .map((review) => ReviewTile(review: review))
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  // Form untuk rating dan komentar
                  const Text(
                    'Berikan Rating dan Komentar Anda',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        ),
                        onPressed: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                      );
                    }),
                  ),
                  if (_selectedImage != null)
                    Image.file(
                      _selectedImage!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  // Tombol Pilih Gambar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _getImage(ImageSource.gallery);
                        },
                        child: const Text('Pilih dari Galeri'),
                      ),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          _getImage(ImageSource.camera);
                        },
                        child: const Text('Ambil Foto'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _comment = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Tulis komentar Anda',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _saveRatingAndComment,
                    child: const Text('Kirim'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 18,
                  child: Text(
                    review.name.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  review.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                Text(
                  review.date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(review.reviewText),
            const SizedBox(height: 8.0),
            if (review.imagePath.isNotEmpty)
              Image.asset(
                review.imagePath,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 8.0),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < review.rating ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
