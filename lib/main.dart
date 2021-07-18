import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycalculator/ButtonClass.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    ));

class Screen extends StatefulWidget {
  ScreenState createState() => ScreenState();
}

class ScreenState extends State<Screen> {
  String history = '';
  String expression = '';

  void Click(String number) {
    setState(() {
      expression += number;
    });
  }

  void AllClear(String number) {
    setState(() {
      history = '';
      expression = '';
    });
  }

  void Clear(String number) {
    setState(() {
      expression = '';
    });
  }

  void Evaluate(String number) {
    Parser parser = Parser();
    Expression exp = parser.parse(expression);
    ContextModel contextModel = ContextModel();
    double temp = exp.evaluate(EvaluationType.REAL, contextModel);

    setState(() {
      history = expression;
      if (temp - temp.toInt() > 0) {
        expression = temp.toString();
      } else {
        expression = temp.toInt().toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8EAF6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: TextDirection.ltr,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  history,
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  expression,
                  style: TextStyle(fontSize: 60),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonClass(
                  button_label: "AC",
                  callback: AllClear,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "С",
                  callback: Clear,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "%",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "/",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonClass(
                  button_label: "7",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "8",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "9",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "*",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonClass(
                  button_label: "4",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "5",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "6",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "-",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonClass(
                  button_label: "1",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "2",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "3",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "+",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonClass(
                  button_label: ".",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "0",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "00",
                  callback: Click,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6),
              ButtonClass(
                  button_label: "=",
                  callback: Evaluate,
                  button_color: 0xFF3E2723,
                  button_text_color: 0xFFE8EAF6)
            ],
          )
        ],
      ),
    );
  }
}
