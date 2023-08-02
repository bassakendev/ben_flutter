// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, file_names, library_private_types_in_public_api, unused_local_variable

import '../../../assset/Home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';

import '../../appAppearance/AppAppearance.dart';
import '../../dataBase/Task.dart';

class CreatTask extends StatefulWidget {
  @override
  _CreatTaskState createState() => _CreatTaskState();
}

class _CreatTaskState extends State<CreatTask> {
  AppAppearance app = AppAppearance();
  final _formkey = GlobalKey<FormState>();
  List<Task> tachesCopy = [];
  String title = '';
  String description = '';
  bool ok1 = false;
  bool ok2 = false;
  bool ok = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nouvelle Tache'),
          backgroundColor: app.appearance(light, themes).primaryColor,
          titleTextStyle: TextStyle(
            letterSpacing: 5,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        body: Form(
          key: _formkey,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                style: TextStyle(fontSize: 22.0),
                maxLines: null,
                cursorColor: app.appearance(light, themes).secondlyColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Titre...',
                  labelStyle: TextStyle(
                      color: app.appearance(light, themes).secondlyColor,
                      fontSize: 30),
                ),
                onChanged: (value) {
                  setState(() {
                    ok1 = value.isEmpty ? false : true;
                    ok = (ok1 || ok2) ? true : false;
                    title = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  style: TextStyle(fontSize: 22.0),
                  cursorColor: app.appearance(light, themes).secondlyColor,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Description...',
                      labelStyle: TextStyle(
                        color: app.appearance(light, themes).secondlyColor,
                        fontSize: 18,
                      )),
                  onChanged: (value) {
                    setState(() {
                      ok2 = value.isEmpty ? false : true;
                      ok = (ok1 || ok2) ? true : false;
                      description = value;
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: SizedBox(
                    height: 40,
                    width: 100,
                    child: Opacity(
                      opacity: ok ? 1.0 : 0.0,
                      child: TextButton(
                        onPressed: () {
                          _formkey.currentState?.save();
                          tachesCopy.add(Task(
                              title,
                              description,
                              DateFormat('MMM d HH:mm')
                                  .format(DateTime.now())));
                          setState(() {
                            ok = ok1 = ok2 = false;
                            title = description = '';
                          });
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (builder) => Home()));
                        },
                        child: Text('Enregistrer',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              app.appearance(light, themes).primaryColor),
                        ),
                      ),
                    )),
              ),
            ),
          ]),
        ));
  }
}
