import 'package:flutter/material.dart';

// ignore: camel_case_types
class vki_hesaplama extends StatefulWidget {
  const vki_hesaplama({super.key});

  @override
  _vki_hesaplamaState createState() => _vki_hesaplamaState();
}

class _vki_hesaplamaState extends State<vki_hesaplama> {
  TextEditingController boyController = TextEditingController();
  TextEditingController kiloController = TextEditingController();
  double vkiSonuc = 0;
  String textSonuc = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "VKİ Hesaplama",
            style:
                TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: boyController,
                      style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.redAccent),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Boy",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: kiloController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.redAccent),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Kilo",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double boy = double.parse(boyController.text);
                  double kilo = double.parse(kiloController.text);
                  setState(() {
                    vkiSonuc = kilo / (boy / 100 * boy / 100);
                    if (vkiSonuc > 25) {
                      textSonuc = "Olması Gereken Kilonun Üstünde";
                    } else if (vkiSonuc >= 18.5 && vkiSonuc <= 25) {
                      textSonuc = "Kilonuz Normal";
                    } else {
                      textSonuc = "Olması Gereken Kilonun Altında";
                    }
                  });
                },
                child: const Text(
                  "Hesapla",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                vkiSonuc.toStringAsFixed(2),
                style: const TextStyle(fontSize: 90, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: textSonuc.isNotEmpty,
                  child: Text(
                    textSonuc,
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.redAccent),
                  )),
            ],
          ),
        ));
  }
}
