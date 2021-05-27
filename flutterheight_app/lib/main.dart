import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Body()
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Height and Width in Percent Example'),
      ),
      body: Center(
          child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.5,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              child: RaisedButton(
                onPressed: () {},
                child: const Text(
                    'Button in Percent!', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 5,

              )
          )
      ),
    );
  }
}