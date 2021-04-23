import 'package:flutter/material.dart';
import 'user_dashboard.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      home: new UserDashboard(),
    );
  }
}