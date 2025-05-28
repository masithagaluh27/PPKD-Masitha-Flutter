import 'package:flutter/material.dart';
import 'package:ppkd_flutter_masitha/meet_12/tugas_7_flutter/1_checkbox_tugas7.dart';
import 'package:ppkd_flutter_masitha/meet_12/tugas_7_flutter/2_switchform.dart';
import 'package:ppkd_flutter_masitha/meet_12/tugas_7_flutter/3_dropdown_form.dart';
import 'package:ppkd_flutter_masitha/meet_12/tugas_7_flutter/4_date_picker.dart';
import 'package:ppkd_flutter_masitha/meet_12/tugas_7_flutter/5_time_picker.dart';

class Tugas8Flutter extends StatefulWidget {
  const Tugas8Flutter({super.key});

  @override
  State<Tugas8Flutter> createState() => _Tugas8FlutterState();
}

class _Tugas8FlutterState extends State<Tugas8Flutter> {
  int _bottomNavigationIndex = 0;
  int _selectedDrawerIndex = 0;

  final List<Widget> _screen = [
    CheckBoxForm(),
    SwitchForm(),
    DropdownForm(),
    PilihTanggalLahir(),
    pilihWaktuPengingat(),
  ];

  final aboutScreen = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tentang Aplikasi',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text('Aplikasi ini untuk menyelesaikan tugas 7 dan 8.'),
        SizedBox(height: 8),
        Text('Masitha'),
        Text('Versi: 1.0.0'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final isHomeTab = _bottomNavigationIndex == 0;
    final screenContent =
        isHomeTab ? _screen[_selectedDrawerIndex] : aboutScreen;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _bottomNavigationIndex == 0 ? 'Formulir' : 'About',
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: Color(0xffB2A5FF),
      ),
      drawer:
          isHomeTab
              ? Drawer(
                child: ListView(
                  children: [
                    const DrawerHeader(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              'assets/images/images.jpeg',
                            ),
                          ),
                          SizedBox(height: 14),
                          Text(
                            'Masitha Aja',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'projectmasitha@gmail.com',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: const Text('Syarat & Ketentuan'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 0);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.dark_mode_rounded),
                      title: const Text('Mode Gelap'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 1);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.shop),
                      title: const Text('Pilih Kategori Produk'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 2);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.date_range),
                      title: const Text('Pilih Tanggal Lahir'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 3);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.timer_rounded),
                      title: const Text('Atur Pengingat'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 4);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
              : null,
      body: screenContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationIndex,
        onTap: (index) {
          setState(() => _bottomNavigationIndex = index);
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Tentang Aplikasi',
          ),
        ],
      ),
    );
  }
}
