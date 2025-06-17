<<<<<<< HEAD
import 'package:flutter/material.dart';
// import 'package:ppkd_flutter_masitha/meet_12/tugas_7-8_flutter.dart';
=======
// import 'package:flutter/material.dart';
// import 'package:ppkd_flutter_masitha/meet_16/Tugas_11_flutter/tugas_11_flutter.dart';
// import 'package:ppkd_flutter_masitha/meet_12/meet_12a.dart';
>>>>>>> ca533d471fe525782b524d5f582a3203ce2eec58
// import 'package:ppkd_flutter_masitha/meet_16/login_screen_app.dart';
// import 'package:ppkd_flutter_masitha/meet_16/register_screen_app.dart';
import 'package:ppkd_flutter_masitha/splash_screen.dart';
import 'package:ppkd_flutter_masitha/tugas_empat_belas/view/product_list_screen.dart.dart';

//main.dart tugas 13 flutter
import 'package:flutter/material.dart';

//main.dart untuk tugas 11-12 flutter
import 'meet_16/Tugas_11_flutter/tugas_11_flutter.dart';

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
<<<<<<< HEAD
=======

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
>>>>>>> ca533d471fe525782b524d5f582a3203ce2eec58
