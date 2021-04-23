import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'todo.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      AlertDialog(
        title: Text('Create an Entry'),
        content: TextField(
          decoration: InputDecoration(hintText: 'Enter a task'),
          controller: controller,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text('Add'),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                final todo = Todo()
                  ..title = controller.text
                  ..completed = false;
                Hive.box('todos').add(todo);
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
}