import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
void main() {
  runApp(
      MaterialApp(
          title: "Named routes demo",
          initialRoute: '/',
          routes: {
            '/': (context) => FirstScreen(),
            '/second': (context) => SecondScreen()
          }
      )
  );
}

class FirstScreen extends StatelessWidget {
  final TextEditingController _typeAheadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: TypeAheadField(
        keepSuggestionsOnSuggestionSelected: true,
              textFieldConfiguration: TextFieldConfiguration(
                  controller: this._typeAheadController,
                  autofocus: true,
                  style: DefaultTextStyle.of(context).style.copyWith(
                      fontStyle: FontStyle.italic
                  ),
                  decoration: InputDecoration(

                      border: OutlineInputBorder()
                  )
              ),
              suggestionsCallback: (pattern) async {
                return await BackendService.getSuggestions(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(suggestion['name']),
                  subtitle: Text('\$${suggestion['price']}'),
                );
              },
              onSuggestionSelected: (suggestion) {
                this._typeAheadController.text = suggestion["name"];
              },
            ),
        ),
    );
  }
}

class BackendService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(seconds: 1));
    return List.generate(3, (index){
        return {'name': query + index.toString(), 'price': Random().nextInt(100)};
    });
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route// off the Icons.stacked_bar_chart
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}