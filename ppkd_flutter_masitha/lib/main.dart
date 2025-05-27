import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_11/meet_11a.dart';

// import 'package:ppkd_flutter_masitha/meet_2/contoh.dart';
// import 'package:ppkd_flutter_masit
// ha/meet_2/meet_2.dart';

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
      title: 'Tugas 6 Flutter', // nama aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFFFFFF)),
      ),
      home: MeetSebelasA(),
    );
  }
}
