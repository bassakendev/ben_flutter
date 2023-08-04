// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, file_names, library_private_types_in_public_api, unused_local_variable, empty_constructor_bodies, prefer_const_constructors_in_immutables, avoid_unnecessary_containers


import 'package:ben_flutter/dataBase/StoragesUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import '../../appAppearance/AppAppearance.dart';
import '../../dataBase/Task.dart';
import '../../l10n/L10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowTask extends StatefulWidget {
  final String title;
  final String description;
  ShowTask({required this.title, required this.description});
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<ShowTask> {
  AppAppearance app = AppAppearance();
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
    String titre = widget.title;
    String description = widget.description;  
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
        home: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(titre),
        backgroundColor: app.appearance(light, themes).primaryColor,
        titleTextStyle: TextStyle(
          letterSpacing: 5,
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(description,
              style: TextStyle(
                fontSize: 18,
              )),
        ),
      ),
        ));
  }
}
