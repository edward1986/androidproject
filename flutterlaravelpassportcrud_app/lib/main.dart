
import 'package:flutter/material.dart';import 'view/adddata.dart';
import 'view/dashboard.dart';
import 'view/login.dart';
import 'view/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final String title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD API',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Flutter CRUD API'),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => new Dashboard(title: title),
        '/adddata': (BuildContext context) => new AddData(title: title),
        '/register': (BuildContext context) => new RegisterPage(title: title),
        '/login': (BuildContext context) => new LoginPage(title: title),
      },
    );
  }
}