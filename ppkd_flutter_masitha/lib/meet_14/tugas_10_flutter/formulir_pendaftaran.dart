import 'package:flutter/material.dart';

import 'konfirmasi_page.dart';

class FormulirPendaftaran extends StatefulWidget {
  const FormulirPendaftaran({super.key});

  @override
  State<FormulirPendaftaran> createState() => _FormulirPendaftaranState();
}

class _FormulirPendaftaranState extends State<FormulirPendaftaran> {
  final _formKey = GlobalKey<FormState>();

  // Gunakan variabel biasa
  String nama = '';
  String email = '';
  String hp = '';
  String kota = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      //ini untuk setelah user tekan submit
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("Data Pendaftaran"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama: $nama"),
                  Text("Email: $email"),
                  Text("No HP: $hp"),
                  Text("Kota: $kota"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,

                      //ini untuk disambungkan ke konfirmasti page
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ConfirmationPage(nama: nama, kota: kota),
                      ),
                    );
                  },
                  child: const Text("Lanjut"),
                ),
              ],
            ),
      );
    }
  }

  //untuk bagian formulir pendaftrannya nya
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulir Pendaftaran")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                onChanged: (value) => nama = value,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Nama wajib diisi'
                            : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email wajib diisi';
                  } else if (!value.contains('@')) {
                    return 'Email tidak valid';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nomor HP (opsional)',
                ),
                onChanged: (value) => hp = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kota Domisili'),
                onChanged: (value) => kota = value,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Kota wajib diisi'
                            : null,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
