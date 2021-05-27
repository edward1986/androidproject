import 'package:flutter/material.dart';
import 'image_blur.dart';
import 'image_text_blur.dart';
import 'text_blur.dart';
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
      home: HomePageScreen(),
    );
  }
}
class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text("Flutter BackdropFilter Widget Demo"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                RaisedButton(
                  child: Text(
                    'Image Blur', style: TextStyle(color: Colors.black),),
                  color: Colors.cyan[100],
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ImageBlur()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.all(13),
                ),
                SizedBox(height: 8,),
                RaisedButton(
                  child: Text(
                    'Text Blur', style: TextStyle(color: Colors.black),),
                  color: Colors.cyan[100],
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TextBlur()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.all(13),

                ),
                SizedBox(height: 8,),

                RaisedButton(
                  child: Text('Image & Text Blur',
                    style: TextStyle(color: Colors.black),),
                  color: Colors.cyan[100],
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ImageTextBlur()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.all(13),


                ),
                SizedBox(height: 8,),

              ],
            ),
          )
      ),
    );
  }
}