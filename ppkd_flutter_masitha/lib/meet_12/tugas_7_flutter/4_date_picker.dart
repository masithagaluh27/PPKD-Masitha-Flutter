import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PilihTanggalLahir extends StatefulWidget {
  const PilihTanggalLahir({super.key});

  @override
  State<PilihTanggalLahir> createState() => _PilihTanggalLahirState();
}

class _PilihTanggalLahirState extends State<PilihTanggalLahir> {
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Pilih Tanggal Lahir',
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        selectedDate == null
            ? ''
            : DateFormat('d MMMM yyyy').format(selectedDate!);

    return Scaffold(
      appBar: AppBar(title: Text('Pilih Tanggal Lahir'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _pickDate,
              child: Text('Pilih Tanggal Lahir'),
            ),
            SizedBox(height: 20),
            if (selectedDate != null)
              Text(
                'Tanggal Lahir: $formattedDate',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }
}
