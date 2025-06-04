import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_12/meet_12a.dart';
import 'package:ppkd_flutter_masitha/meet_16/login_screen_app.dart';
import 'package:ppkd_flutter_masitha/meet_16/register_screen_app.dart';
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
        '/login': (context) => const LoginScreenApp(),
        '/halaman 8': (context) => const LoginScreenApp(),
        '/halaman ': (context) => const RegisterScreenApp(),
        LoginScreenApp.id: (context) => LoginScreenApp(),
        RegisterScreenApp.id: (context) => RegisterScreenApp(),
        Meet12AInputWidget.id: (context) => Meet12AInputWidget(),
        // MeetEmpatA.id : (context) => const MeetEmpatA(),
      },
    );
  }
}
