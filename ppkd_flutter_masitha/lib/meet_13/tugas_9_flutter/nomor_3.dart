import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // untuk format harga
import 'package:ppkd_flutter_masitha/meet_13/model/produk_model.dart';

class ProdukKesehatanScreen extends StatefulWidget {
  const ProdukKesehatanScreen({super.key});

  @override
  State<ProdukKesehatanScreen> createState() => _ProdukKesehatanScreenState();
}

class _ProdukKesehatanScreenState extends State<ProdukKesehatanScreen> {
  final List<ProdukModel> dataProduct = [
    ProdukModel(
      id: '1',
      nama: 'Vitamin C 1000mg',
      deskripsi: 'Meningkatkan daya tahan tubuh.',
      harga: 25000,
      gambar: 'assets/image/vitamin_c.jpeg',
    ),
    ProdukModel(
      id: '2',
      nama: 'Masker Medis',
      harga: 15000,
      deskripsi: 'Masker pelindung wajah 3 lapis.',
      gambar: 'assets/image/masker.jpeg',
    ),
    ProdukModel(
      id: '3',
      nama: 'Hand Sanitizer',
      harga: 70000,
      deskripsi: 'Pembersih tangan dengan 70% alkohol.',
      gambar: 'assets/image/hand_sanitizer.jpeg',
    ),
    ProdukModel(
      id: '4',
      nama: 'Thermometer Digital',
      harga: 500000,
      deskripsi: 'Pengukur suhu tubuh akurat.',
      gambar: 'assets/image/thermometer.jpeg',
    ),
    ProdukModel(
      id: '5',
      nama: 'Obat uhuk uhuk',
      harga: 90000,
      deskripsi: 'Redakan batuk dengan bahan alami.',
      gambar: 'assets/image/obat_batuk.jpeg',
    ),
    ProdukModel(
      id: '6',
      nama: 'White Wood Oil',
      harga: 75000,
      deskripsi: 'Menghangatkan badan dan atasi masuk angin.',
      gambar: 'assets/image/minyak_kp.jpeg',
    ),
    ProdukModel(
      id: '7',
      nama: 'Vitamin Anak',
      harga: 250000,
      deskripsi: 'Suplemen gizi untuk anak-anak.',
      gambar: 'assets/image/vitamin_anak.jpeg',
    ),
    ProdukModel(
      id: '8',
      nama: 'Timbangan gemoy',
      harga: 450000,
      deskripsi: 'Pantau berat badan idealmu.',
      gambar: 'assets/image/timbangan_ungu.jpeg',
    ),
    ProdukModel(
      id: '9',
      nama: 'hancaplas',
      harga: 60000,
      deskripsi: 'Perlindungan luka kecil dan goresan.',
      gambar: 'assets/image/hancaplas.jpeg',
    ),
    ProdukModel(
      id: '10',
      nama: 'Sabun Antiseptik',
      harga: 300000,
      deskripsi: 'Membunuh kuman penyebab penyakit.',
      gambar: 'assets/image/sabun_antiseptik.jpeg',
    ),
  ];

  final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp. ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produk Kesehatan")),
      body: ListView.builder(
        itemCount: dataProduct.length,
        itemBuilder: (BuildContext context, int index) {
          final product = dataProduct[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 6.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.gambar ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(product.nama ?? ""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rp. ${product.harga}" ?? ""),

                    const SizedBox(height: 4),
                    Text(
                      product.deskripsi ?? "",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
