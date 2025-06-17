import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_flutter_masitha/meet_22/models/user_model.dart';

Future<List<Users>> getUsers() async {
  final response = await http.get(
    Uri.parse('https://reqres.in/api/users?page=2'),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> usersJson = json.decode(response.body)['data'];
    return usersJson.map((json) => Users.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
