// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../appAppearance/AppAppearance.dart';
import '../controller/settingController/SettingsController.dart';
import '../dataBase/Tache.dart';

class Settings extends StatelessWidget {
  AppAppearance app = AppAppearance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app.appearance(light, themes).primaryColor,
        title: Text('Réglages'),
      ),
      body: ListView(
        children: [
          ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Mode'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SettingsController(opperation: 'Mode')));
              }),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Thème'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsController(opperation: 'Theme')));
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Langue'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsController(opperation: 'Langue')));
            },
          ),
          ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SettingsController(opperation: 'A propos')));
              })
        ],
      ),
    );
  }
}
