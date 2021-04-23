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
  String val = "";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.red,
        ),
        child: SafeArea(
            child: Container(
                child: Column(
                  children: [
                    Text("$val"),
                    CupertinoTextField(
                      style: TextStyle(color: Colors.red),
                      onChanged: (String value) {
                        setState(() {
                          val = value;
                        });
                        print(value);
                      },
                    )
                  ],
                )
            )
        )
    );
  }
}
