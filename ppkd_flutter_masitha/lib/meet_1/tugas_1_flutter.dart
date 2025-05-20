import 'package:flutter/material.dart';

class Tugas1Flutter extends StatelessWidget {
  const Tugas1Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 205, 161, 255),
        title: const Text("PROFIL SAYA" ,),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100], // Background color
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 175, 146, 241),
        child: const Icon(Icons.add_link, color: Colors.white),
        onPressed: () {}, // Kosongkan dulu
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(" "),
          Text(" "),
          Text("Nama Lengkap : Masitha Ayu G.R", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Text(" "),
          Row(
            children: [
              Icon(Icons.location_city_rounded, color: Color.fromARGB(255, 229, 173, 255)),
              Text("DK Jakarta Selatan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            ],
          ),
          Text(" "),
          Text("Deskripsi singkat tentang saya : ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Text("      Seorang pelajar yang sedang belajar Flutter.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
