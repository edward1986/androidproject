import 'dart:io';
import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:image_picker/image_picker.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _imageFile;
  Size size;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Panorama(
        zoom: 1,
        animSpeed: 1.0,
        child: _imageFile != null ? Image.file(_imageFile) : Image.asset(
            'assets/brown_wood.jpg'),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () async {
          final picker = ImagePicker();
          final pickedFile = await picker.getImage(source: ImageSource.gallery);
          if(pickedFile != null){
            _imageFile = File(pickedFile.path);
          }
          setState(() {});
        },
        child: Icon(Icons.panorama),
      ),
    );
  }
}