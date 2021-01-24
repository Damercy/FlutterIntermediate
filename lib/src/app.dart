// import required packages
import 'dart:convert';
import 'package:UdemyFlutter/src/models/image_model.dart';
import 'package:flutter/material.dart';
import 'widgets/widget_getter_functions/appbar.dart';

// Means just import the get function out of everything; Performance boost
import 'package:http/http.dart' show get;

// define a class as stateful or stateless
// Must define build() with context paramteter

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int imageIdCounter = 1;
  List<ImageModel> imageList;

  void fetchImage() async {
    imageIdCounter++; // Not in setState() as we don't care about displaying updating value
    // State is however maintained

    var response = await get(
        "https://jsonplaceholder.typicode.com/photos/$imageIdCounter");

    var imageModel = ImageModel.fromJson(jsonDecode(response.body));

    setState(() {
      imageList.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: headerAppBar("Image fetcher"),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          splashColor: Colors.blueAccent.shade700,
          onPressed: fetchImage,
        ), // NOTE: If a function calls another function, we can just pass the function reference as done here.
      ),
    );
  }
}
