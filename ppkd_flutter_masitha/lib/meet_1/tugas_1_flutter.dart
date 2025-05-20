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
              Icon(Icons.location_on, color: Color.fromARGB(255, 0, 0, 0)),
              Text("DK Jakarta Selatan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            ],
          ),
          Text(" "),
          Text("Deskripsi singkat tentang saya : ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Text("      Masitha adalah Seorang pelajar yang sedang belajar Flutter di PPKD Jakarta Pusat. Saat ini Masitha sedang mengerjakan tugas flutter pertamanya.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
