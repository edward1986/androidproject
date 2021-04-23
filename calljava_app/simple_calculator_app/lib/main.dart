import 'package:flutter/material.dart';
import 'AdditionTab.dart';
import 'MultiplicationTab.dart';
import 'SubtractionTab.dart';
import 'DivisionTab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Calculator'),
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
  AdditionTab additionTab = AdditionTab();
  SubtractionTab subtractionTab = SubtractionTab();
  DivisionTab divisionTab = DivisionTab();
  MultiplicationTab multiplicationTab = MultiplicationTab();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                    bottom: TabBar(
                        indicatorColor: Colors.white,
                        tabs: [
                          Tab(text: "Addition"),
                          Tab(text: "Subtraction"),
                          Tab(text: "Multiplication"),
                          Tab(text: "Division"),
                        ]
                    ),

                    title: Text("Calculator")
                ),

                body: TabBarView(
                    children: [
                      additionTab,
                      subtractionTab,
                      multiplicationTab,
                      divisionTab,
                    ]
                )
            )
        )
    );
  }
}