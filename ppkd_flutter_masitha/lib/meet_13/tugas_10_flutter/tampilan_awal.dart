import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_13/tugas_10_flutter/formulir_pendaftaran.dart';

class Tugas10Flutter extends StatelessWidget {
  const Tugas10Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Open Recruitment")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Pendaftaran Kelas Flutter Telah Dibuka!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text("Tidak Tertarik"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FormulirPendaftaran(),
                  ),
                );
              },
              child: const Text("Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
