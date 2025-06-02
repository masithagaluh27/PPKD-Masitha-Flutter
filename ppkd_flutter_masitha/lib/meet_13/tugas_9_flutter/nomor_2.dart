import 'package:flutter/material.dart';

class KategoriMapProduk extends StatefulWidget {
  const KategoriMapProduk({super.key});

  @override
  State<KategoriMapProduk> createState() => _KategoriMapProdukState();
}

class _KategoriMapProdukState extends State<KategoriMapProduk> {
  final List<Map<String, dynamic>> produkKesehatan = [
    {'nama': 'Vitamin C 1000mg', 'ikon': Icons.local_hospital},
    {'nama': 'Masker Medis', 'ikon': Icons.masks},
    {'nama': 'Hand Sanitizer', 'ikon': Icons.clean_hands},
    {'nama': 'Thermometer Digital', 'ikon': Icons.thermostat},
    {'nama': 'Obat Batuk Herbal', 'ikon': Icons.spa},
    {'nama': 'Minyak Kayu Putih', 'ikon': Icons.local_florist},
    {'nama': 'Vitamin Anak', 'ikon': Icons.child_care},
    {'nama': 'Timbangan Badan', 'ikon': Icons.fitness_center},
    {'nama': 'Plester Luka', 'ikon': Icons.healing},
    {'nama': 'Sabun Antiseptik', 'ikon': Icons.soap},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produk Kesehatan')),
      body: ListView.builder(
        itemCount: produkKesehatan.length,
        itemBuilder: (BuildContext context, int index) {
          final produk = produkKesehatan[index];
          return ListTile(
            leading: Icon(
              produk['ikon'],
              color: const Color.fromARGB(255, 122, 182, 250),
            ),
            title: Text(produk['nama']),
          );
        },
      ),
    );
  }
}
