import 'package:flutter/material.dart';

// ignore: camel_case_types
class hesap_makinesi extends StatefulWidget {
  const hesap_makinesi({Key? key}) : super(key: key);

  @override
  State<hesap_makinesi> createState() => _hesap_makinesiState();
}

// ignore: camel_case_types
class _hesap_makinesiState extends State<hesap_makinesi> {
  // ignore: non_constant_identifier_names
  Widget Buton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        hesapla(btnText);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(70, 70),
        backgroundColor: btnColor,
        shape: const CircleBorder(),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: txtColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Hesap Makinesi"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white, fontSize: 80),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buton("C", Colors.grey, Colors.black),
                Buton("+/-", Colors.grey, Colors.black),
                Buton("%", Colors.grey, Colors.black),
                Buton("/", (Colors.grey[700])!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buton("7", (Colors.grey[850])!, Colors.white),
                Buton("8", (Colors.grey[850])!, Colors.white),
                Buton("9", (Colors.grey[850])!, Colors.white),
                Buton("x", (Colors.grey[700])!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buton("4", (Colors.grey[850])!, Colors.white),
                Buton("5", (Colors.grey[850])!, Colors.white),
                Buton("6", (Colors.grey[850])!, Colors.white),
                Buton("-", (Colors.grey[700])!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buton("1", (Colors.grey[850])!, Colors.white),
                Buton("2", (Colors.grey[850])!, Colors.white),
                Buton("3", (Colors.grey[850])!, Colors.white),
                Buton("+", (Colors.grey[700])!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: (Colors.grey[850])!,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                    child: Text(
                      "0",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Buton(".", (Colors.grey[850])!, Colors.white),
                Buton("=", (Colors.grey[700])!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Logic
  int ilkSayi = 0;
  int ikinciSayi = 0;
  String sonuc = "";
  String text = "";
  String islem = "";

  void hesapla(String btnText) {
    if (btnText == "C") {
      sonuc = "";
      text = "";
      ilkSayi = 0;
      ikinciSayi = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      ilkSayi = int.parse(text);
      sonuc = "";
      islem = btnText;
    } else if (btnText == "=") {
      ikinciSayi = int.parse(text);
      if (islem == "+") {
        sonuc = (ilkSayi + ikinciSayi).toString();
      }
      if (islem == "-") {
        sonuc = (ilkSayi - ikinciSayi).toString();
      }
      if (islem == "x") {
        sonuc = (ilkSayi * ikinciSayi).toString();
      }
      if (islem == "/") {
        sonuc = (ilkSayi ~/ ikinciSayi).toString();
      }
    } else {
      sonuc = int.parse(text + btnText).toString();
    }
    setState(() {
      text = sonuc;
    });
  }
}
