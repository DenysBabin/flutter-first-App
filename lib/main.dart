import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  String string = "0";
  String result = "0";
  double? w1 = 85;
  double? w2 = 170;
  late double _progressValue;

  @override
  void initState() {
    string = '0';
    result = "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "EBGaramond"),
      home: Scaffold(
        backgroundColor: Colors.deepOrange[400],
        appBar: AppBar(
          title: Text("Calculator"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                child: Center(
                  child: Text(
                    string,
                    style: TextStyle(
                      fontSize: 48,
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                child: Center(
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 48,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      MyButton(myContext: "AC"),
                      MyButton(myContext: "7"),
                      MyButton(myContext: "4"),
                      MyButton(myContext: "1"),
                      MyButton(myContext: "."),
                    ],
                  ),
                  Column(
                    children: [
                      MyButton(myContext: "<-"),
                      MyButton(myContext: "8"),
                      MyButton(myContext: "5"),
                      MyButton(myContext: "2"),
                      MyButton(myContext: "0"),
                    ],
                  ),
                  Column(
                    children: [
                      MyButton(myContext: "/"),
                      MyButton(myContext: "9"),
                      MyButton(myContext: "6"),
                      MyButton(myContext: "3"),
                      MyButton(myContext: "00"),
                    ],
                  ),
                  Column(
                    children: [
                      MyButton(myContext: "*"),
                      MyButton(myContext: "+"),
                      MyButton(myContext: "-"),
                      MyButton(myContext: "=", w2: 176),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final double? w1;
  final double? w2;
  final String myContext;
  final Color myColor;

  const MyButton(
      {Key? key,
      this.w1 = 80,
      this.w2 = 80,
      required this.myContext,
      this.myColor = Colors.white70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        height: w2,
        width: w1,
        decoration: BoxDecoration(color: myColor),
        child: Center(
          child: Text(
            myContext,
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}
