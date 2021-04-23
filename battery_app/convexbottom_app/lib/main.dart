import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'apps.dart';
import 'books.dart';
import 'games.dart';
import 'movies.dart';
import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(title: 'Flutter Convex BottomBar Sample'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedIndex = 0;
  List<Widget> listWidgets = [Home(), Games(), Apps(), Movies(), Books()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
      ),
      body: listWidgets[selectedIndex],
      bottomNavigationBar: ConvexAppBar.badge({3: '21+'},
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.games, title: 'Games'),
          TabItem(icon: Icons.apps, title: 'Apps'),
          TabItem(icon: Icons.movie, title: 'Movies'),
          TabItem(icon: Icons.book, title: 'Books'),
        ],
        onTap: onItemTapped,
        activeColor: Colors.amber,
        backgroundColor: Colors.teal,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

}