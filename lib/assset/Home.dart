// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, library_private_types_in_public_api


import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dataBase/Task.dart';
import '../l10n/L10n.dart';
import 'package:flutter/material.dart';

import 'MidelHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
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
      home: MidelHome(),
    );
  }
}
