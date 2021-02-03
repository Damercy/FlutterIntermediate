import 'package:UdemyFlutter/src/screens/news_list.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Hacker news", home: NewsList());
  }
}
