import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/series.dart';

class NewSeriesForm extends StatefulWidget {
  @override
  _NewSeriesFormState createState() => _NewSeriesFormState();
}

class _NewSeriesFormState extends State<NewSeriesForm> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _ratings;


  void addSeries(Series series) {
    final seriesBox = Hive.box('series');

    seriesBox.add(
        series); //since we have defined typeAdapter for Series class we can direclty add series object inside add(), other wise we need to convert it to json string

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[

          Row(
            children: <Widget>[
              Expanded(

                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) => _name = value,
                ),
              ),
              SizedBox(width: 10),
              Expanded(

                child: TextFormField(
                  decoration: InputDecoration(labelText: 'ratings'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _ratings = value,
                ),
              ),
            ],
          ),

          RaisedButton(
            child: Text('Add New Series'),
            onPressed: () {
              _formKey.currentState.save();
              final newSeries = Series(_name, int.parse(_ratings));

              addSeries(newSeries);
              _formKey.currentState.reset();
            },
          ),
        ],
      ),
    );
  }
}