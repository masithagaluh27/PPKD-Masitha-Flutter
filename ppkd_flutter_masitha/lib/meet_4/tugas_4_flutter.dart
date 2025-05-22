import 'package:flutter/material.dart';

class TugasEmpatFlutter extends StatelessWidget {
  const TugasEmpatFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MASHISHOP'),

        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Action for menu button
          },
        ),
        centerTitle: true,
        backgroundColor: Color(0xffF7CFD8),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          // Formulir Pengguna
          const Text(
            "Formulir Pengguna",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 11),

          // Nama
          const TextField(
            decoration: InputDecoration(
              labelText: "Nama",
              prefixIcon: Icon(Icons.account_box),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),

          // Email
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),

          // No HP
          const TextField(
            decoration: InputDecoration(
              labelText: "No HP",
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),

          // Deskripsi
          const TextField(
            maxLines: 4, // Maksimal 4 baris
            decoration: InputDecoration(
              labelText: 'Deskripsi',
              prefixIcon: Icon(Icons.description),
              hintText: 'Tuliskan deskripsi Anda...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          // Daftar Produk
          const Text(
            "Daftar Produk",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Produk 1
          ListTile(
            leading: Image.asset(
              "assets/image/produk 1.jpeg",
              height: 120,
              width: 120,
            ),
            title: Text("Motor saya "),
            subtitle: Text("Rp. 5.000.000.000"),
          ),
          const Divider(),

          // Produk 2
          ListTile(
            leading: Image.asset(
              "assets/image/produk 2.jpeg",
              height: 120,
              width: 120,
            ),
            title: Text("beat hitam"),
            subtitle: Text("Rp. 15.000.000.000.000"),
          ),
          const Divider(),

          // Produk 3
          ListTile(
            leading: Image.asset(
              "assets/image/produk 3.jpeg",
              height: 120,
              width: 120,
            ),
            title: Text("motor biru elektrik"),
            subtitle: Text("Rp. 700.000.00.000"),
          ),
          const Divider(),

          // Produk 4
          ListTile(
            leading: Image.asset(
              "assets/image/produk 5.jpeg",
              height: 120,
              width: 120,
            ),
            title: Text("harley david"),
            subtitle: Text("Rp. 5.000"),
          ),
          const Divider(),

          // Produk 5
          ListTile(
            leading: Image.asset(
              "assets/image/produk 4.jpeg",
              height: 120,
              width: 120,
            ),
            title: Text("motor cbrrrrr"),
            subtitle: Text("Rp. 500.000"),
          ),
          // Produk 6
          ListTile(
            leading: Image.asset(
              "assets/image/prodk 6.jpeg",
              height: 120,
              width: 120,
            ),
            title: Text("musang + kandang"),
            subtitle: Text("Rp. 1.000.000.000.000.000.000"),
          ),
        ],
      ),
    );
  }
}
