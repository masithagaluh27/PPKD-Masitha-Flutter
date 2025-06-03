import 'package:flutter/material.dart';

class ListProduk extends StatefulWidget {
  const ListProduk({super.key});

  @override
  State<ListProduk> createState() => _ListProdukState();
}

class _ListProdukState extends State<ListProduk> {
  final List<String> kategoriProduk = [
    'Buah-buahan',
    'Sayuran',
    'Elektronik',
    'Pakaian Pria',
    'Pakaian Wanita',
    'Alat Tulis Kantor',
    'Buku & Majalah',
    'Peralatan Dapur',
    'Makanan Ringan',
    'Minuman',
    'Mainan Anak',
    'Peralatan Olahraga',
    'Produk Kesehatan',
    'Kosmetik',
    'Obat-obatan',
    'Aksesoris Mobil',
    'Perabot Rumah',
    'Sepatu & Sandal',
    'Barang Bekas',
    'Voucher & Tiket',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Kategori')),
      body: ListView.builder(
        itemCount: kategoriProduk.length,
        itemBuilder: (context, index) {
          int nomor = index + 1; // fungsi pertambahan
          return ListTile(title: Text('$nomor. ${kategoriProduk[index]}'));
        },
      ),
    );
  }
}
