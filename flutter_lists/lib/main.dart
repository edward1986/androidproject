import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: "Generator", home: new RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestion = <WordPair>[];
  final _biggestFont = const TextStyle(fontSize: 18);
final _saved = Set<WordPair>();
  Widget _buildSuggestions() {
    return new ListView.builder(itemBuilder: (context, i) {
      padding:
      const EdgeInsets.all(16.0);
      if (i.isOdd) return new Divider();
      final index = i ~/ 2;
      if (index >= _suggestion.length) {
        _suggestion.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestion[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Generator"),actions: <Widget>[
        new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved,)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggestFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }



  void _pushSaved() {
    Navigator.of(context).push(
      // ignore: missing_return
        new MaterialPageRoute(builder: (context) {
          final tiles = _saved.map((pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggestFont,
              ),
            );
          });
          final divided = ListTile.divideTiles(context: context, tiles: tiles)
              .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Saved Suggestions"),
            ),
            body: new ListView(children: divided),
          );
        })
    );
  }
}
