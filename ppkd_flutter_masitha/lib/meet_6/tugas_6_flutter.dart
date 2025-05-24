import 'package:flutter/material.dart';

class TugasEnamFlutter extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();

  TugasEnamFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Icon(Icons.arrow_back),
              SizedBox(height: 20),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text("sign in to your account"),
              SizedBox(height: 24),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
