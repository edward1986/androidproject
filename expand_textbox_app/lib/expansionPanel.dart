import 'package:flutter/material.dart';

class Expansionpanel extends StatefulWidget {
  Expansionpaneltate createState() => Expansionpaneltate();
}

class Expansionpaneltate extends State<Expansionpanel> {
  List<ExpansionpanelItem> items = <ExpansionpanelItem>[
    ExpansionpanelItem(
        isExpanded: false,
        title: 'Android',
        content: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              Text('Lorem ipsum'),
              Text('dolor emet'),
            ])),
        leading: Icon(Icons.android_outlined)),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expansion Panel List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  items[index].isExpanded = !items[index].isExpanded;
                });
              },
              children: items.map((ExpansionpanelItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                        leading: item.leading,
                        title: Text(
                          item.title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ));
                  },
                  isExpanded: item.isExpanded,
                  body: item.content,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpansionpanelItem {
  bool isExpanded;
  final String title;
  final Widget content;
  final Icon leading;

  ExpansionpanelItem({this.isExpanded, this.title, this.content, this.leading});
}