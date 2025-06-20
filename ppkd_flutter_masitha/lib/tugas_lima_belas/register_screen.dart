import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/tugas_lima_belas/Api/user_api.dart';

class RegisterScreen14 extends StatefulWidget {
  const RegisterScreen14({super.key});
  static const String id = '/register';

  @override
  State<RegisterScreen14> createState() => _RegisterScreen14State();
}

class _RegisterScreen14State extends State<RegisterScreen14> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;
  final userService = UserService();

  void _registerUser() async {
    setState(() => isLoading = true);

    try {
      final result = await userService.registerUser(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      print("Register Result: $result");

      if (result.containsKey("data")) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Berhasil daftar, silakan login")),
        );
        Navigator.pop(context); // kembali ke login
      } else if (result.containsKey("errors")) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(" ${result['message']}")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Gagal: Format response tidak dikenali"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background hitam gradasi
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.black54],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Card bagian bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFFE3E8F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Please enter your detail to create an account',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 24),

                    _buildInput(
                      nameController,
                      'Full Name',
                      textColor: Colors.black87,
                    ),
                    const SizedBox(height: 12),
                    _buildInput(
                      emailController,
                      'Email',
                      textColor: Colors.black87,
                    ),
                    const SizedBox(height: 12),
                    _buildInput(
                      passwordController,
                      'Create Password',
                      isPassword: true,
                      textColor: Colors.black87,
                    ),
                    const SizedBox(height: 12),
                    _buildInput(
                      confirmPasswordController,
                      'Confirm Password',
                      isPassword: true,
                      textColor: Colors.black87,
                    ),
                    const SizedBox(height: 24),

                    isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                          onPressed: () {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Password tidak cocok"),
                                ),
                              );
                              return;
                            }
                            _registerUser();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                    const SizedBox(height: 16),

                    // Sudah punya akun?
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // kembali ke login
                      },
                      child: const Text(
                        "Already have an account? Log in",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Input Builder
  Widget _buildInput(
    TextEditingController controller,
    String hint, {
    bool isPassword = false,
    Color textColor = Colors.white,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
