// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../appAppearance/AppAppearance.dart';
import '../controller/settingController/SettingsController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../dataBase/Task.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AppAppearance app = AppAppearance();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: Scaffold(
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
      ),
    );
  }
}
