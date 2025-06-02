import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProdukModel {
  final String id;
  final String? nama;
  final int? harga;
  final String? gambar;
  final String? deskripsi;

  ProdukModel({
    required this.id,
    this.nama,
    this.harga,
    this.deskripsi,
    this.gambar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'harga': harga,
      'gambar': gambar,
      'deskripsi': deskripsi,
    };
  }

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      id: map['id'] as String,
      nama: map['nama'] != null ? map['nama'] as String : null,
      harga: map['harga'] != null ? map['harga'] as int : null,
      gambar: map['gambar'] != null ? map['gambar'] as String : null,
      deskripsi: map['deskripsi'] != null ? map['deskripsi'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdukModel.fromJson(String source) =>
      ProdukModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
