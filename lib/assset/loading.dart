// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../appAppearance/AppAppearance.dart';
import '../dataBase/Task.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  AppAppearance app = AppAppearance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.all(30),
        child: Text(
          'Todo-List',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: app.appearance(light, themes).secondlyColor),
        ),
      ),
      CircularProgressIndicator(
        color: app.appearance(light, themes).secondlyColor,
      ),
    ])));
  }
}
