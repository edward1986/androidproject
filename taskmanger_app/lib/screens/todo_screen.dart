import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todo.dart';
import '../services/category_service.dart';
import '../services/todo_service.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  var _todoTitle = TextEditingController();
  var _todoDecription = TextEditingController();
  var _todoDate = TextEditingController();
  var _categories = List<DropdownMenuItem>();
  var _selectedValue;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  _loadCategories() async {
    var _categoryService = CategoryService();
    var categories = await _categoryService.getCategories();
    categories.forEach((category) {
      setState(() {
        _categories.add(DropdownMenuItem(
          child: Text(category["name"]),
          value: category["id"],
        ));
      });
    });
  }

  DateTime _date = DateTime.now();

  _selectTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2099));
    if (_pickedDate != null) {
      setState(() {
        _date = _pickedDate;
        _todoDate.text = DateFormat("yyyy-MM-dd").format(_pickedDate);
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _showSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _scaffoldKey.currentState.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Create Todo"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _todoTitle,
            decoration:
            InputDecoration(hintText: "Todo title", labelText: "Cook food"),
          ),
          TextField(
            controller: _todoDecription,
            maxLines: 3,
            decoration: InputDecoration(
                hintText: "Todo Decription", labelText: "Cook food and curry"),
          ),
          TextField(
            controller: _todoDate,
            decoration: InputDecoration(
                hintText: "YY-MM-DD",
                labelText: "YY-MM-DD",
                prefixIcon: InkWell(
                  child: Icon(Icons.calendar_today),
                  onTap: () {
                    _selectTodoDate(context);
                  },
                )),
          ),
          DropdownButtonFormField(
              items: _categories,
              value: _selectedValue,
              hint: Text("Select one category"),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              }),
          RaisedButton(child: Text("Save"), onPressed: () async {
            var todoObj = Todo();
            todoObj.title = _todoTitle.text;
            todoObj.description = _todoDecription.text;
            todoObj.todoDate = _todoDate.text;
            todoObj.category = _selectedValue.toString();
            todoObj.isFinished = 0;
            var _todoService = TodoService();
            var result = await _todoService.saveTodo(todoObj);
            if (result > 0) {
              _showSnackBar(Text("Success"));
            }
          })
        ],
      ),
    );
  }
}
