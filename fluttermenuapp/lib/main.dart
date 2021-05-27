import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
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
      home: CircularMenuDemo(),
    );
  }
}
class CircularMenuDemo extends StatefulWidget {
  @override
  _CircularMenuDemoState createState() => _CircularMenuDemoState();
}

class _CircularMenuDemoState extends State<CircularMenuDemo> {
  String _colorName;

  Color _color;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(

          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan[200],
          title: Text('Flutter Animated Circular Menu Demo'),
        ),
        body: Text(""),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child:CircularMenu(
            alignment: Alignment.center,
            backgroundWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(text: 'Press the menu button'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            curve: Curves.bounceOut,
            reverseCurve: Curves.bounceInOut,
            toggleButtonColor: Colors.cyan[400],
            items: [
              CircularMenuItem(
                  icon: Icons.home,
                  color: Colors.brown,
                  onTap: () {
                    setState(() {
                      _color = Colors.brown;
                      _colorName = 'Brown';
                    });
                  }),
              CircularMenuItem(
                  icon: Icons.search,
                  color: Colors.green,
                  onTap: () {
                    setState(() {
                      _color = Colors.green;
                      _colorName = 'Green';
                    });
                  }),
              CircularMenuItem(
                  icon: Icons.settings,
                  color: Colors.red,
                  onTap: () {
                    setState(() {
                      _color = Colors.red;
                      _colorName = 'red';
                    });
                  }),
              CircularMenuItem(
                  icon: Icons.chat,
                  color: Colors.orange,
                  onTap: () {
                    setState(() {
                      _color = Colors.orange;
                      _colorName = 'orange';
                    });
                  }),
              CircularMenuItem(
                  icon: Icons.notifications,
                  color: Colors.purple,
                  onTap: () {
                    setState(() {
                      _color = Colors.purple;
                      _colorName = 'purple';
                    });
                  })
            ],
          ),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}