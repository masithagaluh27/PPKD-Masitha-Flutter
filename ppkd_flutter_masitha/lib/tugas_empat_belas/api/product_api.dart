import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_flutter_masitha/tugas_empat_belas/models/shop_model.dart';

Future<List<ShopUserModel>> getProduct() async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products'),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> usersJson = json.decode(response.body);
    return usersJson.map((json) => ShopUserModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
