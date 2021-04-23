import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './new_series_form.dart';
import '../models/series.dart';


class SeriesPage extends StatelessWidget {
  const SeriesPage({

    Key

    key

    ,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Series'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildListView()),
            NewSeriesForm(),
          ],
        ));
  }

  Widget _buildListView() {
    return ValueListenableBuilder(
       valueListenable: Hive.box('series').listenable(),
        builder: (ctxt, seriesBox, _) {
        return ListView.builder(
          itemCount: seriesBox.length,
          itemBuilder: (BuildContext context, int idx) {
            final series = seriesBox.getAt(idx) as Series;

            return ListTile(
              title: Text(series.name),
              subtitle: Text(series.ratings.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  IconButton(
                    icon: Icon(Icons.refresh, color: Colors.indigo,),
                    onPressed: () {
                      return seriesBox.putAt(idx, Series('${series.name}*',
                          series.ratings + 1));
                    },
                  ),

                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red,),
                    onPressed: () => seriesBox.deleteAt(idx),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}