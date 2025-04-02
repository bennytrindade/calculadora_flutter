import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: Text(
            "Calculadora 3000",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(child: Calculadora()),
      ),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Calculadora();
}

class _Calculadora extends State<Calculadora> {
  // variável de estado para exibir o resultado no Text
  // de preferência comece o nome delas com _ também
  String _resultado = "Resultado";

  /*para conseguir obter facilmente o que foi digitado nos textfields
  declaramos um controlador de edição de texto para cada um deles
  */

  var numero1Controller = TextEditingController();
  var numero2Controller = TextEditingController();

  /* Depois de declarar é preciso designar os controllers para cada
  textfield(veja abaixo o parâmetro "controller" de cada um)
  */

  @override
  Widget build(Object context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: numero1Controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Digite um número:",
            ),
          ),
        ),
        SizedBox(height: 50),
        SizedBox(
          width: 300,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: numero2Controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Digite outro número:",
            ),
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                // obtemos o conteúdo dos controllers
                // tentamos converter para double e armanezar
                // em uma variável. Se não conseguir converter, armazena 0.0
                double n1 = double.tryParse(numero1Controller.text) ?? 0.0;
                double n2 = double.tryParse(numero2Controller.text) ?? 0.0;

                setState(() {
                  _resultado = (n1 + n2).toString();
                });
              },
              child: Text("+", style: TextStyle(fontSize: 24)),
            ),
            TextButton(
              onPressed: () {
                double n1 = double.tryParse(numero1Controller.text) ?? 0.0;
                double n2 = double.tryParse(numero2Controller.text) ?? 0.0;

                setState(() {
                  _resultado = (n1 - n2).toString();
                });
              },
              child: Text("-", style: TextStyle(fontSize: 24)),
            ),
            TextButton(
              onPressed: () {
                double n1 = double.tryParse(numero1Controller.text) ?? 0.0;
                double n2 = double.tryParse(numero2Controller.text) ?? 0.0;

                setState(() {
                  _resultado = (n1 / n2).toString();
                });
              },
              child: Text("/", style: TextStyle(fontSize: 24)),
            ),
            TextButton(
              onPressed: () {
                double n1 = double.tryParse(numero1Controller.text) ?? 0.0;
                double n2 = double.tryParse(numero2Controller.text) ?? 0.0;

                setState(() {
                  _resultado = (n1 * n2).toString();
                });
              },
              child: Text("X", style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
        SizedBox(height: 50),
        Text(
          _resultado,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
