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
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "EBGaramond"),
      home: Scaffold(
        backgroundColor: Colors.deepOrange[400],
        appBar: AppBar(
          title: Text("My First App"),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                image: AssetImage('assets/images/image-1.jpeg'),
              ),
              Image.asset('assets/icons/icon.png'),
              Positioned(
                top: 30,
                left: 100,
                child: Text(
                  'My custom font',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.amber,
                    fontFamily: 'EBGaramond',
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cloud_download),
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        _progressValue += 0.2;

        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          timer.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
