// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, library_private_types_in_public_api

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'assset/loading.dart';
import 'package:flutter/material.dart';
import 'assset/Home.dart';
import 'dataBase/StoragesUtils.dart';
import 'dataBase/Task.dart';
import 'l10n/L10n.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _loadResources() async {
    // Simulate loading resources
    await Future.delayed(Duration(seconds: 8));
  }
  String lg = '';
  @override
  void initState() {
    super.initState();
    _loadUtils();
    _loadTasks();
  }

  Future<void> _loadUtils() async {
    final loadedMode = await StoragesUtils.getMode();
    final loadedTheme = await StoragesUtils.getTheme();
    final loadedLang = await StoragesUtils.getLang();

    setState(() {
      light = loadedMode;
      themes = loadedTheme;
      lang = loadedLang;
    });
  }

  Future<void> _loadTasks() async {
    final loadedTasks = await StoragesUtils.getTasks();

    setState(() {
      tasks = loadedTasks;
    });
  }
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = lang;
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
        locale: Locale(lang),
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
