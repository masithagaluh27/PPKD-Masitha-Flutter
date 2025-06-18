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
  String _searchText = '';
  Set<String> _selectedCategories =
      {}; // Menyimpan banyak kategori yang dipilih

  // Semua kategori dari API
  final List<String> categories = [
    'electronics',
    'jewelery',
    "men's clothing",
    "women's clothing",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB39DDB),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        title: const Text('Fake Store Products'),
      ),
      body: FutureBuilder<List<ShopUserModel>>(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada produk'));
          }

          final allProducts = snapshot.data!;

          // Filter produk berdasarkan pencarian & kategori (boleh lebih dari satu)
          final filteredProducts =
              allProducts.where((product) {
                final matchSearch = product.title.toLowerCase().contains(
                  _searchText.toLowerCase(),
                );

                final productCategory =
                    categoryValues.reverse[product.category]?.toLowerCase() ??
                    '';

                // Jika tidak memilih kategori → tampilkan semua
                if (_selectedCategories.isEmpty) return matchSearch;

                final matchCategory = _selectedCategories.contains(
                  productCategory,
                );

                return matchSearch && matchCategory;
              }).toList();

          return Column(
            children: [
              const SizedBox(height: 12),
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari produk...',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Filter kategori horizontal (multi select)
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final selected = _selectedCategories.contains(cat);

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: ChoiceChip(
                        label: Text(cat),
                        selected: selected,
                        selectedColor: const Color(0xFFB39DDB),
                        onSelected: (bool value) {
                          setState(() {
                            if (value) {
                              _selectedCategories.add(cat);
                            } else {
                              _selectedCategories.remove(cat);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // List Produk
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: product,
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: Row(
                          children: [
                            // Gambar produk
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(12),
                              ),
                              child: Image.network(
                                product.image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (_, __, ___) =>
                                        const Icon(Icons.broken_image),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Info produk
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
