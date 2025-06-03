import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_12/tugas_7-8_flutter.dart';
import 'package:ppkd_flutter_masitha/meet_4/meet_4a.dart';
import 'package:ppkd_flutter_masitha/meet_6/tugas_6_flutter.dart';
import 'package:ppkd_flutter_masitha/splash_screen.dart';
// import 'package:ppkd_flutter_masitha/meet_13/tugas_9_flutter/homescreen_tugas_9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const TugasEnamFlutter(),
        '/home': (context) => const Tugas8Flutter(),
        MeetEmpatA.id: (context) => const MeetEmpatA(),
      },
    );
  }
}
