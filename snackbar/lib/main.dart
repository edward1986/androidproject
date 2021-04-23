import 'package:flutter/material.dart';

void main() {
  runApp(SnackBarDemo());
}

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Snackbar demo",
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text("Snackbar Demo"),
            ),
            body: new SnackBarPage()));
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new RaisedButton(
            onPressed: () {
              final SnackBar snackBar = new SnackBar(
                content: new Text("Hey there"),
                action: new SnackBarAction(
                    label: "Undo",
                    onPressed: () {}
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: new Text("Show SnackBar")
        )
    );
  }
}
