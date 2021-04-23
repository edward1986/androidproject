import 'package:flutter/material.dart';import 'Controller/SplashScreen.dart';
import 'Controller/hompage.dart';
import 'Model/Constant.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Custom Loader',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => HomePage(),
      },
    );
  }
}