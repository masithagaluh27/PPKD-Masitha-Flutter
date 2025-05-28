import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class pilihWaktuPengingat extends StatefulWidget {
  const pilihWaktuPengingat({super.key});

  @override
  State<pilihWaktuPengingat> createState() => _pilihWaktuPengingatState();
}

class _pilihWaktuPengingatState extends State<pilihWaktuPengingat> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 7, minute: 30),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String get formattedTime {
    if (selectedTime == null) {
      return 'Pengingat diatur pukul: ';
    }

    final now = DateTime.now();
    final time = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );
    return 'Pengingat diatur pukul: ${DateFormat('hh:mm a').format(time)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('Pilih Waktu Pengingat'),
            ),
            const SizedBox(height: 20),
            Text(formattedTime, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
