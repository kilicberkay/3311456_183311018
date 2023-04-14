import 'package:flutter/material.dart';

import 'hesap_makinesi.dart';
import 'not_tutma.dart';
import 'vki_hesaplama.dart';

void main() => runApp(const MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Text("Berkay AppBox"),
          centerTitle: true,
        ),
        backgroundColor: Colors.brown[300],
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const not_tutma()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              const AssetImage('assets/images/not_tutma.png'),
                          child: Column(),
                        ),
                      ),
                      const Text(
                        "Not Tutma",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const vki_hesaplama()),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage('assets/images/tarti.png'),
                        ),
                      ),
                      const Text(
                        "VKİ Hesaplama",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const hesap_makinesi()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              const AssetImage('assets/images/calculator.png'),
                          backgroundColor: Colors.transparent,
                          child: Column(),
                        ),
                      ),
                      const Text(
                        "Hesap Makinesi",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
