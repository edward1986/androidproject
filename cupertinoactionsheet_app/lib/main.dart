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
            child: Text("Click me"),
            onPressed: () {
              final act = CupertinoActionSheet(
                title: Text("Food Choices"),
                message: Text("What would you like to eat"),
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    child: Text("Pizza"),
                    onPressed: () {
                      print("You have selected Pizza");
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text("Cookie Dough"),
                    onPressed: () {
                      print("You have selected cookie dough");
                    },
                  )
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              );

              showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => act);
            },
          )
      ),
    );
  }
}
