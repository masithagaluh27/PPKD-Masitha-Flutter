import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_11/meet_11a.dart';
import 'meet_5/tugas_5_flutter.dart';
import 'meet_6/tugas_6_flutter.dart';
import 'meet_2/tugas_2_flutter.dart';
import 'meet_3/meet_3a.dart';


void main() {} class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        //Harus didaftarkan dulu disini
        "/": (context) => (),TugasEnamFlutter
        "/meet_2": (context) => Tugas5Flutter(),
        MeetTigaA.id: (context) => Tugas2Flutter(),
      },
      debugShowCheckedModeBanner: false,
      title: 'PPKD B 2',

      theme: ThemeData(
        // useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
      ),
      home: MeetLima(),
      // home: LoginScreen(),
    );
  }
}
