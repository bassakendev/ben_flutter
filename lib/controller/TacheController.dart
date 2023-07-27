// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'CreatTache.dart';
import 'ShowTache.dart';
import 'UpdateTache.dart';

class TacheController extends StatefulWidget {
  final String opperation;
  late String titre;
  late String description;
  late int id;
  TacheController(
      {required this.opperation,
      required this.titre,
      required this.description,
      required this.id});
  @override
  _TacheControllerState createState() => _TacheControllerState();
}

class _TacheControllerState extends State<TacheController> {
  @override
  Widget build(BuildContext context) {
    String opperation = widget.opperation;
    String titre = widget.titre;
    String description = widget.description;
    int id = widget.id;

    if (opperation == 'create') {
      return CreatTache();
    } else if (opperation == 'show') {
      return ShowTache(
        titre: titre,
        description: description,
      );
    } else if (opperation == 'update') {
      return UpdateTache(id: id);
    } else {
      return const MaterialApp();
    }
  }
}
