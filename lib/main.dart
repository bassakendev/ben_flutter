// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, library_private_types_in_public_api

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'assset/loading.dart';
import 'package:flutter/material.dart';
import 'assset/Home.dart';
import 'dataBase/Task.dart';
import 'l10n/L10n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future<void> _loadResources() async {
    // Simulate loading resources
    await Future.delayed(Duration(seconds: 8));
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
