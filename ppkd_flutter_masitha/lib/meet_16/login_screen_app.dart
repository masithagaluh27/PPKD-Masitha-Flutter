import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_12/tugas_7-8_flutter.dart';
import 'package:ppkd_flutter_masitha/meet_16/database/db_helper.dart';
import 'package:ppkd_flutter_masitha/meet_16/register_screen_app.dart';
// import 'package:ppkd_flutter_masitha/your_register_screen.dart'; // Pastikan ini di-import jika ada halaman register

class LoginScreenApp extends StatefulWidget {
  const LoginScreenApp({super.key});
  static const String id = '/login_screen_app';

  @override
  State<LoginScreenApp> createState() => _LoginScreenAppState();
}

class _LoginScreenAppState extends State<LoginScreenApp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios),
                      SizedBox(width: 20),
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Sign in to your account",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 35),

                  const Text(
                    'Email Address',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff888888),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email wajib diisi';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff888888),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password wajib diisi';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffEA9459),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, Tugas8Flutter.id);
                        try {
                          if (_formKey.currentState!.validate()) {
                            final userData = await DbHelper.login(
                              emailController.text,
                              passwordController.text,
                            );
                            print('userData: $userData');
                            // lanjutkan sesuai kode kamu
                            if (userData != null) {
                              print('data ada ${userData.toJson()}');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Login successful"),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Email atau password salah"),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          }
                        } catch (e) {
                          print('Error saat login: $e');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.blue.shade900,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreenApp.id);
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffEA9459),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
