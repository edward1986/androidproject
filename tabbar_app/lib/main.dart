import 'package:flutter/material.dart';

void main() {
  runApp(new TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: new Scaffold(
            appBar: new AppBar(
              bottom: new TabBar(tabs: <Widget>[
                new Tab(icon: new Icon(Icons.directions_bike)),
                new Tab(icon: new Icon(Icons.directions_boat)),
                new Tab(icon: new Icon(Icons.directions_bus))

              ]),
              title: new Text("Tabbar Demo"),
            ),
            body: new TabBarView(children: <Widget>[
              new Icon(Icons.directions_bike),
              new Icon(Icons.directions_boat),
              new Icon(Icons.directions_bus)
            ]),
          )),
    );
  }
}