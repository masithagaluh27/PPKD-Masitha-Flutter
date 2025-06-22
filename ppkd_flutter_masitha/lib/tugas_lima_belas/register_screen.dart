import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ppkd_flutter_masitha/tugas_lima_belas/api/user_api.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen15 extends StatefulWidget {
  const RegisterScreen15({super.key});
  static const String id = '/register';

  @override
  State<RegisterScreen15> createState() => _RegisterScreen15State();
}

class _RegisterScreen15State extends State<RegisterScreen15> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _isLoading = false;

  void register() async {
    if (_formKey.currentState!.validate()) {
      if (_password.text != _confirmPassword.text) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
        return;
      }

      setState(() => _isLoading = true);

      final result = await UserService().registerUser(
        name: _name.text,
        email: _email.text,
        password: _password.text,
      );

      if (result['errors'] != null) {
        final errors = result['errors'];
        if (errors['email'] != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errors['email'][0])));
        } else if (errors['password'] != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errors['password'][0])));
        } else if (errors['name'] != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errors['name'][0])));
        }
      }

      if (result['data'] != null) {
        final token = result['data']['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        Navigator.pushReplacementNamed(context, '/profile');
      }

      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image if needed (optional)
          Image.asset("assets/image/blur.jpeg", fit: BoxFit.cover),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xffE9EEF2).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset('assets/image/amico.PNG', height: 80),
                      const SizedBox(height: 20),

                      // Title
                      Text(
                        "CREATE ACCOUNT",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Name
                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          labelText: "Name",
                          filled: true,
                          fillColor: const Color(0xFFF2F4F7),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty ? "Enter your name" : null,
                      ),
                      const SizedBox(height: 16),

                      // Email
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: "Email",
                          filled: true,
                          fillColor: const Color(0xFFF2F4F7),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty ? "Enter your email" : null,
                      ),
                      const SizedBox(height: 16),

                      // Password
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          filled: true,
                          fillColor: const Color(0xFFF2F4F7),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator:
                            (value) =>
                                value!.length < 6
                                    ? "Minimum 6 characters"
                                    : null,
                      ),
                      const SizedBox(height: 16),

                      // Confirm Password
                      TextFormField(
                        controller: _confirmPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          filled: true,
                          fillColor: const Color(0xFFF2F4F7),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator:
                            (value) =>
                                value != _password.text
                                    ? "Passwords do not match"
                                    : null,
                      ),
                      const SizedBox(height: 24),

                      // Sign Up Button
                      SizedBox(
                        width: 205,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: _isLoading ? null : register,
                          child:
                              _isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text("Sign Up"),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Already have account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/Login');
                            },
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
