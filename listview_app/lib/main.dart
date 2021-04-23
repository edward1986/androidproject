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
        body: ListView(

          children: <Widget>[
            ListTile(
              title: Text("Lorem ipsum"),
              subtitle: Text(" dolor sit amet"),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("consectetur adipiscing elit."),
              subtitle: Text("Ut semper vitae purus in accumsan."),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text(" In hac habitasse"),
              subtitle: Text("platea dictumst. Donec eleifend"),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("eu justo in auctor"),
              subtitle: Text("Nunc dapibus imperdiet finibus."),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text(" Integer bibendum varius velit"),
              subtitle: Text("eget dapibus metus"),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("maximus sed."),
              subtitle: Text("Etiam vitae nisi sem"),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("Donec egestas felis"),
              subtitle: Text("He is the King of the Sea"),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("Nullam tincidunt ex elit"),
              subtitle: Text("suscipit vehicula ullamcorper"),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text(" id lobortis lectus commodo id"),
              subtitle: Text("Aenean et fringilla neque"),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("Morbi a odio eu tortor"),
              subtitle: Text("varius tristique"),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("nec id orci."),
              subtitle: Text("Ut at massa et"),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("felis finibus ultrices"),
              subtitle: Text("Morbi eu faucibus ligula. "),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("Sed rhoncus id nibh sit amet congue. "),
              subtitle: Text("Curabitur interdum, "),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("diam at tempus venenatis, "),
              subtitle: Text("erat purus euismod nisi, "),
              leading: Icon(Icons.movie),
            ),
            ListTile(
              title: Text("at fermentum est "),
              subtitle: Text("enim nec nisi. Duis"),
              leading: Icon(Icons.movie),
            ),

          ],
        )
    );
  }
}