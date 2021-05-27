import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SelectableTextRichScreen(),
    );
  }
}

class SelectableTextRichScreen extends StatefulWidget {
  @override
  _SelectableTextRichScreenState createState() =>
      _SelectableTextRichScreenState();
}

class _SelectableTextRichScreenState extends State<SelectableTextRichScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Flutter SelectableText Widget Demo"),
        ),
        body: Center(
          child: SelectableText.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'Flutter', style: TextStyle(color: Colors.blue)),
                TextSpan(text: 'Lorem', style: TextStyle(color: Colors.black)),
                TextSpan(text: 'ipsum', style: TextStyle(color: Colors.red)),
              ],
            ),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48),
            textAlign: TextAlign.center,
            onTap: () => print('Tapped'),
            toolbarOptions: ToolbarOptions(copy: true, selectAll: false),
            showCursor: true,
            cursorWidth: 2,
            cursorColor: Colors.black,
            cursorRadius: Radius.circular(5),
          ),
        )
    );
  }
}