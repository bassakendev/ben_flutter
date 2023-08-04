// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

import 'CreatTask.dart';
import 'ShowTask.dart';
import 'UpdateTask.dart';

class TasksController extends StatefulWidget {
  final String opperation;
  late String title;
  late String description;
  late String time;
  TasksController(
      {required this.opperation,
      required this.title,
      required this.description,
      required this.time});
  @override
  _TasksControllerState createState() => _TasksControllerState();
}

class _TasksControllerState extends State<TasksController> {
  @override
  Widget build(BuildContext context) {
    String opperation = widget.opperation;
    String title = widget.title;
    String description = widget.description;
    String time = widget.time;

    return opperation == 'create'
            ? CreatTask()
            : opperation == 'show'
                ? ShowTask(
                title: title,
                    description: description,
                  )
                : opperation == 'update'
                ? UpdateTask(
                    title: title,
                    description: description,
                    time: time,
                  )
                : const MaterialApp();
  }
}
