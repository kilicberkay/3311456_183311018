import 'package:flutter/material.dart';

// ignore: camel_case_types
class not_tutma extends StatelessWidget {
  const not_tutma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xff2B2D2D),
          scaffoldBackgroundColor: const Color(0xff2B2D2D)),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";
  List<String> notlar = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Not Tut",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              letterSpacing: 4,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.red[500],
            size: 35,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.grey,
                  title: const Text("Not Ekle"),
                  content: TextField(
                    decoration: const InputDecoration(hintText: "Notunuz"),
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          notlar.add(input);
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Ekle",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: notlar.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ValueKey(notlar[index]),
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Text(
                      notlar[index],
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          notlar.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
