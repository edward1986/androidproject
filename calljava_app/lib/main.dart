import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Epic Page Is Amazing'),
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
  static const platform = const MethodChannel('com.flutter.epic/epic');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Reverse"),
                  onPressed: () {
                    Printy();
                  },
                ),
              ],
            )
        )
    );
  }

  void Printy() async {
    String value;

    try {
      value = await platform.invokeMethod("Printy");
    } catch (e) {
      print(e);
    }

    print(value);

  }
}