import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = "Custom Theme";
    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600]
      ),
      home: new MyHomePage(
          title: appName),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
          child: new Container(
            color: Theme
                .of(context)
                .accentColor,
            child: new Text(
                "Text with background color",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6
            ),
          )
      ),
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.teal),
          child: new FloatingActionButton(
            onPressed: null,
            child: new Icon(Icons.add),
          )
      ),
    );
  }
}