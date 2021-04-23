import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../controllers/TodoController.dart';
import '../models/Todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find();
  final int index;

  TodoScreen({this.index});

  @override
  Widget build(BuildContext context) {
    String text = '';
    if (!this.index.isNull) {
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController =
    TextEditingController(text: text);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'What do you want to accomplish?',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red) ),
                  child: Text('Cancel'),
                  onPressed: () {
                    Get.back();
                  },
                ),
                ElevatedButton(
                  child: Text((this.index.isNull) ? 'Add' : 'Edit'),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green) ),
                  onPressed: () {
                    if (this.index.isNull) {
                      todoController.addData(Todo(text: textEditingController.text, done: false )).then((value) => todoController.todos.add(Todo(text: textEditingController.text, done: false )));

                    } else {
                      var editing = todoController.todos[index];
                      editing.text = textEditingController.text;
                      todoController.editData(editing).then((value) {
                        todoController.todos[index] = editing;
                      });
                    }

                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}