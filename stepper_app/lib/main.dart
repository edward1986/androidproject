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
  int _currentStep = 0;

  List<Step> steps = <Step>[
    Step(
        title: Text("Step 1"),
        content: Text("Instructions for step 1")
    ),
    Step(
        title: Text("Step 2"),
        content: Text("Instructions for step 2")
    ),
    Step(
        title: Text("Step 3"),
        content: Text("Instructions for step 3")
    ),
    Step(
        title: Text("Step 4"),
        content: Text("Instructions for step 4")
    ),
    Step(
        title: Text("Step 5"),
        content: Text("Instructions for  step 5")
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stepper(
          currentStep: _currentStep,
          steps: steps,
          onStepTapped: (e) {
            setState(() {
              _currentStep = e;
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep--;
              }
            });
          },
          onStepContinue: () {
            setState(() {
              if (_currentStep < steps.length - 1) {
                _currentStep++;
              }
            });
          },
        )
    );
  }
}