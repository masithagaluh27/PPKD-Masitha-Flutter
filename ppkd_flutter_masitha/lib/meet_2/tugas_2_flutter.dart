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
    drawer: Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurpleAccent),
            child: Text(
              'MENU',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Foto Profil dengan border gradient
           Center(
            child: Padding(
              padding: EdgeInsets.only(top: 32),
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [const Color.fromARGB(255, 245, 0, 163), const Color.fromARGB(136, 255, 115, 0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4), // ketebalan border
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/image/images.jpeg'),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
            ),
          ),

          // Nama
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

          // Email
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

          // Nomor Telepon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: const [
                Icon(Icons.phone, color: Colors.green),
                SizedBox(width: 8),
                Text('0812-345-678'),
                Spacer(),
              ],
            ),
          ),

          // Postingan dan Followers
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

          // Deskripsi
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Masitha adalah seorang pelajar yang sedang belajar Flutter di PPKD Jakarta Pusat. '
              'Saat ini Masitha sedang mengerjakan tugas Flutter keduanya.',
              style: TextStyle(fontSize: 16),
            ),
          ),

          // Spacer & Hiasan Visual di bawah
          const SizedBox(height: 215),
          Container(
            height: 50,
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
    ),
  );
}
}