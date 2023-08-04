// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, file_names, library_private_types_in_public_api, unused_local_variable

import 'package:ben_flutter/dataBase/StoragesUtils.dart';

import '../../../assset/Home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';

import '../../appAppearance/AppAppearance.dart';
import '../../dataBase/Task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreatTask extends StatefulWidget {
  @override
  _CreatTaskState createState() => _CreatTaskState();
}

class _CreatTaskState extends State<CreatTask> {
  List<Task> tasksCopy = tasks;
  AppAppearance app = AppAppearance();
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  bool ok1 = false;
  bool ok2 = false;
  bool ok = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppLocalizations.of(context)!.nouvelleTache),
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
                  labelText: AppLocalizations.of(context)!.titre,
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
                      labelText: AppLocalizations.of(context)!.descritpion,
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

                          setState(() {
                            Future<void> fast() async {
                              String lang = await StoragesUtils.getLang();
                              tasksCopy.add(Task(
                                  title: title,
                                  description: description,
                                  createdAt: DateFormat("MMM d HH:mm", lang)
                                      .format(DateTime.now()),
                                  statut: 'false'));
                              await StoragesUtils.saveTasks(tasksCopy);
                              tasks = await StoragesUtils.getTasks();
                            }

                            fast();
                            ok = ok1 = ok2 = false;
                          });
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (builder) => Home()));
                        },
                        child: Text(AppLocalizations.of(context)!.enregistrer,
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
