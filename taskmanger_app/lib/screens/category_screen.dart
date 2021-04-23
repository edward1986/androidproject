import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import '../helpers/drawer_navigation.dart';
import '../models/category.dart';

import '../screens/home_screen.dart';
import '../services/category_service.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var _categoryName = TextEditingController();
  var _categoryDescription = TextEditingController();
  var _category = Category_();
  var _categorySevice = CategoryService();
  List<Category_> _categoryList = List<Category_>();

  var _editcategoryName = TextEditingController();

  var _editcategoryDescription = TextEditingController();

  var category;

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  getAllCategories() async {
    _categoryList = List<Category_>();
    var categories = await _categorySevice.getCategories();

    categories.forEach((category) {
      setState(() {
        var model = Category_();
        model.name = category['name'];
        model.description = category['description'];
        model.id = category['id'];
        _categoryList.add(model);
      });
    });
  }

  _showFormInDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                FlatButton(
                    onPressed: () async {
                      _category.name = _categoryName.text;
                      _category.description = _categoryDescription.text;
                      var result = await _categorySevice.saveCategory(
                          _category);
                      if (result > 0) {
                        Navigator.pop(context);
                        getAllCategories();
                      }
                    },
                    child: Text("Save"))
              ],
              title: Text("Category Form"),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _categoryName,
                      decoration: InputDecoration(
                          labelText: "Category Name",
                          hintText: "Write Category name"),
                    ),
                    TextField(
                      controller: _categoryDescription,
                      decoration: InputDecoration(
                          labelText: "Category Description",
                          hintText: "Write Category Description"),
                    )
                  ],
                ),
              ));
        });
  }

  _editFormInDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                FlatButton(
                    onPressed: () async {
                      _category.id = category[0]["id"];
                      _category.name = _editcategoryName.text;
                      _category.description = _editcategoryDescription.text;
                      var result = await _categorySevice.updateCategory(
                          _category);
                      if (result > 0) {
                        Navigator.pop(context);
                        getAllCategories();
                        _showSnackBar(Text("Success"));
                      }
                    },
                    child: Text("Update"))
              ],
              title: Text("Category edit Form"),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _editcategoryName,
                      decoration: InputDecoration(
                          labelText: "Category Name",
                          hintText: "Write Category name"),
                    ),
                    TextField(
                      controller: _editcategoryDescription,
                      decoration: InputDecoration(
                          labelText: "Category Description",
                          hintText: "Write Category Description"),
                    )
                  ],
                ),
              ));
        });
  }

  _deleteFormInDialog(BuildContext context, categoryId) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  child: Text(
                    "Cancel", style: TextStyle(color: Colors.white),)),
              FlatButton(
                  onPressed: () async {
                    await _categorySevice.deleteCategory(categoryId);
                  },
                  color: Colors.red,
                  child: Text("Delete", style: TextStyle(color: Colors.white),))
            ],
            title: Text("Are you sure, you want to delete?"),
          );
        });
  }

  _editCategory(BuildContext context, categoryId) async {
    category = await _categorySevice.getCategoryById(categoryId);

    setState(() {
      _editcategoryName.text = category[0]["name"];
      _editcategoryDescription.text = category[0]["description"];
    });
    _editFormInDialog(context);
  }

  _showSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _scaffoldKey.currentState.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: RaisedButton(
          elevation: 0,
          color: Colors.red,
          child: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        title: Text("Todo"),
      ),
      body: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      print(_categoryList[index].id);
                      _editCategory(context, _categoryList[index].id);
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_categoryList[index].name),
                      IconButton(icon: Icon(Icons.delete), onPressed: () {
                        _deleteFormInDialog(context, _categoryList[index].id);
                      }),
                    ],
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormInDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
