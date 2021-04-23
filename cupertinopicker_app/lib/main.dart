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
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.red,
        ),
        child: Container(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 50,
              onSelectedItemChanged: (int index) {
                print(index);
              },
              children: <Widget>[
                Text("Item 1", style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.none),),
                Text("Item 2"),
                Text("Item 3"),
                Text("Item 4"),
                Text("Item 5"),
              ],
            )
        )
    );
  }
}