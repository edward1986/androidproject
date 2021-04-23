import 'dart:async';

import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<int> itemsList = List.generate(15, (i) => i);
  ScrollController scrollviewController = new ScrollController();
  bool isPerformingRequest = false;

  @override
  void initState() {
    super.initState();
    scrollviewController.addListener(() {
      if (scrollviewController.position.pixels ==
          scrollviewController.position.maxScrollExtent) {
        loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    scrollviewController.dispose();
    super.dispose();
  }

  loadMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<int> newEntriesItemList = await demoRequest(
          itemsList.length, itemsList.length +
          15); //returns empty itemsListif (newEntriesItemList.isEmpty) {
      double edge = 50.0;
      double offsetFromBottom = scrollviewController.position.maxScrollExtent -
          scrollviewController.position.pixels;
      if (offsetFromBottom < edge) {
        scrollviewController.animateTo(
            scrollviewController.offset - (edge - offsetFromBottom),
            duration: new Duration(milliseconds: 100),
            curve: Curves.easeOut);
      }
    }
    setState(() {

      isPerformingRequest = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text("EndLess ListView"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.search), onPressed: () {}),
            new IconButton(
                icon: new Icon(Icons.more_vert), onPressed: () {})
          ]
      ),
      body: ListView.builder(
        itemCount: itemsList.length + 1,
        itemBuilder: (context, index) {
          if (index == itemsList.length) {
            return _ProgressBar();
          } else {
            return ListTile(title: new Text("Item $index"));
          }
        },
        controller: scrollviewController,
      ),
    );
  }


}

Widget _ProgressBar() {
  return new Padding(
    padding: const EdgeInsets.all(8.0),
    child: new Center(
      child: new Opacity(
        opacity: true ? 1.0 : 0.0,
        child: new CircularProgressIndicator(),
      ),
    ),
  );
}


Future<List<int>> demoRequest(int from, int to) async {
  return Future.delayed(Duration(seconds: 1), () {
    return List.generate(to - from, (i) => i + from);
  });
}