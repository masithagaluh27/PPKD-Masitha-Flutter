import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/tugas_13_flutter/5edit_item_screen.dart';
import 'package:ppkd_flutter_masitha/tugas_13_flutter/database/db_helper.dart';

// import '../study_case/5edit_item_screen.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});
  static const String id = '/shopping_list';

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    final data = await DBHELPER13.getAllItems();
    setState(() {
      items = data;
    });
  }

  Future<void> deleteItem(int id) async {
    await DBHELPER13.deleteItem(id);
    loadItems();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Item dihapus')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Belanja')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          bool isDone = item['isDone'] == 1;

          return ListTile(
            leading: Checkbox(
              value: isDone,
              onChanged: (value) async {
                await DBHELPER13.updateItem(
                  item['id'],
                  item['name'],
                  item['quantity'],
                  value ?? false,
                );
                await loadItems();
              },
            ),
            title: Text(item['name']),
            subtitle: Text('Qty: ${item['quantity']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditItemScreen(item: item),
                      ),
                    );
                    await loadItems();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteItem(item['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add_item');
          await loadItems();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
