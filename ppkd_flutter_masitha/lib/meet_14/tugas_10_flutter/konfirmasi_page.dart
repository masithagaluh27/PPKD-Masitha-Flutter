import 'package:flutter/material.dart';

class ConfirmationPage extends StatefulWidget {
  final String nama;
  final String kota;

  const ConfirmationPage({super.key, required this.nama, required this.kota});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC4E1E6),
      appBar: AppBar(
        title: const Text("Konfirmasi"),
        backgroundColor: Color(0xffC4E1E6),
      ),
      body: Center(
        child: Text(
          "Terima kasih, ${widget.nama} dari ${widget.kota} telah mendaftar.",
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
