import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShaderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("ShaderMask Demo")
      ),
      body: Center(
        child: ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.red]
            ).createShader(bounds);
          },
          blendMode: BlendMode.color,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset("assets/showroom.jpg", fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}