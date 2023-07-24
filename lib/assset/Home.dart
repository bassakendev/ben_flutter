// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, library_private_types_in_public_api

import 'Formulaire.dart';
import 'Recherche.dart';
import 'Tache.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Tache> tacheCopy = taches;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
          Text('Taches'),
          Spacer(),
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Formulaire()));
              },
              child: Row(children: [
                Text('Créer', style: TextStyle(color: Colors.green)),
                Icon(Icons.add_box, color: Colors.green)
              ])),
        ]),
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(
          letterSpacing: 5,
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Recherche(),
      ),
    );
  }
}
