import 'package:flutter/material.dart';

class CheckBoxForm extends StatefulWidget {
  const CheckBoxForm({super.key});

  @override
  State<CheckBoxForm> createState() => _SimpleCheckboxFormState();
}

class _SimpleCheckboxFormState extends State<CheckBoxForm> {
  // State variabel
  String name = '';
  String email = '';
  String phone = '';
  bool isChecked = false;

  void _submitData() {
    // Tampilkan data di console
    print('Nama: $name');
    print('Email: $email');
    print('No Telepon: $phone');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Data berhasil dikirim')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Pendaftaran'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Nama
            TextField(
              decoration: const InputDecoration(labelText: 'Nama'),
              onChanged: (value) => name = value,
            ),
            const SizedBox(height: 16),

            // Input Email
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => email = value,
            ),
            const SizedBox(height: 16),

            // Input No Telepon
            TextField(
              decoration: const InputDecoration(labelText: 'No Telepon'),
              onChanged: (value) => phone = value,
            ),
            const SizedBox(height: 24),

            // Checkbox dan label
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text('Saya menyetujui semua persyaratan yang berlaku'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Status
            Text(
              isChecked
                  ? '*Lanjutkan pendaftaran diperbolehkan'
                  : '*Anda belum bisa melanjutkan',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 24),

            // Tombol Submit
            Center(
              child: ElevatedButton(
                onPressed: isChecked ? _submitData : null,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
