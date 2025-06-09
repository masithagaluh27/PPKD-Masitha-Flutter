// import 'package:flutter/material.dart';
// import 'package:ppkd_flutter_masitha/meet_16/Tugas_11_flutter/tugas_11_flutter.dart';
// import 'package:ppkd_flutter_masitha/meet_12/meet_12a.dart';
// import 'package:ppkd_flutter_masitha/meet_16/login_screen_app.dart';
// import 'package:ppkd_flutter_masitha/meet_16/register_screen_app.dart';
// import 'package:ppkd_flutter_masitha/splash_screen.dart';
// import 'package:ppkd_flutter_masitha/study_case/siswa_app.dart';
// import 'package:ppkd_flutter_masitha/meet_13/tugas_9_flutter/homescreen_tugas_9.dart';

//main.dart tugas 13 flutter
import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/tugas_13_flutter/1login_screen.dart';
import 'package:ppkd_flutter_masitha/tugas_13_flutter/2register_screen.dart';
import 'package:ppkd_flutter_masitha/tugas_13_flutter/3shopping_list_screen.dart';
import 'package:ppkd_flutter_masitha/tugas_13_flutter/4add_item_screen.dart';

import 'tugas_13_flutter/6setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Belanja',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/shopping_list': (context) => const ShoppingListScreen(),
        '/add_item': (context) => const AddItemScreen(),

        // '/edit_item': (context) => const EditItemScreen(),
        '/statistics': (context) => const SettingScreen(),
      },
    );
  }
}

//main.dart untuk tugas 11-12 flutter
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Aplikasi Siswa',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: GameFavorite(),
//     );
//   }
// }

// main.dart meet 16

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
