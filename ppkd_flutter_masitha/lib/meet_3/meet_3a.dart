import 'package:flutter/material.dart';

class meetTigaA extends StatelessWidget {
  const meetTigaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Meet 3")),
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 100),
        physics:
            // ClampingScrollPhysics(), // Scroll untuk menahan
            BouncingScrollPhysics(), // Scroll untuk pantul
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [buildStack(), buildStack()]),
            ),

            //Materi tentang widget stack
            Text("Stack Widget"),
            SizedBox(height: 20),
            buildStack(),
            buildStack(),
            // buildStack(),
            // buildStack(),
            // buildStack(),
            // buildStack(),
            // buildStack(),
            // buildStack(),
            // buildStack(),
          ],
        ),
      ),
    );
  }
}

Center buildStack() {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 54, 105, 244),
          ),
        ),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 252, 178, 110),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 204, 116, 255),
          ),
        ),
        Column(children: [Text("data1"), Text("data2"), Text("data3")]),
      ],
    ),
  );
}
