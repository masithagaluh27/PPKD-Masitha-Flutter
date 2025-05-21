import 'package:flutter/material.dart';
// import 'package:ppkd_flutter_masitha/meet_1/meet_1.dart';
// import 'package:ppkd_flutter_masitha/meet_1/tugas_1_flutter.dart';
// import 'package:ppkd_flutter_masitha/meet_2/tugas_2_flutter.dart' as tugas2;
import 'package:ppkd_flutter_masitha/meet_3/meet_3a.dart';
// import 'package:ppkd_flutter_masitha/meet_2/contoh.dart';
// import 'package:ppkd_flutter_masitha/meet_2/meet_2.dart';

void main() {
  runApp(const MyApp()); // tidak boleh di ganti ganti
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 1 Flutter', // nama aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 210, 171, 255),
        ),
      ),
      home: const meetTigaA(),
    );
  }
}
