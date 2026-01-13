import 'package:flutter/material.dart';
import 'package:flutter_proyect_1/widgets/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sullcaray Calculadora',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 34, 83, 189),
        ),
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("1"),
            Text("2"),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("A")),
                ElevatedButton(onPressed: () {}, child: Text("B")),
                ElevatedButton(onPressed: () {}, child: Text("C")),
                ElevatedButton(onPressed: () {}, child: Text("/")),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "7",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "8",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "9",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnDark(simbolo: "x"),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "4",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "5",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "6",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnDark(simbolo: "-"),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "1",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "2",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "3",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnDark(simbolo: "+"),
              ],
            ),
            Row(
              children: [
                BtnDark(simbolo: "+/-"),
                BtnLight(
                  numero: "0",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnDark(simbolo: "."),
                BtnSame(igual: "="),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
