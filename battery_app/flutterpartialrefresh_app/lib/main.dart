import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final StreamController _streamController = StreamController<int>();

  int count = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("SMS countdown"),
          ),
          body: Center(
            child: StreamBuilder<int>(
                stream: _streamController.stream,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return RaisedButton(
                    onPressed: () async {
                      if (snapshot.data == 0) {
                        startTimer();
                      }
                    },

                    child: Text(
                      snapshot.data == 0 ? "get verification code" : '${snapshot
                          .data} Resend in seconds',
                      style: snapshot.data == 0
                          ? TextStyle(color: Colors.blue, fontSize: 14)
                          : TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  );
                }
            ),
          ),
        )
    );
  }


  startTimer() {
    count = 10;
    Stream.periodic(Duration(seconds: 1))
        .take(10)
        .listen((t) {
      _streamController.sink.add(--count);
    });
  }
}