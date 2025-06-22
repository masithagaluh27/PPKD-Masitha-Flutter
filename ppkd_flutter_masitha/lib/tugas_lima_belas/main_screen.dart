import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../tugas_lima_belas/endpoint.dart';
import 'profile_detail_screen.dart';

class ProfileScreen15 extends StatefulWidget {
  const ProfileScreen15({super.key});
  static const String id = '/profile';

  @override
  State<ProfileScreen15> createState() => _ProfileScreen15State();
}

class _ProfileScreen15State extends State<ProfileScreen15> {
  Map<String, dynamic>? userData;

  Future<void> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse(Endpoint.profile),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      setState(() {
        userData = jsonBody['data']['user'];
      });
    } else {
      print('Gagal ambil profile: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      body:
          userData == null
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: const NetworkImage(
                            'https://via.placeholder.com/150', // bisa diganti URL foto dari backend
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          userData!['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userData!['email'],
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const Divider(height: 30),
                        buildMenuItem(context, Icons.person, 'My Profile', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      ProfileDetailScreen(userData: userData!),
                            ),
                          );
                        }),
                        buildMenuItem(
                          context,
                          Icons.settings,
                          'Settings',
                          () {},
                        ),
                        buildMenuItem(
                          context,
                          Icons.notifications,
                          'Notification',
                          () {},
                        ),
                        buildMenuItem(
                          context,
                          Icons.logout,
                          'Log Out',
                          () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.remove('token');
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
    );
  }

  Widget buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
