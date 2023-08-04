// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, must_be_immutable, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import '../appAppearance/AppAppearance.dart';
import '../controller/settingController/SettingsController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dataBase/StoragesUtils.dart';
import '../dataBase/Task.dart';
import '../l10n/L10n.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
        backgroundColor: app.appearance(light, themes).primaryColor,
        title: Text(AppLocalizations.of(context)!.reglages),
      ),
      body: ListView(
        children: [
          ListTile(
              leading: Icon(Icons.brightness_6,
                  color: app.appearance(light, themes).primaryColor),
              title: Text(AppLocalizations.of(context)!.mode),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SettingsController(opperation: 'Mode')));
              }),
          ListTile(
            leading: Icon(Icons.color_lens,
                color: app.appearance(light, themes).primaryColor),
            title: Text(AppLocalizations.of(context)!.theme),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsController(opperation: 'Theme')));
            },
          ),
          ListTile(
            leading: Icon(Icons.language,
                color: app.appearance(light, themes).primaryColor),
            title: Text(AppLocalizations.of(context)!.langue),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsController(opperation: 'Langue')));
            },
          ),
          ListTile(
              leading: Icon(Icons.info,
                  color: app.appearance(light, themes).primaryColor),
              title: Text(AppLocalizations.of(context)!.apropos),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SettingsController(opperation: 'A propos')));
              })
        ],
      ),
        ));
  }
}
