// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import '../appAppearance/AppAppearance.dart';
import '../dataBase/StoragesUtils.dart';
import '../dataBase/Task.dart';
import '../l10n/L10n.dart';
import 'Settings.dart';
import '../controller/tasksController/TasksController.dart';
import 'Research.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AppAppearance app = AppAppearance();
  void changeIndexIconFooter(index) {
    setState(() {
      indexIconFooter = index;
    });
  }
  
  Locale _locale = Locale('en');
  String lg = '';
  @override
  void initState() {
    super.initState();
    _loadUtils();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final loadedTasks = await StoragesUtils.getTasks();

    setState(() {
      tasks = loadedTasks;
    });
  }

  Future<void> _loadUtils() async {
    final loadedMode = await StoragesUtils.getMode();
    final loadedTheme = await StoragesUtils.getTheme();
    final loadedLang = await StoragesUtils.getLang();

    setState(() {
      light = loadedMode;
      themes = loadedTheme;
      _locale = Locale(loadedLang);
      lg = loadedLang;
    });
  }

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = lg;
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: light ? ThemeMode.light : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: 'Bassakendev',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all(),
        locale: _locale,
        home: WillPopScope(
        onWillPop: () async {
          // Action à effectuer lorsque l'utilisateur appuie sur la touche physique de retour
          SystemNavigator.pop();
          // Retourne false pour empêcher la fermeture de l'application
          return false;
        },
        child: Center(
            child: Scaffold(
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
                                titre: '',
                                description: '',
                                id: 0)));
                  },
                  child: Row(children: [
                    Text(AppLocalizations.of(context)!.creer,
                        style: TextStyle(
                            color:
                                app.appearance(light, themes).secondlyColor)),
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
            ))));
  }
}
