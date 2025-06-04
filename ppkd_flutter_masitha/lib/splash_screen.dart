import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/constant/app_style.dart';
import 'package:ppkd_flutter_masitha/helper/preference.dart';
// import 'package:ppkd_flutter_masitha/meet_12/tugas_7-8_flutter.dart';
import 'package:ppkd_flutter_masitha/meet_16/login_screen_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changePage() {
    Future.delayed(Duration(seconds: 3), () async {
      bool isLogin = await PreferenceHandler.getLogin();
      print("isLogin: $isLogin");
      //       if (isLogin) {
      //         return Navigator.pushNamedAndRemoveUntil(
      //           context,
      //           Tugas8Flutter.id,
      //           (route) => false,
      //         );
      // } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreenApp.id,
        (route) => false,
      );
    });
  }
  // }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            Image.asset('assets/image/hancaplas.jpeg'),
            SizedBox(height: 20),
            Text("hancaplas App", style: AppStyle.fontBold()),
            Spacer(),
            SafeArea(
              child: Text("v 1.0.0", style: AppStyle.fontRegular(fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}
