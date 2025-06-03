import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_13/tugas_10_flutter/tampilan_awal.dart';
// import 'package:ppkd_flutter_masitha/meet_13/tugas_9_flutter/homescreen_tugas_9.dart';

void main() {
  runApp(const MyApp());
}

//run
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tugas 10 Flutter",
      theme: ThemeData(
        fontFamily: '',
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffC599B6)),
      ),
      home: const Tugas10Flutter(),
    );
  }
}
