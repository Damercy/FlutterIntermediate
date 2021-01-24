// import required packages
import 'package:flutter/material.dart';

// define a class as stateful or stateless
// Must define build() with context paramteter
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Hello!',
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
    );
  }
}
