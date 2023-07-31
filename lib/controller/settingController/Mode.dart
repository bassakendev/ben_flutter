// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../dataBase/Tache.dart';
import '../../main.dart';

class Mode extends StatefulWidget {
  @override
  _ModeState createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  int tape = light ? 0 : 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisir un mode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choisissez un mode :',
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
              'Mode sélectionné :',
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
                  light ? 'Jour' : 'Nuit',
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
            light = !light;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => MyApp())));
        }
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: tape == modeId ? Colors.green : Colors.transparent,
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
            modeId == 0 ? 'Jour' : 'Nuit',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
