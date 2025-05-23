import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  String nama = 'Mashi';
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
      appBar: AppBar(
        title: const Text('Halaman Interaktif Pengguna'),
        centerTitle: true,
        backgroundColor: Color(0xff9B7EBD),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ElevatedButton
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nama = nama.isEmpty ? 'Nama saya: Mashi' : '';
                });
              },
              child: const Text('Tampilkan Nama'),
            ),

            // Tampilkan teks otomatis hilang saat nama = '')
            Text(nama),

            const SizedBox(height: 22),

            // IconButton + teks "Disukai"
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(Icons.favorite),
                  color: isLiked ? Colors.red : Colors.grey,
                ),
                if (isLiked)
                  const Text(
                    'Disukai',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
              ],
            ),

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

            const SizedBox(height: 30),

            // Counter display
            Text(
              'Counter: $counter',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

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
                height: 155,
                color: const Color(0xffF7CFD8),
                alignment: Alignment.center,
                child:
                    showInkWellText
                        ? const Text(
                          'Kotak disentuh',
                          style: TextStyle(
                            color: Color(0xff3D365C),
                            fontSize: 16,
                          ),
                        )
                        : null,
              ),
            ),
            const SizedBox(height: 20),

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
