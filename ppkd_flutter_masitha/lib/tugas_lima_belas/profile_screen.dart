import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/tugas_lima_belas/Api/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_detail_screen.dart';

class ProfileScreen15 extends StatefulWidget {
  const ProfileScreen15({super.key});
  static const String id = '/profile';

  @override
  State<ProfileScreen15> createState() => _ProfileScreen15State();
}

class _ProfileScreen15State extends State<ProfileScreen15> {
  Map<String, dynamic>? userData;

  Future<void> getProfile({bool showSnackbar = false}) async {
    final result = await UserService().getProfile();
    print("Profile result: $result");

    if (result["data"] != null) {
      setState(() {
        userData = result['data'];
      });

      if (showSnackbar) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile berhasil diperbarui.'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal ambil profile: ${result["message"]}'),
          backgroundColor: Colors.red,
        ),
      );
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
      backgroundColor: const Color(0xffDDDDDD),
      body:
          userData == null
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xffE9EEF2),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://absen.quidi.id/profile',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          userData!['name'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userData!['email'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        buildMenuItem(
                          context,
                          Icons.person,
                          'My Profile',
                          () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ProfileDetailScreen(
                                      userData: userData!,
                                    ),
                              ),
                            );

                            if (result == true) {
                              await getProfile(showSnackbar: true);
                            }
                          },
                        ),
                        buildMenuItem(context, Icons.settings, 'Settings', () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Coming soon: You'll be able to customize your settings here.",
                              ),
                              backgroundColor: Color(0xff2E5077),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        }),
                        buildMenuItem(
                          context,
                          Icons.notifications,
                          'Notification',
                          () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Coming soon: Your notifications will appear here.",
                                ),
                                backgroundColor: Color(0xff2E5077),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          },
                        ),
                        buildMenuItem(
                          context,
                          Icons.logout,
                          'Log Out',
                          () async {
                            final shouldLogout = await showDialog<bool>(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: const Text('Confirm Logout'),
                                    content: const Text(
                                      'Are you sure you want to log out?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed:
                                            () => Navigator.pop(context, false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed:
                                            () => Navigator.pop(context, true),
                                        child: const Text('Log Out'),
                                      ),
                                    ],
                                  ),
                            );

                            if (shouldLogout == true) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.remove('token');
                              Navigator.pushReplacementNamed(context, '/Login');
                            }
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
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        leading: Icon(icon, color: Color(0xff4C585B)),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
