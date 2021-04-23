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
  @override
  Widget build(BuildContext context) {
    double _progress = 0;

    void startTimer() {
      new Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_progress == 1) {
              timer.cancel();
            } else {
              _progress += 0.2;
            }
          },
        ),
      );
    }


    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          children: [
            RaisedButton(
              child: Text('Start timer'),
              onPressed: () {
                setState(() {
                  _progress = 0;
                });
                startTimer();
              },
            ),
            CircularProgressIndicator(
              value: _progress,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
          ],
        )));
  }
}