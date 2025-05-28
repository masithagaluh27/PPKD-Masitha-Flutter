import 'package:flutter/material.dart';

class SwitchForm extends StatefulWidget {
  const SwitchForm({super.key});

  @override
  State<SwitchForm> createState() => _SwitchFormState();
}

class _SwitchFormState extends State<SwitchForm> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isSwitchOn ? const Color.fromARGB(255, 158, 158, 158) : Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                activeTrackColor: Colors.blueAccent,
                value: isSwitchOn,
                onChanged: (value) {
                  setState(() {
                    isSwitchOn = value;
                  });
                },
              ),
              SizedBox(width: 8),
              Text(
                'Aktifkan mode gelap',
                style: TextStyle(
                  fontSize: 18,
                  color: isSwitchOn ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          Text(
            isSwitchOn ? 'Mode Gelap Aktif' : 'Mode Terang Aktif',
            style: TextStyle(color: isSwitchOn ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
