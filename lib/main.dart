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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _resValue = "0";

  void _handleButtonClick(String buttonValue) {
    debugPrint(buttonValue);
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
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(
                                "00",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 40, color: Colors.blueGrey),
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
                        _handleButtonClick("");
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
                        _handleButtonClick("x");
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
                                "x",
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
