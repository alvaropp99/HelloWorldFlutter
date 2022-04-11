import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hello World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _colors = [
    Colors.black,
    Colors.blue,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.yellow
  ];

  int _randomNumber = 0;

  void randomizeColor () {
    setState(() {
      Random random = new Random();
      _randomNumber = random.nextInt(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => debugPrint("Este botón no hace nada"),
              icon: const Icon(Icons.supervised_user_circle),
              splashColor: Colors.red,
              iconSize: 40.0
          )
        ],
      ),
      drawer: Drawer(
        child:
        ListView(
          children: const [
            DrawerHeader(child:
              Text('Drawer header'),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            )
          ],
        ),
      ),
      body: Center(
        child:
        Column(
          children: [
            ElevatedButton.icon(
              onPressed: () => {randomizeColor()},
              icon: const Icon(
                Icons.color_lens,
                size: 40.0
              ),
              label: const Text(
                'Change Color',
                style:
                  TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                fixedSize: const Size(240,60),
                onSurface: Colors.white60
              ) ,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Hello World',
              style: TextStyle(
                color: _colors[_randomNumber],
                fontSize: 20
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
