import 'package:flutter/material.dart';
// import 'package:ppkd_flutter_masitha/meet_13/HomescreenTugas9_9_flutter/nomor_1.dart';
import 'package:ppkd_flutter_masitha/meet_14/tugas_9_flutter/nomor_1.dart';
import 'package:ppkd_flutter_masitha/meet_14/tugas_9_flutter/nomor_2.dart';
import 'package:ppkd_flutter_masitha/meet_14/tugas_9_flutter/nomor_3.dart';

class HomescreenTugas9 extends StatelessWidget {
  const HomescreenTugas9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Color(0xff9B7EBD),
        title: Text(
          'Mashishopp',

          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xff333446),
          ),
        ),
      ),

      // membuat tombol button nya
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 75),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListProduk()),
                );
              },
              child: Text('Kategori Produk'),
            ),

            SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 75),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KategoriMapProduk()),
                );
              },
              child: Text('Produk Kesehatan'),
            ),

            SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 75),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProdukKesehatanScreen(),
                  ),
                );
              },
              child: Text('Shopping time !!'),
            ),
          ],
        ),
      ),
    );
  }
}
