import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.final// This class holds data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[

            TextField(
              onChanged: (value) {
                if (new RegExp('\t').hasMatch(
                    value.substring(
                        value.indexOf('\t'), value.indexOf('\t') + 1))) {
                  myController.text =
                      value.toString().replaceAll(new RegExp('\t'), "");

                  myFocusNode.requestFocus();
                }
              },
              controller: myController,
            ),
            TextField(
              focusNode: myFocusNode,
              onChanged: (text) {
                print('First text field: $text');
              },
            ),
          ],
        ),
      ),
    );
  }
}