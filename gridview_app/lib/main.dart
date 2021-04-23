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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Center(
              child: Text("lorem"),
            ),
            Center(
              child: Text("dolor"),
            ),
            Center(
              child: Text("sit "),
            ),
            Center(
              child: Text("amet"),
            ),
            Center(
              child: Text("consectetur"),
            ),
            Center(
              child: Text("adipiscing."),
            ),
            Center(
              child: Text("elit"),
            ),
            Center(
              child: Text("Morbi  "),
            ),
            Center(
              child: Text("quis mi ex."),
            ),
            Center(
              child: Text("Nullam dapibus egestas nulla"),
            ),

          ],
        )
    );
  }
}