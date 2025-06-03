import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_13/tugas_10_flutter/formulir_pendaftaran.dart';

class Tugas10Flutter extends StatelessWidget {
  const Tugas10Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Open Recruitment"),
        backgroundColor: Color(0xff7F8CAA),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              "Pendaftaran Kelas Flutter Telah Dibuka!",

              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            Text(
              " DAFTAR SEKARANG !",

              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF6ECFF),
                minimumSize: const Size(350, 45),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Tidak Tertarik"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormulirPendaftaran(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF6ECFF),
                minimumSize: const Size(350, 45),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
