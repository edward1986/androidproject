import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FSBStatus _fsbStatus;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red[400],
          title: Text("Flutter Foldable Sidebar Demo"),
        ),
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.cyan[100],
          drawer: CustomSidebarDrawer(drawerClose: () {
            setState(() {
              _fsbStatus = FSBStatus.FSB_CLOSE;
            });
          },
          ),
          screenContents: welcomeScreen(),
          status: _fsbStatus,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red[400],
            child: Icon(Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _fsbStatus = _fsbStatus == FSBStatus.FSB_OPEN ?
                FSBStatus.FSB_CLOSE : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }


  Widget welcomeScreen() {
    return Container(
      color: Colors.black.withAlpha(50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome To Flutter Dev's",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(height: 5,),
            Text("Click on FAB to Open Foldable Sidebar Drawer",
              style: TextStyle(fontSize: 18, color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSidebarDrawer extends StatefulWidget {

  final Function drawerClose;

  const CustomSidebarDrawer({Key key, this.drawerClose}) : super(key: key);

  @override
  _CustomSidebarDrawerState createState() => _CustomSidebarDrawerState();
}

class _CustomSidebarDrawerState extends State<CustomSidebarDrawer> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
          children: <Widget>[
      Container(
      width: double.infinity,
          height: 200,
          color: Colors.grey.withAlpha(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Flutter Devs")
            ],
          )),
      ListTile(
        onTap: () {
          debugPrint("Tapped Profile");
        },
        leading: Icon(Icons.person),
        title: Text(
          "Your Profile",
        ),
      ),
      Divider(
        height: 1,
        color: Colors.grey,
      ),
      ListTile(
        onTap: () {
          debugPrint("Tapped settings");
        },
        leading: Icon(Icons.settings),
        title: Text("Setting"),
      ),
      Divider(
        height: 1,
        color: Colors.grey,
      ),
      ListTile(
          onTap: () {
            debugPrint("Tapped Logged out");
          },
          leading: Icon(Icons.exit_to_app),
          title: Text("Log out"),
    )],
    )
    ,
    );
  }
  }
