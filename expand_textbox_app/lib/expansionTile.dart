import 'package:flutter/material.dart';

class Expansiontile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Tile', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ExpansionTile(
              title: Text(
                "Flutter",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Android',
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text('Room Database'),
                    )
                  ],
                ),
                ListTile(
                  title: Text('Ios'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}