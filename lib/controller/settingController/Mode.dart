// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:Dumpi/assset/Home.dart';
import 'package:flutter/material.dart';

import '../../appAppearance/AppAppearance.dart';
import '../../dataBase/StoragesUtils.dart';
import '../../dataBase/Task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Mode extends StatefulWidget {
  @override
  _ModeState createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  AppAppearance app = AppAppearance();

  int tape = light ? 0 : 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: app.appearance(light, themes).primaryColor,
        title: Text(AppLocalizations.of(context)!.mode),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.choisissezUnMode,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                modeButton(0),
                modeButton(1),
              ],
            ),
            SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.modeSelectionne,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  light
                      ? AppLocalizations.of(context)!.jour
                      : AppLocalizations.of(context)!.nuit,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget modeButton(int modeId) {
    return GestureDetector(
      onTap: () {
        if (tape != modeId) {
          setState(() {
            tape = modeId;
            StoragesUtils.setMode(!light);
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: ((context) => Home())),
              ((route) => false));
        }
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: tape == modeId
              ? app.appearance(light, themes).secondlyColor
              : Colors.transparent,
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
            modeId == 0
                ? AppLocalizations.of(context)!.jour
                : AppLocalizations.of(context)!.nuit,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
