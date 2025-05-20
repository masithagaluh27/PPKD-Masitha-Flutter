import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class  Tugas2Flutter extends StatelessWidget {
  const Tugas2Flutter({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.lightBlue,
      centerTitle: true,
      title: const Text('Profil Lengkap'),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Lingkaran Foto Profil
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 32),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/image/images.jpeg'),
              backgroundColor: Colors.grey,
            ),
          ),
        ),

        // Baris 1 - Nama
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Masitha',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),

        // Baris 2 - Email
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 8),
                Text('projectmasitha@gmail.com'),
              ],
            ),
          ),
        ),

        // Baris 3 - Nomor Telepon
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: const [
              Icon(Icons.phone, color: Colors.green),
              SizedBox(width: 8),
              Text('0812345678'),
              Spacer(),
            ],
          ),
        ),

        // Baris 4 - Postingan & Followers
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('Postingan')),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('Followers')),
                ),
              ),
            ],
          ),
        ),

        // Baris 5 - Deskripsi Profil
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '   Masitha adalah Seorang pelajar yang sedang belajar Flutter di PPKD Jakarta Pusat. Saat ini Masitha sedang mengerjakan tugas flutter keduanya.',
            style: TextStyle(fontSize: 16),
          ),
        ),

        const Spacer(),

        // Baris 6 - Hiasan Visual
        Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade300,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
      ],
    ),
  );
}
}