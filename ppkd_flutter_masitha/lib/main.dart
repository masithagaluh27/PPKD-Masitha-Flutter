import 'package:flutter/material.dart';
// import 'package:ppkd_flutter_masitha/meet_12/tugas_7-8_flutter.dart';
// import 'package:ppkd_flutter_masitha/meet_16/login_screen_app.dart';
// import 'package:ppkd_flutter_masitha/meet_16/register_screen_app.dart';
import 'package:ppkd_flutter_masitha/splash_screen.dart';
import 'package:ppkd_flutter_masitha/tugas_empat_belas/view/product_list_screen.dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/product_list': (context) => const ProductListScreen(),
        '/detail': (context) => const ProductListScreen(),
        // '/login_screen_app': (context) => const LoginScreenApp(),
        // '/main_page': (context) => const Tugas8Flutter(),
        // RegisterScreenApp.id: (context) => RegisterScreenApp(),
      },
    );
  }
}
