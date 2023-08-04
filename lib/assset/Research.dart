// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, unused_local_variable, library_private_types_in_public_api, must_be_immutable, prefer_const_constructors_in_immutables

import '../appAppearance/AppAppearance.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'TaskList.dart';
import 'package:flutter/material.dart';
import '../dataBase/Task.dart';

class Research extends StatefulWidget {
  @override
  _ResearchState createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
   
  //  Future<void> _loadUtils() async {
  //   final loadedMode = await StoragesUtils.getTasks();

  //   setState(() {
  //     light = loadedMode;
  //     themes = loadedTheme;
  //   });
  // }

  //  @override
  // void initState() {
  //   super.initState();
  //   _loadUtils();
  //   _loadTasks();
  // }

  
  List<Task> tasksCopy = tasks;

  AppAppearance app = AppAppearance();

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
                    labelText: AppLocalizations.of(context)!.rechercher,
                    labelStyle: TextStyle(
                      color: app.appearance(light, themes).secondlyColor,
                    )),
                onChanged: (value) {
                  for (int i = 0; i < tasksCopy.length; i++) {
                    if (tasksCopy[i]
                            .title
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        tasksCopy[i]
                            .description
                            .toLowerCase()
                            .contains(value.toLowerCase())) {
                      setState(() {
                        tasksCopy[i].setFind(true);
                      });
                    } else {
                      setState(() {
                        tasksCopy[i].setFind(false);
                      });
                    }
                  }
                  if (value == '') {
                    for (int i = 0; i < tasksCopy.length; i++) {
                      tasksCopy[i].setFind(true);
                    }
                  }
                },
              ),
            )),
          ],
        ),
      ),
      TaskList(tasks: tasksCopy)
    ]);
  }
}
