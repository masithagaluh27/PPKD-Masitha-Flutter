import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/tugas_empat_belas/api/product_api.dart';
import 'package:ppkd_flutter_masitha/tugas_empat_belas/models/shop_model.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});
  static const String id = '/product_list';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fake Store Products')),
      body: FutureBuilder<List<ShopUserModel>>(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('Tidak ada data');
          }

          final products = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                child: ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            const Icon(Icons.broken_image),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
