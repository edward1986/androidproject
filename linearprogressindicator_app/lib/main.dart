import 'dart:async';

import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Epic Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progress = 0;

  void startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
          (Timer timer) =>
          setState(
                () {
              if (_progress > 1) {
                timer.cancel();
                setState(() {
                  _progress = 0;
                });
                startTimer();
              } else {
                _progress += 0.1;
              }
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.amber,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            )
        )
    );
  }
}

