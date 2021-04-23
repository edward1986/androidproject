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

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _MyHomePageState extends State<MyHomePage> {
  WhyFarther _selection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

          child: PopupMenuButton <WhyFarther>(
            onSelected: (WhyFarther result) {
              print(result);
              setState(() {
                _selection = result;
              });
            },
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<WhyFarther>>[
              const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.harder,
                  child: Text('Working a lot harder')
              ),
              const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.smarter,
                  child: Text('Being a lot smarter')
              ),
              const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.selfStarter,
                  child: Text('Being a self-starter')
              ),
              const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.tradingCharter,
                  child: Text('Placed in charge of the trading charter')
              ),
            ],
          )
      ),
    );
  }
}
