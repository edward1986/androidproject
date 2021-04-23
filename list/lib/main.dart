import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Generator",
        home: new RandomWords()
    );
  }
}
class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }

}
class RandomWordsState extends State<RandomWords>{
  final _suggestion = <WordPair>[];
  final _biggestFont = const TextStyle(fontSize: 18);
  Widget _buildSuggestions(){
    return new ListView.builder(
        itemBuilder:(context, i) {
      padding: const EdgeInsets.all(16.0),
        if(i.isOdd) return new Divider();
        final index = i ~/ 2;
        if(index >= _suggestion.length) {
          _suggestion.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestion[index]);
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title : new Text("Generator")
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggestFont ,
      ),
    );
  }
}


