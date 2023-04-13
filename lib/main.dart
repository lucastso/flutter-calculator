import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
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
  late final TextEditingController _textResultValueController;
  String _isDividedByZero = "0";
  String _sign = "";
  String _firstNumber = "";
  String _secondNumber = "";

  @override
  void initState() {
    _textResultValueController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _textResultValueController.dispose();

    super.dispose();
  }

  void _handleButtonClick(String pressedValue) {
    setState(() {
      if (pressedValue == "C") {
        _textResultValueController.text = "";
        _sign = "";
        _firstNumber = "";
        _secondNumber = "";
        _isDividedByZero = "0";
      }

      switch (pressedValue) {
        case "<":
          if (_textResultValueController.text.length != 0) {
            var text = _textResultValueController.text.split("");
            text.removeLast();
            _textResultValueController.text = text.join();
          } else {
            return;
          }

          break;
        case "0":
        case "1":
        case "2":
        case "3":
        case "4":
        case "5":
        case "6":
        case "7":
        case "8":
        case "9":
          if (_textResultValueController.text.length < 13) {
            if (_firstNumber != "" && pressedValue == "0") {
              _textResultValueController.text = _textResultValueController.text;
            } else {
              _textResultValueController.text += pressedValue;
            }

            if (_textResultValueController.text.contains("0") &&
                pressedValue != "0") {
              var text = _textResultValueController.text.split("");
              text.removeWhere((element) => element == "0");
              _textResultValueController.text = text.join();
            }
          }
          break;
        case "+":
        case "-":
        case "*":
        case "/":
          _sign = pressedValue;
          _firstNumber = _textResultValueController.text;
          _textResultValueController.text = "0";
          break;
        case ".":
          if (_textResultValueController.text.contains(".")) {
            return;
          } else {
            _textResultValueController.text += pressedValue;
          }
          break;
        case "=":
          _secondNumber = _textResultValueController.text;
          if (_sign == "+") {
            if (_firstNumber.isNotEmpty && _secondNumber.isNotEmpty) {
              var result =
                  double.parse(_firstNumber) + double.parse(_secondNumber);
              if (_firstNumber.contains(".") || _secondNumber.contains(".")) {
                _textResultValueController.text = result.toStringAsFixed(1);
              } else {
                _textResultValueController.text = result.toStringAsFixed(0);
              }
            }
          } else if (_sign == "-") {
            if (_firstNumber.isNotEmpty && _secondNumber.isNotEmpty) {
              var result =
                  double.parse(_firstNumber) - double.parse(_secondNumber);
              if (_firstNumber.contains(".") || _secondNumber.contains(".")) {
                _textResultValueController.text = result.toStringAsFixed(1);
              } else {
                _textResultValueController.text = result.toStringAsFixed(0);
              }
            }
          } else if (_sign == "*") {
            if (_firstNumber.isNotEmpty && _secondNumber.isNotEmpty) {
              var result =
                  double.parse(_firstNumber) * double.parse(_secondNumber);
              if (_firstNumber.contains(".") || _secondNumber.contains(".")) {
                _textResultValueController.text = result.toStringAsFixed(1);
              } else {
                _textResultValueController.text = result.toStringAsFixed(0);
              }
            }
          } else if (_sign == "/") {
            if (_firstNumber.isNotEmpty && _secondNumber.isNotEmpty) {
              var result =
                  double.parse(_firstNumber) / double.parse(_secondNumber);
              if (result.isInfinite ||
                  (_firstNumber == "0" && _secondNumber == "0")) {
                _textResultValueController.text = "Err";
                _isDividedByZero = "Err";
              } else {
                if (_firstNumber.contains(".") || _secondNumber.contains(".")) {
                  _textResultValueController.text = result.toStringAsFixed(1);
                } else {
                  _textResultValueController.text = result.toStringAsFixed(0);
                }
              }
            }
          }
          break;
        default:
          return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
        ),
        padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          border: Border.all(
                              color: Colors.brown.shade900, width: 6),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            border: Border.all(
                                color: Colors.brown.shade900, width: 5),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              border: Border.all(
                                  color: Colors.blue.shade800, width: 6),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextField(
                                enableInteractiveSelection: false,
                                maxLength: 8,
                                controller: _textResultValueController,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    hintText: _isDividedByZero,
                                    counterText: "",
                                    hintStyle: const TextStyle(
                                        fontSize: 44, color: Colors.blueGrey)),
                                style: const TextStyle(
                                    fontSize: 44, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("C");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "C",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.orange[200],
                              border: Border.all(
                                  color: Colors.brown.shade900, width: 5),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 32, color: Colors.blueGrey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.orange[200],
                              border: Border.all(
                                  color: Colors.brown.shade900, width: 5),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 32, color: Colors.blueGrey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("<");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "<-",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("7");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "7",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("8");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "8",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("9");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "9",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("/");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "/",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("4");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "4",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("5");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "5",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("6");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "6",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("*");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "*",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("1");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("2");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "2",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("3");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "3",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("-");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "-",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("0");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "0",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick(".");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                ".",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("=");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "=",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _handleButtonClick("+");
                      },
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[200],
                                border: Border.all(
                                    color: Colors.brown.shade900, width: 5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "+",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32, color: Colors.blueGrey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
