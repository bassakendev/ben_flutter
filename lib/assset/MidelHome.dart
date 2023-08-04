// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:Dumpi/assset/Research.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:intl/intl.dart';

import '../appAppearance/AppAppearance.dart';
import '../controller/tasksController/TasksController.dart';
import '../dataBase/Task.dart';
import 'Settings.dart';

class MidelHome extends StatefulWidget {
  @override
  _MidelHomeState createState() => _MidelHomeState();
}

class _MidelHomeState extends State<MidelHome> {
  AppAppearance app = AppAppearance();
  void changeIndexIconFooter(index) {
    setState(() {
      indexIconFooter = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = lang;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
          Text(AppLocalizations.of(context)!.taches),
          Spacer(),
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TasksController(
                            opperation: 'create',
                            title: '',
                            description: '',
                            time: '')));
              },
              child: Row(children: [
                Text(AppLocalizations.of(context)!.creer,
                    style: TextStyle(
                        color: app.appearance(light, themes).secondlyColor)),
                Icon(Icons.add_box,
                    color: app.appearance(light, themes).primaryColor)
              ]))
        ]),
        backgroundColor: app.appearance(light, themes).primaryColor,
        titleTextStyle: TextStyle(
          letterSpacing: 5,
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: indexIconFooter == 2 ? Settings() : Research(),
      ),
      bottomNavigationBar: Container(
        height: 70.0, // Hauteur du footer
        color: app.appearance(light, themes).secondlyColor,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
              color: indexIconFooter == 0 ? Colors.white : Colors.black,
              iconSize: 25,
              onPressed: () => {
                    changeIndexIconFooter(0),
                  },
              icon: Icon(Icons.work_history)),
          SizedBox(
            width: 50,
          ),
          IconButton(
              color: indexIconFooter == 1 ? Colors.white : Colors.black,
              iconSize: 35,
              onPressed: () => {
                    changeIndexIconFooter(1),
                  },
              icon: Icon(Icons.task_alt_rounded)),
          SizedBox(
            width: 50,
          ),
          IconButton(
              iconSize: 35,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()))
                  },
              icon: Icon(Icons.settings))
        ]),
      ),
    );
  }
}
