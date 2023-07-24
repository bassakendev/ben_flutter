// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, file_names, library_private_types_in_public_api, unused_local_variable, empty_constructor_bodies, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ShowTache extends StatefulWidget {
  final String titre;
  final String description;
  ShowTache({required this.titre, required this.description});
  @override
  _TacheState createState() => _TacheState();
}

class _TacheState extends State<ShowTache> {
  @override
  Widget build(BuildContext context) {
    String titre = widget.titre;
    String description = widget.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(
          letterSpacing: 5,
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(description,
              style: TextStyle(
                color: Color.fromARGB(255, 26, 29, 26),
                fontSize: 18,
              )),
        ),
      ),
    );
  }
}
