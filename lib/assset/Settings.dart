// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

import 'Home.dart';
import '../dataBase/Tache.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String mode = light ? 'Jour' : 'Nuit';
  List<Object> option = [
    {'settingsOption': 'Mode', 'defaultValue': 'mode'},
    {'settingsOption': 'Theme', 'defaultValue': 'Vert'},
    {'settingsOption': 'Langue', 'defaultValue': 'Francais'},
    {'settingsOption': 'A propos', 'defaultValue': 'Todo-List 1.0'}
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: light ? ThemeMode.light : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: 'Bassakendev',
        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => Home()));
                  },
                  child: Icon(size: 40, Icons.home, color: Colors.white),
                ),
                Spacer(),
                Text('Setting'),
              ]),
              backgroundColor: light
                  ? Color.fromARGB(255, 89, 172, 90)
                  : const Color.fromARGB(255, 33, 68, 35),
              titleTextStyle: TextStyle(
                letterSpacing: 5,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            body: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                    itemCount: option.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        height: 80,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: light
                              ? Color.fromARGB(255, 214, 230, 214)
                              : Color.fromARGB(255, 82, 99, 82),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              print(option[i]);
                              if ((option[i] as Map<String, dynamic>)[
                                      'settingsOption'] ==
                                  'Mode') {
                                setState(() {
                                  light = !light;

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => Home()));
                                });
                              }
                            },
                            style: ButtonStyle(
                                shadowColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent)),
                            child: Row(children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      (option[i] as Map<String, dynamic>)[
                                          'settingsOption'],
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: light
                                            ? Color.fromARGB(255, 0, 112, 6)
                                            : Color.fromARGB(255, 33, 68, 35),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      (option[i] as Map<String, dynamic>)[
                                                  'settingsOption'] ==
                                              'Mode'
                                          ? mode
                                          : (option[i] as Map<String, dynamic>)[
                                              'defaultValue'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        color:
                                            light ? Colors.black : Colors.white,
                                      ),
                                    ),
                                  ]),
                              Spacer(),
                              (option[i] as Map<String, dynamic>)[
                                          'settingsOption'] ==
                                      'Mode'
                                  ? Icon(
                                      light ? Icons.sunny : Icons.nightlight,
                                      size: 40,
                                      color:
                                          light ? Colors.white : Colors.black,
                                    )
                                  : Spacer(),
                            ])),
                      );
                    }))));
  }
}
