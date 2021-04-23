import "package:flutter/material.dart";import '../models/todo.dart';
import '../services/todo_service.dart';
class TodosByCategory extends StatefulWidget {
  final int categoryId;
  final String category;

  const TodosByCategory({this.categoryId, this.category});

  @override
  _TodosByCategoryState createState() => _TodosByCategoryState();
}

class _TodosByCategoryState extends State<TodosByCategory> {
  @override
  void initState() {
    super.initState();
    getTodosByCategory();
  }

  List<Todo> _todoList = List<Todo>();
  TodoService _todoService = TodoService();

  getTodosByCategory() async {
    var todos = await _todoService.getTodoById(this.widget.categoryId);
    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.title = todo["title"];
        _todoList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.widget.category),
        ),
        body: Column(
          children: [
            Text(this.widget.category),
            Expanded(child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return Text(_todoList[index].title);
              },
            ))
          ],
        )
    );
  }
}
