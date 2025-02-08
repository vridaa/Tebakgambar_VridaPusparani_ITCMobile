import 'package:flutter/material.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _gambarJawaban = [
    {"gambar": "assets/kucing.jpg", "jawaban": "kucing"},
    {"gambar": "assets/anjing.jpg", "jawaban": "anjing"},
    {"gambar": "assets/burung.jpg", "jawaban": "burung"},
    {"gambar": "assets/ikan.jpg", "jawaban": "ikan"},
    {"gambar": "assets/gajah.jpg", "jawaban": "gajah"},
  ];

  late Map<String, String> _soalSekarang;
  String _feedback = "";

  @override
  void initState() {
    super.initState();
    _acakGambar();
  }

  void _acakGambar() {
    final random = Random();
    setState(() {
      _soalSekarang = _gambarJawaban[random.nextInt(_gambarJawaban.length)];
      _feedback = "";
      _controller.clear();
    });
  }

  void _cekJawaban() {
    setState(() {
      if (_controller.text.toLowerCase() == _soalSekarang["jawaban"]) {
        _feedback = "Jawaban Benar! 🎉";
      } else {
        _feedback = "Jawaban Salah, Coba Lagi! ❌";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tebak Gambar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_soalSekarang["gambar"]!, width: 200),
            const SizedBox(height: 20),
            const Text(
              "Tebak nama hewan pada gambar di atas:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Jawaban',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _cekJawaban,
                  child: const Text('Submit'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _acakGambar,
                  child: const Text('Gambar Baru'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
