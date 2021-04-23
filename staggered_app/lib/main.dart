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
  AnimationController _controller2;
  Animation<Color> animation;
  Animation<Color> animation2;
  Color val;

  _MyHomePageState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 4500),
      vsync: this,
    );

    _controller2 = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    animation = ColorTween(
    )
  }
}
      )
    )
  }
}