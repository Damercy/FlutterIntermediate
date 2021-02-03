import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News list"),
      ),
      body: Text("News list body"),
    );
  }
}
