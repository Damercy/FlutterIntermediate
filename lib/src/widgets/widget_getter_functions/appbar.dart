import 'package:flutter/material.dart';

AppBar headerAppBar(String title){
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 30.0,
      ),
    ),
  );
}
