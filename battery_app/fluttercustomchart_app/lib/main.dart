
import 'package:flutter/material.dart';
import 'radial_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      color: Colors.black,
      title: 'Custom Painter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RadialChart(
          values: [100, 300, 70, 200, 100],
          colors: [
            Colors.yellow,
            Colors.green,
            Colors.red,
            Colors.blue,
            Colors.grey
          ],
        ),
      ),
    );
  }
}