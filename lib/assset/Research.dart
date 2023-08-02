// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, unused_local_variable, library_private_types_in_public_api, must_be_immutable, prefer_const_constructors_in_immutables

import '../appAppearance/AppAppearance.dart';
import '../dataBase/dataBaseAction.dart';
import 'TaskList.dart';
import 'package:flutter/material.dart';
import '../dataBase/Task.dart';

class Research extends StatefulWidget {
  @override
  _ResearchState createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  List<Task> tachesCopy = [];

  AppAppearance app = AppAppearance();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final database = DatabaseHelper.instance;
    final loadedTasks = await database.getTasks();

    setState(() {
      tachesCopy = loadedTasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20.0),
            Expanded(
                child: SizedBox(
              child: TextField(
                cursorColor: app.appearance(light, themes).secondlyColor,
                decoration: InputDecoration(
                    prefixIconColor:
                        app.appearance(light, themes).secondlyColor,
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: app.appearance(light, themes).secondlyColor),
                    ),
                    labelText: 'Rechercher...',
                    labelStyle: TextStyle(
                      color: app.appearance(light, themes).secondlyColor,
                    )),
                onChanged: (value) {
                  for (int i = 0; i < tachesCopy.length; i++) {
                    if (tachesCopy[i]
                            .title
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        tachesCopy[i]
                            .description
                            .toLowerCase()
                            .contains(value.toLowerCase())) {
                      setState(() {
                        tachesCopy[i].setFind(true);
                      });
                    } else {
                      setState(() {
                        tachesCopy[i].setFind(false);
                      });
                    }
                  }
                  if (value == '') {
                    for (int i = 0; i < tachesCopy.length; i++) {
                      tachesCopy[i].setFind(true);
                    }
                  }
                },
              ),
            )),
          ],
        ),
      ),
      TaskList(tasks: tachesCopy)
    ]);
  }
}
