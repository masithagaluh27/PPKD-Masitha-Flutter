import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_16/Tugas_11_flutter/tugas_11_flutter.dart';
// import 'package:ppkd_flutter_masitha/meet_12/meet_12a.dart';
// import 'package:ppkd_flutter_masitha/meet_16/login_screen_app.dart';
// import 'package:ppkd_flutter_masitha/meet_16/register_screen_app.dart';
// import 'package:ppkd_flutter_masitha/splash_screen.dart';
// import 'package:ppkd_flutter_masitha/study_case/siswa_app.dart';
// import 'package:ppkd_flutter_masitha/meet_13/tugas_9_flutter/homescreen_tugas_9.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Siswa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GameFavorite(),
    );
  }
}

// ini comment aja

// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const SplashScreen(),
//         '/siswa_app': (context) => const SiswaApp(),
//         '/login': (context) => const LoginScreenApp(),
//         '/halaman 8': (context) => const LoginScreenApp(),
//         '/halaman ': (context) => const RegisterScreenApp(),
//         LoginScreenApp.id: (context) => LoginScreenApp(),
//         RegisterScreenApp.id: (context) => RegisterScreenApp(),
//         Meet12AInputWidget.id: (context) => Meet12AInputWidget(),
//         SiswaApp.id: (context) => SiswaApp(),
//         MeetEmpatA.id : (context) => const MeetEmpatA(),
//       },
//     );
//   }
// }
