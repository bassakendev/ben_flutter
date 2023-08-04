// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

import 'CreatTask.dart';
import 'ShowTask.dart';
import 'UpdateTask.dart';

class TasksController extends StatefulWidget {
  final String opperation;
  late String titre;
  late String description;
  late int id;
  TasksController(
      {required this.opperation,
      required this.titre,
      required this.description,
      required this.id});
  @override
  _TasksControllerState createState() => _TasksControllerState();
}

class _TasksControllerState extends State<TasksController> {
  @override
  Widget build(BuildContext context) {
    String opperation = widget.opperation;
    String titre = widget.titre;
    String description = widget.description;
    int id = widget.id;

    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: opperation == 'create'
            ? CreatTask()
            : opperation == 'show'
                ? ShowTask(
                    title: titre,
                    description: description,
                  )
                : opperation == 'update'
                    ? UpdateTask(id: id)
                    : const MaterialApp());
  }
}
