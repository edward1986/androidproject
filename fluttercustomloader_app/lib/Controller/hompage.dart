import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../View/loaderview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Colors.red),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new LoaderView(loaderTitle: "Loading...",
                loaderWidth: 200.0,
                loaderHeight: 200.0,
                animationTimeMS: 3000)
          ],
        ),
      ),
    );
  }


}