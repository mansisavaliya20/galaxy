import 'package:flutter/material.dart';
import 'package:galaxy/screens/details_page.dart';
import 'package:galaxy/screens/globals.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Galaxy Planets",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 10,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: globals.Planets.map((e) => Container(
                      height: 220,
                      width: 350,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Details_page(
                                        pic: e['pic'],
                                        name: e['Name'],
                                        details: e['Details'],
                                      )));
                            },
                            child: RotationTransition(
                              turns: animationController,
                              child: Image.asset(
                                e['pic'],
                                height: 150,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            e['Name'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 5),
                          ),
                        ],
                      ),
                    )).toList(),
              ),
            ),
          ),
          backgroundColor: Colors.black,
        );
      }),
    );
  }
}
