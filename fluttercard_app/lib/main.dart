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
        body: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.movie),
                      title: Text("Shazam"),
                      subtitle: Text("Shazam was called Captain Marvel first")
                  ),
                  ButtonBarTheme(
                      data: ButtonBarThemeData(buttonTextTheme: ButtonTextTheme.accent),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: Text("Watch Movie"),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: Text("Watch Trailer"),
                            onPressed: () {},
                          ),
                        ],
                      )
                  )
                ],
              ),
            )
        )
    );
  }
}
