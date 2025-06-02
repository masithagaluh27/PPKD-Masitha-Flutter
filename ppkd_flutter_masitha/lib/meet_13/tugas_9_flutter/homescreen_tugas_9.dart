import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_13/tugas_9_flutter/nomor_1.dart';
import 'package:ppkd_flutter_masitha/meet_13/tugas_9_flutter/nomor_2.dart';
import 'package:ppkd_flutter_masitha/meet_13/tugas_9_flutter/nomor_3.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9B7EBD),
        title: Text(
          'MashiShop',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListProduk()),
                );
              },
              child: Text('Kategori Produk'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KategoriMapProduk()),
                );
              },
              child: Text('Produk Kesehatan'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProdukKesehatanScreen(),
                  ),
                );
              },
              child: Text('shopp'),
            ),
          ],
        ),
      ),
    );
  }
}
