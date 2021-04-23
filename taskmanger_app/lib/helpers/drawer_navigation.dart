import "package:flutter/material.dart";
import '../screens/category_screen.dart';
import '../screens/home_screen.dart';
import '../screens/todo_by_category.dart';
import '../services/category_service.dart';
class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  List<Widget> _categoryList = List<Widget>();
  CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _categoryService.getCategories();

    categories.forEach((category) {
      setState(() {
        _categoryList.add(InkWell(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              TodosByCategory(
                categoryId: category["id"], category: category["name"],)));
        }, child: ListTile(title: Text(category["name"]),)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Todo"),
                accountEmail: Text("To write all todo"),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: Icon(
                        Icons.account_circle_sharp, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.red),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => new HomeScreen()));
                },
              ),
              ListTile(
                title: Text("Category"),
                leading: Icon(Icons.category),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => new CategoryScreen()));
                },
              ),
              Divider(),
              Column(
                children: _categoryList,
              )
            ],
          ),
        )
    );
  }

}
