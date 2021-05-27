import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_radio/flutter_radio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Radio',
      home: RadioScreen(),
    );
  }
}

class RadioScreen extends StatefulWidget {
  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  String url = "http://server-23.stream-server.nl:8438";

  bool isPlaying = false;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    audioStart();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio start playing');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio App Demo"),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Icon(
                  Icons.radio,
                  color: Colors.white,
                  size: 150.0,
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(
                        Icons.stop,
                        color: Colors.pink,
                      ),
                      onPressed: () {
                        FlutterRadio.stop();
                      },
                    ),
                    Container(
                      width: 10.0,
                    ),
                    FloatingActionButton(
                        child: isPlaying
                            ? Icon(
                          Icons.pause,
                          color: Colors.white,
                        )
                            : Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            FlutterRadio.play(url: url);
                            isPlaying = !isPlaying;
                            isVisible = !isVisible;
                          });
                        }),
                    Container(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}