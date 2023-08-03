// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, file_names, library_private_types_in_public_api, unused_local_variable

import 'package:intl/intl.dart';

import '../../../assset/Home.dart';
import 'package:flutter/material.dart';
import '../../appAppearance/AppAppearance.dart';
import '../../dataBase/DataBaseAction.dart';
import '../../dataBase/Task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateTask extends StatefulWidget {
  int id;
  UpdateTask({required this.id});
  @override
  _UpdateTaskState createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  AppAppearance app = AppAppearance();

  final _formkey = GlobalKey<FormState>();
  List<Task> tasksCopy = tasks;
  bool ok1 = false;
  bool ok2 = false;
  bool ok = false;
  int id = 1;
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    titleController = TextEditingController(text: tasksCopy[id].title);
    descriptionController =
        TextEditingController(text: tasksCopy[id].description);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.modifier),
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
                controller: titleController,
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
                  });
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  style: TextStyle(fontSize: 22.0),
                  controller: descriptionController,
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
                            ok = ok1 = ok2 = false;
                            final database = DatabaseHelper.instance;
                            database.updateTask(Task(
                                id: tasksCopy[id].id,
                                title: titleController.text,
                                description: descriptionController.text,
                                createdAt: DateFormat('MMM d HH:mm')
                                    .format(DateTime.now())));
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
                              app.appearance(light, themes).secondlyColor),
                        ),
                      ),
                    )),
              ),
            ),
          ]),
        ));
  }
}