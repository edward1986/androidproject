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
  List<Widget> myWidget = [
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            color: Colors.red,
            child: Column(
              children: [
                RaisedButton(
                    child: Text("add icon"),
                    onPressed: () => {
                          setState(() => {
                                myWidget.add(Expanded(flex: 2,child: Icon(Icons.star)) )
                              })
                        }),
                Row(
                    children: myWidget
                )

              ],
            )));
  }
}
