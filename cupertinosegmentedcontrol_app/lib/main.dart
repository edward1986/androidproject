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
  TextStyle tStyle = TextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.red,
        ),
        child: SafeArea(
            child: Container(
                child: Column(
                  children: <Widget>[
                    CupertinoSegmentedControl(
                      children: <int, Widget>{
                        0: Text("Section 1", style: tStyle),
                        1: Text("Section 2", style: tStyle),
                        2: Text("Section 3", style: tStyle),
                      },
                      onValueChanged: (T) {
                        print(T);
                      },
                    )
                  ],
                )
            )
        )
    );
  }
}