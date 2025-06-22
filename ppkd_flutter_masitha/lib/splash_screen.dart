import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/constant/app_style.dart';
import 'package:ppkd_flutter_masitha/tugas_lima_belas/login_screen.dart';
// import 'tugas_lima_belas/login_screen.dart';
import 'tugas_lima_belas/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen15.id,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/image/logo_copi.jpeg',
                fit: BoxFit.contain,
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
