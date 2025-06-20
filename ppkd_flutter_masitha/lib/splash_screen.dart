import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/constant/app_style.dart';
import 'package:ppkd_flutter_masitha/helper/preference.dart';
import 'package:ppkd_flutter_masitha/tugas_lima_belas/option_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = '/splash_screen';

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
        WelcomeScreen.id,
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
            const Spacer(),

            // 🔽 Tambahkan pembatas ukuran
            SizedBox(
              width: 200,
              height: 200,

              child: Image.asset(
                'assets/image/logo_copi.jpeg',
                fit: BoxFit.contain, // agar proporsional
              ),
            ),

            const SizedBox(height: 20),
            Text("copi App", style: AppStyle.fontBold()),

            const Spacer(),

            SafeArea(
              child: Text("v 1.0.0", style: AppStyle.fontRegular(fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}
