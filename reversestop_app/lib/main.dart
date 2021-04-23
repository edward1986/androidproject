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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation;
  Color val;

  _MyHomePageState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 4500),
      vsync: this,
    );

    animation = ColorTween(
        begin: Color.fromRGBO(255, 0, 0, 1.0),
        end: Color.fromRGBO(0, 0, 255, 1.0)
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          val = animation.value;
        });
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            decoration: BoxDecoration(color: val),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Reverse"),
                  onPressed: () {
                    _controller.reverse();
                  },
                ),
                RaisedButton(
                  child: Text("Stop"),
                  onPressed: () {
                    _controller.stop();
                  },
                ),
              ],
            )
        )
    );
  }
}