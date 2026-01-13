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
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2979FF),
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(title: 'Calculadora'),
      debugShowCheckedModeBanner: false,
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
  final TextEditingController _ctrlDisplay = TextEditingController(text: "");
  double aux1 = 0;
  double aux2 = 0;
  String operacion = "";

  void setAux1(String sim) {
    operacion = sim;
    aux1 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }

  void setAux2() {
    aux2 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }

  void calcular() {
    double resultado = 0;
    if (operacion == "+") {
      resultado = aux1 + aux2;
    } else if (operacion == "-") {
      resultado = aux1 - aux2;
    } else if (operacion == "*") {
      resultado = aux1 * aux2;
    } else {
      resultado = aux1 / aux2;
    }
    _ctrlDisplay.text = "$resultado";
  }

  Widget samsungButton({
    required Widget child,
    required VoidCallback onPressed,
    Color bgColor = const Color(0xFF2B2B2B),
  }) {
    return SizedBox(
      width: 72,
      height: 72,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: const CircleBorder(),
          elevation: 0,
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // DISPLAY
            TextField(
              controller: _ctrlDisplay,
              readOnly: true,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "0",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 24),

            // FILA 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                samsungButton(
                  bgColor: const Color(0xFF3A3A3A),
                  onPressed: () {},
                  child: const Text("%", style: TextStyle(fontSize: 20)),
                ),
                samsungButton(
                  bgColor: const Color(0xFF3A3A3A),
                  onPressed: () {},
                  child: const Text("CE", style: TextStyle(fontSize: 18)),
                ),
                samsungButton(
                  bgColor: const Color(0xFF3A3A3A),
                  onPressed: () {
                    _ctrlDisplay.text = "";
                  },
                  child: const Text("C", style: TextStyle(fontSize: 20)),
                ),
                samsungButton(
                  bgColor: const Color(0xFF2979FF),
                  onPressed: () {
                    setAux1("/");
                  },
                  child: const Text("/", style: TextStyle(fontSize: 24)),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // FILA 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnLight(numero: "7", onClick: (_) => _ctrlDisplay.text += "7"),
                BtnLight(numero: "8", onClick: (_) => _ctrlDisplay.text += "8"),
                BtnLight(numero: "9", onClick: (_) => _ctrlDisplay.text += "9"),
                samsungButton(
                  bgColor: const Color(0xFF2979FF),
                  onPressed: () {
                    setAux1("+");
                  },
                  child: const Text("+", style: TextStyle(fontSize: 26)),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // FILA 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnLight(numero: "4", onClick: (_) => _ctrlDisplay.text += "4"),
                BtnLight(numero: "5", onClick: (_) => _ctrlDisplay.text += "5"),
                BtnLight(numero: "6", onClick: (_) => _ctrlDisplay.text += "6"),
                samsungButton(
                  bgColor: const Color(0xFF2979FF),
                  onPressed: () {
                    setAux1("-");
                  },
                  child: const Text("-", style: TextStyle(fontSize: 26)),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // FILA 4
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnLight(numero: "1", onClick: (_) => _ctrlDisplay.text += "1"),
                BtnLight(numero: "2", onClick: (_) => _ctrlDisplay.text += "2"),
                BtnLight(numero: "3", onClick: (_) => _ctrlDisplay.text += "3"),
                samsungButton(
                  bgColor: const Color(0xFF2979FF),
                  onPressed: () {
                    setAux1("*");
                  },
                  child: const Text("×", style: TextStyle(fontSize: 26)),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // FILA 5
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnDark(simbolo: "+/-"),
                BtnLight(numero: "0", onClick: (_) => _ctrlDisplay.text += "0"),
                BtnDark(simbolo: "."),
                samsungButton(
                  bgColor: const Color(0xFF2979FF),
                  onPressed: () {
                    setAux2();
                    calcular();
                  },
                  child: const Text("=", style: TextStyle(fontSize: 26)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
