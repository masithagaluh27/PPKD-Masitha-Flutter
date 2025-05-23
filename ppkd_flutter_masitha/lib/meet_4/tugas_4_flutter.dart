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
        backgroundColor: const Color(0xffF7CFD8),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
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
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Deskripsi',
              prefixIcon: Icon(Icons.description),
              hintText: 'Tuliskan deskripsi Anda...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // Tombol Submit kecil
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                print("Formulir disubmit!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 230, 129, 154),
                minimumSize: const Size(100, 36),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Submit', style: TextStyle(fontSize: 14)),
            ),
          ),
          const SizedBox(height: 20),

          // Daftar Produk
          const Text(
            "Product",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Produk 1
          ListTile(
            tileColor: Color(0xFFFBE3E5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            //foto product
            leading: Image.asset(
              "assets/image/produk 1.jpeg",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: const Text(
              "Motor orang",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Rp. 5.000.000.000"),
            trailing: const Icon(
              Icons.shopping_cart_outlined,
              color: Color.fromARGB(255, 255, 123, 167),
            ),
          ),
          const SizedBox(height: 10),

          //produk 2
          ListTile(
            tileColor: Color(0xFFFBE3E5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            //foto product
            leading: Image.asset(
              "assets/image/produk 2.jpeg",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: const Text(
              "beat hitam",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Rp. 15.000.000.000.000"),
            trailing: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.pinkAccent,
            ),
          ),
          const SizedBox(height: 10),

          //produk 3
          ListTile(
            tileColor: Color(0xFFFBE3E5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            //foto product
            leading: Image.asset(
              "assets/image/produk 3.jpeg",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: const Text(
              "motor biru elektrik",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Rp. 700.000.00.000"),
            trailing: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.pinkAccent,
            ),
          ),
          const SizedBox(height: 10),
          //produk 4
          ListTile(
            tileColor: Color(0xFFFBE3E5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            //foto product
            leading: Image.asset(
              "assets/image/produk 5.jpeg",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: const Text(
              "harley david",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Rp. 5.000"),
            trailing: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.pinkAccent,
            ),
          ),
          const SizedBox(height: 10),

          //produk 5
          ListTile(
            tileColor: Color(0xFFFBE3E5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            //foto product
            leading: Image.asset(
              "assets/image/produk 4.jpeg",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: const Text(
              "motor cbrrrrr",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Rp. 500.000"),
            trailing: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.pinkAccent,
            ),
          ),
          const SizedBox(height: 10),
          // Produk 6
          ListTile(
            tileColor: Color(0xFFFBE3E5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            //foto product
            leading: Image.asset(
              "assets/image/prodk 6.jpeg",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: const Text(
              "musang + kandang",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Rp. 1.000.000.000.000.000.000"),
            trailing: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.pinkAccent,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
