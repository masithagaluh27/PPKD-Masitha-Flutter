import 'package:flutter/material.dart';

class Tugas1Flutter extends StatelessWidget {
  const Tugas1Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 205, 161, 255), 
        title: Text("PROFIL SAYA"), // Changed title to "Profil Saya"
        centerTitle: true, 
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [Text("Gambar 1")]),
            Row(
              
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[100], // Changed background color to white
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 175, 146, 241),
        child: Icon(Icons.add_link, color: Colors.white),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(" "),
          Text(" "),
          Text("Nama Lengkap : Masitha Ayu Galuh Ramadhani", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
          Text (" "),
          Row(children: 
          [Icon(Icons.location_city_rounded , color: const Color.fromARGB(255, 229, 173, 255),), Text("Jakarta Selatan" , style:TextStyle (fontSize: 18, fontWeight: FontWeight.w400)),],),
          Text (" "),
          Text("Deskripsi singkat tentang saya : ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
          Text("      Seorang pelajar yang sedang belajar Flutter", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
        ]
      ),
    );
  }
}