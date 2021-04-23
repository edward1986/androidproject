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
          children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  title: Text("consectetur "),
                  subtitle: Text("adipiscing elit"),
                  leading: Icon(Icons.movie),
                ),

                ListTile(
                  title: Text("lorem ipsum"),
                  subtitle: Text("dolor sit amet"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("Suspendisse "),
                  subtitle: Text("ligula orci"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("sodales sit "),
                  subtitle: Text("amet maximus et"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("porttitor "),
                  subtitle: Text("at risus"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("Pellentesque ac sodales neque"),
                  subtitle: Text("Donec elit dui,"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("Sed et orci ut "),
                  subtitle: Text("nulla varius tempus"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("consectetur "),
                  subtitle: Text("adipiscing elit"),
                  leading: Icon(Icons.movie),
                ),

                ListTile(
                  title: Text("lorem ipsum"),
                  subtitle: Text("dolor sit amet"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("Suspendisse "),
                  subtitle: Text("ligula orci"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("sodales sit "),
                  subtitle: Text("amet maximus et"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("porttitor "),
                  subtitle: Text("at risus"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("Pellentesque ac sodales neque"),
                  subtitle: Text("Donec elit dui,"),
                  leading: Icon(Icons.movie),
                ),
                ListTile(
                  title: Text("Sed et orci ut "),
                  subtitle: Text("nulla varius tempus"),
                  leading: Icon(Icons.movie),
                ),
              ]
          ).toList(),
        )
    );
  }
}
