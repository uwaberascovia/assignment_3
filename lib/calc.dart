import 'package:flutter/material.dart';
import 'package:assignment_3/button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var userQuestion = '';
  var userAnser = '';

  final myTextStyle = TextStyle(fontSize: 10, color: Colors.amber[900]);

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    )),
                Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnser,
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Center(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = '';
                            userAnser = '';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.white,
                      );
                    } else if (index == buttons.length - 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                          // if(isOperator(buttons[index])){
                          //   userQuestion += 'ANS';
                          // }
                          // else{
                          //   userQuestion=userAnser;
                          // }
                        },
                        buttonText: buttons[index],
                        color: Colors.amber,
                        textColor: Colors.white,
                      );
                    } else
                      // ignore: curly_braces_in_flow_control_structures
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.amber
                            : Colors.amber[100],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.amber,
                      );
                  }),
            ),
          ),
        )
      ]),
    );
  }

  bool isOperator(String s) {
    if (s == '%' || s == '/' || s == 'X' || s == '+' || s == '-' || s == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');
    finalQuestion = finalQuestion.replaceAll('ANS', userAnser);

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnser = eval.toString();
  }
}
