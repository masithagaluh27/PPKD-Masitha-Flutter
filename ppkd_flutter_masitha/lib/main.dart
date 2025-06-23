import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/splash_screen.dart';
import 'package:ppkd_flutter_masitha/tugas_lima_belas/login_screen.dart';
import 'package:ppkd_flutter_masitha/tugas_lima_belas/register_screen.dart';
import 'tugas_lima_belas/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen15.id: (context) => const LoginScreen15(),
        RegisterScreen15.id: (context) => const RegisterScreen15(),
        ProfileScreen15.id: (context) => const ProfileScreen15(),
      },
    );
  }
}
