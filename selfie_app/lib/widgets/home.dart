import 'camera.dart';
import 'gallery.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<String> _paths = [
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Camera(),
        Align(
          alignment: Alignment(0, 0.95),
          child: Container(
            height: 100.0,
            child: Gallery(
              paths: _paths,
            ),
          ),
        ),
      ],
    );
  }
}