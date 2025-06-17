import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/tugas_empat_belas/models/shop_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});
  static const String id = '/detail';

  @override
  Widget build(BuildContext context) {
    final ShopUserModel product =
        ModalRoute.of(context)!.settings.arguments as ShopUserModel;

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 200,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 10),
            Text(product.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 20),
            Text(
              'Rating: ${product.rating.rate} ⭐ (${product.rating.count} reviews)',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
