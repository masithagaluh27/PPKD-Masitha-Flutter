import 'package:flutter/material.dart';

class TugasTigaFlutter extends StatelessWidget {
  const TugasTigaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffCDC1FF),
        title: Text("Formulir & Galeri"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Formulir Pengguna",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 11),

              // Nama
              const TextField(
                decoration: InputDecoration(
                  labelText: "Nama",
                  prefixIcon: Icon(Icons.account_box),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              // Email
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              // No HP
              const TextField(
                decoration: InputDecoration(
                  labelText: "No HP",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              // Deskripsi
              const TextField(
                maxLines: 4, // Maksimal 4 baris
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  prefixIcon: Icon(Icons.description),
                  hintText: 'Tuliskan deskripsi Anda...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              // Menambahkan tulisan "Galeri"
              const Text(
                "Galeri",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),

              // Grid of items with text aligned to bottom left
              SizedBox(
                // Tambahkan tinggi jika item lebih banyak
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    //gambar 1
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFFF6E3),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("1"),
                        ),
                      ),
                    ),

                    //gambar 2
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFFCCEA),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("2"),
                        ),
                      ),
                    ),

                    //gambar 3
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffBFECFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("3"),
                        ),
                      ),
                    ),

                    // gambar 4
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffE5D9F2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("4"),
                        ),
                      ),
                    ),

                    //gambar 5
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFFE9D0),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("5"),
                        ),
                      ),
                    ),

                    //gambar 6
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF49BAB),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("6"),
                        ),
                      ),
                    ),
                    //gambar 7
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFFCACC),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("7"),
                        ),
                      ),
                    ),
                    //gambar 8
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffD4E2D4),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("8"),
                        ),
                      ),
                    ),
                    //gambar 9
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffC0DBEA),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("9"),
                        ),
                      ),
                    ), //gambar 10
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFFE9D0),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 61, 61, 61),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("10"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
