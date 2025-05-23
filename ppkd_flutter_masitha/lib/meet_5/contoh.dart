import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Contoh()));
}

class Contoh extends StatefulWidget {
  const Contoh({super.key});

  @override
  State<Contoh> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Contoh> {
  String nama = '';
  bool isLiked = false;
  bool showDescription = false;
  int counter = 0;
  bool showInkWellText = false;

  void _handleGesture(String message) {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Interaktif Pengguna')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ElevatedButton
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nama = 'Nama saya: Budi'; // ganti sesuai nama Anda
                });
              },
              child: const Text('Tampilkan Nama'),
            ),
            if (nama.isNotEmpty) ...[const SizedBox(height: 8), Text(nama)],

            const SizedBox(height: 16),

            // IconButton
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                if (isLiked)
                  const Text(
                    'Disukai',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
              ],
            ),

            const SizedBox(height: 16),

            // TextButton
            TextButton(
              onPressed: () {
                setState(() {
                  showDescription = !showDescription;
                });
              },
              child: const Text('Lihat Selengkapnya'),
            ),
            if (showDescription)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Ini adalah deskripsi tambahan yang muncul ketika tombol ditekan.',
                ),
              ),

            const SizedBox(height: 16),

            // Counter display
            Text(
              'Counter: $counter',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // InkWell membungkus Container berwarna
            InkWell(
              onTap: () {
                setState(() {
                  showInkWellText = !showInkWellText;
                });
                print('Kotak disentuh');
              },
              child: Container(
                width: 150,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child:
                    showInkWellText
                        ? const Text(
                          'Kotak disentuh',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                        : null,
              ),
            ),

            const SizedBox(height: 16),

            // GestureDetector membungkus teks
            GestureDetector(
              onTap: () => _handleGesture('Ditekan sekali'),
              onDoubleTap: () => _handleGesture('Ditekan dua kali'),
              onLongPress: () => _handleGesture('Tahan lama'),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tekan Aku',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
