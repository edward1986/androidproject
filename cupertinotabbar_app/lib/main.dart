import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  int state = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Icon(Icons.arrow_back_ios),
          middle: Text(
            "Epic App",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(Icons.account_circle),
          backgroundColor: Colors.black,
        ),
        child: SafeArea(
            child: Container(
                child: Column(
          children: [
            Text("$state"),
            CupertinoTabBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervisor_account),
                  label: "Account",
                )
              ],
              currentIndex: state,
              onTap: (int index) {
                setState(() {
                  state = index;
                });
                print(index);
              },
            )
          ],
        ))));
  }
}
