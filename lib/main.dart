// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, library_private_types_in_public_api

import 'package:ben_flutter/dataBase/StoragesUtils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'assset/loading.dart';
import 'package:flutter/material.dart';
import 'assset/Home.dart';
import 'dataBase/DataBaseAction.dart';
import 'dataBase/Task.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _loadResources() async {
    // Simulate loading resources
    await Future.delayed(Duration(seconds: 5));
  }

  @override
  void initState() {
    super.initState();
    _loadUtils();
    _loadTasks();
  }

  Future<void> _loadUtils() async {
    final loadedMode = await StoragesUtils.getMode();
    final loadedTheme = await StoragesUtils.getTheme();

    setState(() {
      light = loadedMode;
      themes = loadedTheme;
    });
  }

  Future<void> _loadTasks() async {
    final database = DatabaseHelper.instance;
    final loadedTasks = await database.getTasks();

    setState(() {
      tasks = loadedTasks;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        supportedLocales: [
          Locale('fr'),
          Locale('en'),
          Locale('de'),
          Locale('es'),
          Locale('pt'),
          Locale('it'),
          Locale('ar'),
          Locale('ru'),
        ],
        home: FutureBuilder<void>(
            future: _loadResources(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              } else {
                return Home();
              }
            }));
  }
}
