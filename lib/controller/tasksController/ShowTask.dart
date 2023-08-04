// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, file_names, library_private_types_in_public_api, unused_local_variable, empty_constructor_bodies, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../appAppearance/AppAppearance.dart';
import '../../dataBase/Task.dart';

class ShowTask extends StatefulWidget {
  final String title;
  final String description;
  ShowTask({required this.title, required this.description});
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<ShowTask> {
  AppAppearance app = AppAppearance();
  @override
  Widget build(BuildContext context) {
    String titre = widget.title;
    String description = widget.description;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(titre),
        backgroundColor: app.appearance(light, themes).primaryColor,
        titleTextStyle: TextStyle(
          letterSpacing: 5,
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(description,
              style: TextStyle(
                fontSize: 18,
              )),
        ),
      ]),
    );
  }
}
