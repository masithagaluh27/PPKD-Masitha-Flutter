import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//  import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: FormulirDaftarProduk()));

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xffCDC1FF),
      title: Text("Formulir & Daftar Produk"),
    ),
    body: ListView(
      padding: EdgeInsets.all(15),
      children: [
        // Formulir Pengguna
        const Text(
          "Formulir Pengguna",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          leading: Icon(Icons.phone_android),
          title: Text("Smartphone A"),
          subtitle: Text("Rp. 2.000.000"),
        ),
        const Divider(),

        // Produk 2
        ListTile(
          leading: Icon(Icons.laptop),
          title: Text("Laptop B"),
          subtitle: Text("Rp. 5.500.000"),
        ),
        const Divider(),

        // Produk 3
        ListTile(
          leading: Icon(Icons.headset),
          title: Text("Headset C"),
          subtitle: Text("Rp. 700.000"),
        ),
        const Divider(),

        // Produk 4
        ListTile(
          leading: Icon(Icons.tv),
          title: Text("TV D"),
          subtitle: Text("Rp. 3.000.000"),
        ),
        const Divider(),

        // Produk 5
        ListTile(
          leading: Icon(Icons.watch),
          title: Text("Smartwatch E"),
          subtitle: Text("Rp. 1.200.000"),
        ),
      ],
    ),
  );
}
