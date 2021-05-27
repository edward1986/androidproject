import 'dart:convert';
import 'package:flutter/material.dart';
import 'login.dart';
import '../network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz_view/quiz_view.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name;
  String user_id;
  var questions = [];

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    await Network().getData('/questions').then((value) {
      print(jsonDecode(value.body));
      questions = jsonDecode(value.body);
    });
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        name = user['fname'];
        user_id = user['id'].toString();
      });
    }
  }
  var _questionIndex = 0;
  var resultHttp = '';
  var answered = [];
  @override
  Widget build(BuildContext context) {


    void _answerQuestion() {

      setState(() {
        _questionIndex = _questionIndex + 1;

      });

      if(!(_questionIndex < questions.length)){
        postScore();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
        actions: [
          IconButton(
            onPressed: () => logout(),
            icon: Icon(Icons.exit_to_app),
          )
        ],
        backgroundColor: Colors.teal,
      ),
      body: Center(
          child: questions.isEmpty
              ? CircularProgressIndicator()
              : (_questionIndex < questions.length ? QuizView(
                  showCorrect: questions[_questionIndex]['showCorrect'],
                  tagBackgroundColor: Colors.tealAccent,
                  tagColor: Colors.black45,
                  questionTag: questions[_questionIndex]['questionTag'],
                  answerColor: Colors.black45,
                  answerBackgroundColor: Colors.tealAccent,
                  questionColor: Colors.white,
                  backgroundColor:  Colors.teal,
                  width: 300,
                  height: 600,
                  question: questions[_questionIndex]['question'],
                  rightAnswer: questions[_questionIndex]['rightAnswer'],
                  wrongAnswers: questions[_questionIndex]['wrongAnswers'].cast<String>(),
                  onRightAnswer: () {
                    answered.add({"question_id": questions[_questionIndex]["id"], "correct": 1, "user_id": int.parse(user_id)});
                    _answerQuestion();
                  },
                  onWrongAnswer: (){
                    answered.add({"question_id": questions[_questionIndex]["id"], "correct": 0, "user_id": int.parse(user_id)});
                    _answerQuestion();
                  },
                ): Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Your score is ' + resultHttp,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                FlatButton(
                  child: Text(
                    'Restart Quiz!',
                  ),
                  textColor: Colors.blue,
                  onPressed: () {
                   setState(() {
                     _questionIndex = 0;
                     resultHttp = '';
                     answered = [];
                   });

                  }
                ),
              ],
            ),
          ))),
    );
  }

  void logout() async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);

    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
  void postScore() async {
    var res = await Network().postData('/answers', answered);
    var body = json.decode(res.body);
   setState(() {
     resultHttp = body.toString();
   });

  }
}
