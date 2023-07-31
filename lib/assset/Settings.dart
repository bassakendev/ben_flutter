// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import '../controller/settingController/SettingsController.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
