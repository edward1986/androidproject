import 'package:flutter/material.dart';
import 'secondpage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Epic Page Is Amazing'),
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
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  GoToSecondPage(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage(str: "Batman"))
    );

    _scaffold.currentState.showSnackBar(SnackBar(content: Text("$result")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffold,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Batman"),
                  onPressed: () {
                    GoToSecondPage(context);
                  },
                ),
                RaisedButton(
                  child: Text("Superman"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondPage(str: "Superman"))
                    );
                  },
                ),
              ],
            )
        )
    );
  }
}