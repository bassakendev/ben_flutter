// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../dataBase/Tache.dart';
import 'Formulaire.dart';
import 'ShowTache.dart';

class TacheOpperation extends StatefulWidget {
  final String opperation;
  late String titre;
  late String description;
  TacheOpperation(
      {required this.opperation,
      required this.titre,
      required this.description});
  @override
  _TacheOpperationState createState() => _TacheOpperationState();
}

class _TacheOpperationState extends State<TacheOpperation> {
  @override
  Widget build(BuildContext context) {
    String opperation = widget.opperation;
    String titre = widget.titre;
    String description = widget.description;

    if (opperation == 'create-task') {
      return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: light ? ThemeMode.light : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          title: 'Bassakendev',
          home: Formulaire());
    } else {
      return ShowTache(
        titre: titre,
        description: description,
      );
    }
  }
}
