import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../bloc/userBloc.dart';
import '../models/userModel.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() =>  _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  List<UserModel> totalUsers = [];

  void search(String searchQuery) {
    List<UserModel> searchResult = [];

    userBloc.userController.sink.add(null);

    if (searchQuery.isEmpty) {
      userBloc.userController.sink.add(totalUsers);
      return;
    }
    totalUsers.forEach((user) {
      if (user.first.toLowerCase().contains(searchQuery.toLowerCase()) ||
          user.last.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchResult.add(user);
      }
    });
    userBloc.userController.sink.add(searchResult);
  }

  Future<void> fetchUsers() async {
    final url = 'https://randomuser.me/api/?results=100';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      final Iterable list = body["results"];
      // map each json object to model and addto list and return the list of models
      totalUsers = list.map((model) => UserModel.fromJson(model)).toList();
      userBloc.userController.sink.add(totalUsers);
    }
  }

  @override
  Widget build(BuildContext context) {
    appBar
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SizedBox(height: 20),
usersWidget(),

          ],
        ),
      ),
    );
  }
  Widget buildFloatingSearchBar() {
    final isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        search(query);
      },

      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: true,
        ),
      ],
      builder: (context, transition) {
        return StreamBuilder(
          stream: userBloc.userController.stream,
          builder:
              (BuildContext buildContext, AsyncSnapshot<List<UserModel>> snapshot) {
            if (snapshot == null) {
              return CircularProgressIndicator();
            }
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.network('${snapshot.data[index].picture}'),
                    title: Text(
                      '${snapshot.data[index].first} ${snapshot.data[index].last}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
  Widget usersWidget() {
    return StreamBuilder(
      stream: userBloc.userController.stream,
      builder:
          (BuildContext buildContext, AsyncSnapshot<List<UserModel>> snapshot) {
        if (snapshot == null) {
          return CircularProgressIndicator();
        }
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Image.network('${snapshot.data[index].picture}'),
                title: Text(
                  '${snapshot.data[index].first} ${snapshot.data[index].last}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
    );
  }
}