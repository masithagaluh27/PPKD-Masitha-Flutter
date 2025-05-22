import 'package:flutter/material.dart';

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('MASHISHOP'),
      leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      centerTitle: true,
      backgroundColor: const Color(0xffF7CFD8),
    ),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Formulir Pengguna",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 11),

        const TextField(
          decoration: InputDecoration(
            labelText: "Nama",
            prefixIcon: Icon(Icons.account_box),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),

        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),

        const TextField(
          decoration: InputDecoration(
            labelText: "No HP",
            prefixIcon: Icon(Icons.phone),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),

        const TextField(
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Deskripsi',
            prefixIcon: Icon(Icons.description),
            hintText: 'Tuliskan deskripsi Anda...',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),

        const Text(
          "Daftar Produk",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        // Produk (masing-masing dibungkus container)
        _buildProductTile(
          "assets/image/produk 1.jpeg",
          "Motor saya",
          "Rp. 5.000.000.000",
        ),
        _buildProductTile(
          "assets/image/produk 2.jpeg",
          "beat hitam",
          "Rp. 15.000.000.000.000",
        ),
        _buildProductTile(
          "assets/image/produk 3.jpeg",
          "motor biru elektrik",
          "Rp. 700.000.00.000",
        ),
        _buildProductTile(
          "assets/image/produk 5.jpeg",
          "harley david",
          "Rp. 5.000",
        ),
        _buildProductTile(
          "assets/image/produk 4.jpeg",
          "motor cbrrrrr",
          "Rp. 500.000",
        ),
        _buildProductTile(
          "assets/image/prodk 6.jpeg",
          "musang + kandang",
          "Rp. 1.000.000.000.000.000.000",
        ),
      ],
    ),
  );
}

Widget _buildProductTile(String imagePath, String title, String subtitle) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: const Color(0xfff5f5f5),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.all(12),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.black54)),
      trailing: const Icon(
        Icons.shopping_cart_outlined,
        color: Colors.pinkAccent,
      ),
    ),
  );
}
