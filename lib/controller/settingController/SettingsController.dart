// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'Apropos.dart';
import 'Langues.dart';
import 'Mode.dart';
import 'Themes.dart';

class SettingsController extends StatefulWidget {
  final String opperation;
  SettingsController({required this.opperation});
  @override
  _SettingsControllerState createState() => _SettingsControllerState();
}

class _SettingsControllerState extends State<SettingsController> {
  @override
  Widget build(BuildContext context) {
    String opperation = widget.opperation;
    return (opperation == 'Theme')
        ? Themes()
        : (opperation == 'Langue')
            ? Langues()
            : (opperation == 'A propos')
                ? Apropos()
                : Mode();
  }
}
