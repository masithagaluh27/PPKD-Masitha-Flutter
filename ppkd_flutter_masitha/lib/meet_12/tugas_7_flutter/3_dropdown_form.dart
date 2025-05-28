import 'package:flutter/material.dart';

class DropdownForm extends StatefulWidget {
  const DropdownForm({super.key});

  @override
  State<DropdownForm> createState() => _DropdownFormState();
}

class _DropdownFormState extends State<DropdownForm> {
  String? selectedItem;
  List<String> categories = ['Elektronik', 'Pakaian', 'Makanan', 'Lainnya'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          DropdownButton<String>(
            hint: Text("Pilih Kategori Produk"),
            value: selectedItem,
            items:
                categories.map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
            onChanged: (val) {
              setState(() {
                selectedItem = val!;
              });
            },
          ),
          SizedBox(height: 20),
          if (selectedItem != null)
            Text("Anda memilih kategori: $selectedItem"),
        ],
      ),
    );
  }
}
