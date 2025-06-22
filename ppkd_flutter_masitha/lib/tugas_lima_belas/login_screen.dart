import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ppkd_flutter_masitha/tugas_lima_belas/api/user_api.dart';

class LoginScreen15 extends StatefulWidget {
  const LoginScreen15({super.key});
  static const String id = '/Login';

  @override
  State<LoginScreen15> createState() => _LoginScreen15State();
}

class _LoginScreen15State extends State<LoginScreen15> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false;

  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final result = await UserService().loginUser(
          email: _email.text,
          password: _password.text,
        );

        if (result['data'] != null) {
          final token = result['data']['token'];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);

          Navigator.pushReplacementNamed(context, '/profile');
        } else if (result['errors'] != null) {
          final errors = result['errors'];
          if (errors['email'] != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errors['email'][0])));
          } else if (errors['password'] != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errors['password'][0])));
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${e.toString()}")),
        );
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
          // Background Image
          Image.asset("assets/image/blur.jpeg", fit: BoxFit.cover),
          // Login Card
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color(0xffE9EEF2).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        "HEY!",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "LOGIN NOW",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Email Field
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: "Email",
                          filled: true,
                          fillColor: Color(0xFFF2F4F7),
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
                                value!.isEmpty
                                    ? "Please enter your email"
                                    : null,
                      ),

                      const SizedBox(height: 16),

                      // Password Field
                      TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                          labelText: "Password",
                          filled: true,
                          fillColor: Color(0xFFF2F4F7),
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
                                value!.isEmpty
                                    ? "Please enter your password"
                                    : null,
                      ),

                      const SizedBox(height: 24),

                      // Login Button
                      Center(
                        child: SizedBox(
                          width: 205,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: _isLoading ? null : login,
                            child:
                                _isLoading
                                    ? const CircularProgressIndicator()
                                    : const Text("Login"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Bottom text row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                '/register',
                              );
                            },
                            child: const Text("Create New"),
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
