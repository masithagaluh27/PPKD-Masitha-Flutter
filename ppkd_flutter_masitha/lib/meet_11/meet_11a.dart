import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_11/meet_11.dart';

class MeetSebelasA extends StatelessWidget {
  const MeetSebelasA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time to Shopping"),
        centerTitle: true,
        leading: const Icon(Icons.shop_2_sharp),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MeetSebelas()),
              (route) => false,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/online.png',
                height: 100, // kamu bisa atur ukurannya
              ),
              const SizedBox(height: 10),
              const Text(
                "MASHISHOP",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
