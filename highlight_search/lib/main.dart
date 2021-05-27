import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  var _posts = [

    {
      "title":
      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "date": "06 / 13 / 1995"
    },
    {"title": "lorem ipsum", "date": "06/13/1995"},
  ];
  Icon actionIcon = Icon(
    Icons.search,
  );
  Widget appBarTextView = new Text(
    "SearchView",
  );

  bool isSearching;
  String searchString = "";

  final TextEditingController searchView = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchView.addListener(() {
      if (searchView.text.isEmpty) {
        setState(() {
          isSearching = false;
          searchString = "";
        });
      } else {
        setState(() {
          isSearching = true;
          searchString = searchView.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: appBarTextView,
          actions: <Widget>[
            new IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = Icon(
                      Icons.close,

                    );
                    this.appBarTextView = TextField(
                        controller: searchView,
                        autofocus: true,

                        decoration: InputDecoration(
                          hintText: "Search...",
                        )
                    );
                    searchStart();
                  } else {
                    searchEnd();
                  }
                });
              },
            ),
          ]
      ),
      body: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            int startIndex = _posts[index]["title"]
                .toLowerCase()
                .indexOf(searchString.toLowerCase());

            return ListTile(
              title: searchString.isEmpty || startIndex == -1
                  ? Text(_posts[index]["title"])
                  : RichText(
                  text: TextSpan(
                    text: _posts[index]["title"].substring(0, startIndex),
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: _posts[index]["title"]
                            .substring(
                            startIndex, startIndex + searchString.length),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: _posts[index]["title"]
                            .substring(startIndex + searchString.length),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )),
              subtitle: Text(_posts[index]["date"]),
            );
          }),
    );
  }

  void searchStart() {
    setState(() {
      isSearching = true;
    });
  }

  void searchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,

      );
      this.appBarTextView = Text(
        "SearchView",

      );
      isSearching = false;
      searchView.clear();
    });
  }
}
