import 'package:novo/utils/calcExpression.dart';
import 'package:flutter/material.dart';
import 'Components/Menu.dart';
import 'components/Keyboard.dart';
import 'components/Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ super.key });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String calculation = '';
  double result = 0;

  addCharacter(String text) {
    setState(()  {
      calculation = calculation + text;
    });
  }

  calcResult() {
    setState(() {
      result = calcExpression(calculation);
    });
  }

  clearScreen() {
    setState(() {
      calculation = '';
      result = 0;
    });
  }

  clearCalculation() {

    setState(() {
      calculation = '';
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Building"),
      ),
      drawer: Menu(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Screen(context, calculation, result.toString()),
            const SizedBox( height: 12),
            Keyboard(context, (string) { addCharacter(string);}, calcResult, clearScreen)
          ],
        ),
      ),
    );
  }
}
