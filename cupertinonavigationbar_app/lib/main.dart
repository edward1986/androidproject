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
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Icon(Icons.arrow_back_ios),
          middle: Text("Epic App", style: TextStyle(color: Colors.white),),
          trailing: Icon(Icons.account_circle),
          backgroundColor: Colors.black,
        ),
        child: SafeArea(
            child: Container(
                child: CupertinoSwitch(
                  value: switchState,
                  onChanged: (bool value) {
                    setState(() {
                      switchState = value;
                    });

                    print(value);
                  },
                )
            )
        )
    );
  }
}
