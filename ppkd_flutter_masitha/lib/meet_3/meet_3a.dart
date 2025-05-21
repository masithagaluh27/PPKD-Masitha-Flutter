import 'package:flutter/material.dart';

class meetTigaA extends StatelessWidget {
  const meetTigaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple, title: Text("Meet 3")),
      body: Column(
        children: [
          Text("Stack widget"),
          SizedBox(height: 20),

          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),

              Container(
                height: 300,

                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlueAccent,
                ),
              ),
              Container(
                height: 300,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 3, 14, 11),
                ),
              ),
            ],
          ),
          Text("data"),
        ],
      ),
    );
  }
}
