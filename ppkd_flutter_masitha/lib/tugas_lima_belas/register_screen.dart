import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppkd_flutter_masitha/tugas_lima_belas/api/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool _obscurePassword = true;
  bool _isLoading = false;

  void register() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final result = await UserService().registerUser(
          name: _name.text,
          email: _email.text,
          password: _password.text,
        );

        print("Register result: $result");

        if (result['data'] != null) {
          final token = result['data']['token'];
          print("✅ Token berhasil register: $token");

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Registration successful!"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );

          Navigator.pushReplacementNamed(context, '/Login');
        } else if (result['errors'] != null) {
          final errors = result['errors'];
          String errorMessage =
              errors['email']?[0] ??
              errors['password']?[0] ??
              "Registration failed";

          print("Registration error: $errorMessage");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }
      } catch (e) {
        print(" Exception saat register: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Register failed: ${e.toString()}"),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }

      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/blur.jpeg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
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
                      Text(
                        "WELCOME!",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "REGISTER NOW",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          labelText: "Name",
                          filled: true,
                          fillColor: Color(0xFFF2F4F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? "Please enter your name"
                                    : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: "Email",
                          filled: true,
                          fillColor: Color(0xFFF2F4F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? "Please enter your email"
                                    : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _password,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          filled: true,
                          fillColor: Color(0xFFF2F4F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed:
                                () => setState(() {
                                  _obscurePassword = !_obscurePassword;
                                }),
                          ),
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? "Please enter your password"
                                    : null,
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: SizedBox(
                          width: 205,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child:
                                _isLoading
                                    ? CircularProgressIndicator()
                                    : Text("Register"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          TextButton(
                            onPressed:
                                () => Navigator.pushReplacementNamed(
                                  context,
                                  '/Login',
                                ),
                            child: Text("Login"),
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
