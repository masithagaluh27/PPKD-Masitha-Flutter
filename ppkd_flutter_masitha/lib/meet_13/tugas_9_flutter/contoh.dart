import 'package:flutter/material.dart';

class Produk {
  final String nama;
  final String deskripsi;
  final String gambar;

  Produk({required this.nama, required this.deskripsi, required this.gambar});
}

class ProdukKesehatanScreen extends StatefulWidget {
  const ProdukKesehatanScreen({super.key});

  @override
  _ProdukKesehatanScreenState createState() => _ProdukKesehatanScreenState();
}

class _ProdukKesehatanScreenState extends State<ProdukKesehatanScreen> {
  final List<Produk> produkKesehatan = [
    Produk(
      nama: 'Vitamin C 1000mg',
      deskripsi: 'Meningkatkan daya tahan tubuh.',
      gambar: 'https://via.placeholder.com/100?text=Vitamin+C',
    ),
    Produk(
      nama: 'Masker Medis',
      deskripsi: 'Masker pelindung wajah 3 lapis.',
      gambar: 'https://via.placeholder.com/100?text=Masker',
    ),
    Produk(
      nama: 'Hand Sanitizer',
      deskripsi: 'Pembersih tangan dengan 70% alkohol.',
      gambar: 'https://via.placeholder.com/100?text=Sanitizer',
    ),
    Produk(
      nama: 'Thermometer Digital',
      deskripsi: 'Pengukur suhu tubuh akurat.',
      gambar: 'https://via.placeholder.com/100?text=Thermometer',
    ),
    Produk(
      nama: 'Obat Batuk Herbal',
      deskripsi: 'Redakan batuk dengan bahan alami.',
      gambar: 'https://via.placeholder.com/100?text=Obat+Batuk',
    ),
    Produk(
      nama: 'Minyak Kayu Putih',
      deskripsi: 'Menghangatkan badan dan atasi masuk angin.',
      gambar: 'https://via.placeholder.com/100?text=Kayu+Putih',
    ),
    Produk(
      nama: 'Multivitamin Anak',
      deskripsi: 'Suplemen gizi untuk anak-anak.',
      gambar: 'https://via.placeholder.com/100?text=Multivitamin',
    ),
    Produk(
      nama: 'Timbangan Badan',
      deskripsi: 'Pantau berat badan idealmu.',
      gambar: 'https://via.placeholder.com/100?text=Timbangan',
    ),
    Produk(
      nama: 'Plester Luka',
      deskripsi: 'Perlindungan luka kecil dan goresan.',
      gambar: 'https://via.placeholder.com/100?text=Plester',
    ),
    Produk(
      nama: 'Sabun Antiseptik',
      deskripsi: 'Membunuh kuman penyebab penyakit.',
      gambar: 'https://via.placeholder.com/100?text=Antiseptik',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produk Kesehatan')),
      body: ListView.builder(
        itemCount: produkKesehatan.length,
        itemBuilder: (context, index) {
          final produk = produkKesehatan[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Image.network(
                produk.gambar,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(produk.nama),
              subtitle: Text(produk.deskripsi),
            ),
          );
        },
      ),
    );
  }
}
