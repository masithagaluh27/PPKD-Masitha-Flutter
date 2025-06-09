import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/tugas_13_flutter/database/db_helper.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});
  static const String id = '/add_item';

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> saveItem() async {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      int quantity = int.parse(quantityController.text);

      await DBHELPER13.insertItem(name, quantity);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Item')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nama Item'),
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: 'Jumlah'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: saveItem, child: const Text('Simpan')),
            ],
          ),
        ),
      ),
    );
  }
}
