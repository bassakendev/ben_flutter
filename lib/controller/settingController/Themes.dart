// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:ben_flutter/dataBase/StoragesUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import '../../appAppearance/AppAppearance.dart';
import '../../dataBase/Task.dart';
import '../../l10n/L10n.dart';
import '../../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Themes extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
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
        title: Text(AppLocalizations.of(context)!.theme),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.choisissezUneCouleur,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                colorButton(
                    0, AppLocalizations.of(context)!.vert, Colors.green),
                colorButton(
                    1, AppLocalizations.of(context)!.jaune, Colors.yellow),
                colorButton(2, AppLocalizations.of(context)!.rouge, Colors.red),
                colorButton(
                    3, AppLocalizations.of(context)!.orange, Colors.orange),
                colorButton(4, AppLocalizations.of(context)!.rose, Colors.pink),
                colorButton(
                    5, AppLocalizations.of(context)!.violet, Colors.purple),
                colorButton(6, AppLocalizations.of(context)!.gris, Colors.grey),
                colorButton(7, AppLocalizations.of(context)!.bleu, Colors.blue),
              ],
            ),
            SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.couleurSelectionnee,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: getColor(themes),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  getThemeText(themes, context),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
        ));
  }

  Widget colorButton(int id, String colorName, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          StoragesUtils.setTheme(id);
        });

        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => MyApp())));
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            colorName,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Color getColor(int id) {
    switch (id) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.red;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.pink;
      case 5:
        return Colors.purple;
      case 6:
        return Colors.grey;
      case 7:
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }
}

String getThemeText(int themes, BuildContext context) {
  switch (themes) {
    case 0:
      return AppLocalizations.of(context)!.vert;
    case 1:
      return AppLocalizations.of(context)!.jaune;
    case 2:
      return AppLocalizations.of(context)!.rouge;
    case 3:
      return AppLocalizations.of(context)!.orange;
    case 4:
      return AppLocalizations.of(context)!.rose;
    case 5:
      return AppLocalizations.of(context)!.violet;
    case 6:
      return AppLocalizations.of(context)!.gris;
    case 7:
      return AppLocalizations.of(context)!.bleu;
    default:
      return AppLocalizations.of(context)!.vert;
  }
}
