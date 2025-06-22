import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfileDetailScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: userData['name']);
    final emailController = TextEditingController(text: userData['email']);
    final phoneController = TextEditingController();
    final locationController = TextEditingController(text: 'USA');

    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Your name'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInfoField("Name", nameController),
              buildInfoField("Email account", emailController),
              buildInfoField("Mobile number", phoneController),
              buildInfoField("Location", locationController),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Panggil API update profile
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("Save Change"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        TextField(controller: controller),
        const Divider(height: 20),
      ],
    );
  }
}
