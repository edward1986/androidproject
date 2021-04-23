import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'Person.dart';
class PeopleList extends StatefulWidget {
  @override
  _PeopleListState createState() => _PeopleListState();
}
class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('People'),),
      body: scaffoldBody,
      floatingActionButton: FloatingActionButton(
        // An Add button. When the user taps it, we send
        // // them to PeopleUpsert with NO person object.


        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/peopleUpsert');
        },
      ),
    );
  }

  // Note how we pull out details to make the widget more
// abstract for you. We do the same with personWidget below.

  Widget get scaffoldBody {
    return FutureBuilder<dynamic>(
      future: fetchPeople(),
      // How we'll get the people

      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (snapshot.hasError) {

          return Text('Oh no! Error! ${snapshot.error}');
        }
        if (!snapshot.hasData)
        {
          return const Text('No people found');
        }
        // Convert the JSON data to an array of Persons

        final List<Person> people =
        Person.fromJsonArray(snapshot.data.body);
        // Convert the list of persons to a list of I

        final List<Widget> personTiles = people
            .map<Widget>((Person person) => personWidget(person))
            .toList();
        // Display all the person tiles in a scrollable GridView

        return GridView.extent(
          maxCrossAxisExtent: 300,
          children: personTiles,
        );
      },
    );
  }

  Future<dynamic> fetchPeople() {
    // pipedreamRESTUrl is the URL you made note of before

    final String url =
        'https://jsonplaceholder.typicode.com/photos';
    return get(url);
  }

  void deletePerson(Person person) {
    final String url =
        'https://jsonplaceholder.typicode.com/posts';
    delete(url).then((Response res) {
      // Call setState() to rerender AFTER the person is gone

      setState(() {
        print('Status code: ${res.statusCode}');
      });
    });
  }

// Displaying a single person tile.

  Widget personWidget(Person person) {
    print("im heare"+  person.id.toString());
    return InkWell(
      child: GestureDetector(
        // When the user taps a person tile, we let them edit him/her

        onTap: () {
          Navigator.pushNamed<dynamic>(context, '/peopleUpsert',
              arguments: person);
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          child: Stack(
            children: <Widget>[
              if (person.imageUrl != null)
                Image.network(person.imageUrl,
                    height: 300, width: 300, fit: BoxFit.cover),
              Image.asset(
                  'assets/images/NoImage.jpg'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      '${person.name}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  // A trash can icon to delete this person
                  //

                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      deletePerson(person);
                    },
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  person.email,
                  style: Theme
                      .of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}