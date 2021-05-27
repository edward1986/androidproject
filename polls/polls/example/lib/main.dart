import 'package:example/optionview.dart';
import 'package:example/type.dart';
import 'package:flutter/material.dart';

import 'p.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polls',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Polls Example'),
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
  double option1 = 2.0;
  double option2 = 0.0;
  double option3 = 1.0;
  double option4 = 1.0;

  String user = "king@mail.com";
  Map usersWhoVoted = {'sam@mail.com': 3, 'mike@mail.com' : 4, 'john@mail.com' : 1, 'kenny@mail.com' : 1};
  String creator = "eddy@mail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Builder(
          builder: (context) {

            if (usersWhoVoted.containsKey(this.user)) {
              return Polls.viewPolls(
                question:
                    "Who said this in the bible \"I will show up and deal with them\"",
                userChoice: usersWhoVoted[this.user],
                children: [
                  PollOptions(title: 'Samuel', value: option1).show(),
                  PollOptions(title: 'Samuel 2', value: option2).show(),
                  PollOptions(title: 'Samuel 3', value: option3).show(),
                  PollOptions(title: 'Samuel 4', value: option4).show(),
                ],
              );
            }

            if (this.user == this.creator) {
              return Polls.creator(
                question:
                    "Who said this in the bible \"I will show up and deal with them\"",
                children: [
                  PollOptions(title: 'Samuel', value: 3.0).show(),
                  PollOptions(title: 'Samuel 2', value: 0.0).show(),
                  PollOptions(title: 'Samuel 3', value: 1.0).show(),
                ],
                voteEnds: DateTime.utc(1989, 11, 9),
              );
            } else {
              return Polls(
                question:
                    "Who said this in the bible \"I will show up and deal with them\"",
                children: [
                  PollOptions(title: 'Samuel', value: option1).show(),
                  PollOptions(title: 'Samuel 2', value: option2).show(),
                  PollOptions(title: 'Samuel 3', value: option3).show(),
                  PollOptions(title: 'Samuel 4', value: option4).show(),
                ],
                voteEnds: DateTime(2020, 6, 1, 1, 0, 0, 0, 0),
                userChoice: 2,
                onVote: (choice) {
                  print(this.usersWhoVoted);
                  setState(() {
                    this.usersWhoVoted[this.user] = choice;
                    print(this.usersWhoVoted);
                  });
                  if (choice == 1) {
                    setState(() {
                      option1 += 1.0;
                    });
                  }
                  if (choice == 2) {
                    setState(() {
                      option2 += 1.0;
                    });
                  }
                  if (choice == 3) {
                    setState(() {
                      option3 += 1.0;
                    });
                  }
                  if (choice == 4) {
                    setState(() {
                      option4 += 1.0;
                    });
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
