import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
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
  final GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: RaisedButton(
            child: Text("Click Me"),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      CupertinoAlertDialog(
                        title: Text("Alert"),
                        content: Text("Phone is too hot"),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: Text("Bye"),
                            onPressed: () {
                              print("Bye");
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
              );
            },
          )
      ),
    );
  }
}