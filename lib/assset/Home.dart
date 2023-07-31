// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/services.dart';

import 'Settings.dart';
import '../controller/tacheController/TacheController.dart';
import 'Recherche.dart';
import '../dataBase/Tache.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void changeIndexIconFooter(index) {
    setState(() {
      indexIconFooter = index;
    });
  }

  void changeMode() {
    setState(() {
      light = !light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: light ? ThemeMode.light : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: 'Bassakendev',
        home: WillPopScope(
            onWillPop: () async {
              // Action à effectuer lorsque l'utilisateur appuie sur la touche physique de retour
              SystemNavigator.pop();
              // Retourne false pour empêcher la fermeture de l'application
              return false;
            },
            child: Center(
                child: Scaffold(
              appBar: AppBar(
                title: Row(children: [
                  Text('Taches'),
                  Spacer(),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(light
                            ? Colors.white
                            : Color.fromARGB(255, 209, 209, 209)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TacheController(
                                    opperation: 'create',
                                    titre: '',
                                    description: '',
                                    id: 0)));
                      },
                      child: Row(children: [
                        Text('Créer',
                            style: TextStyle(
                                color: light
                                    ? Colors.green
                                    : const Color.fromARGB(255, 40, 77, 41))),
                        Icon(Icons.add_box,
                            color: light
                                ? Color.fromARGB(255, 89, 172, 90)
                                : Color.fromARGB(255, 33, 68, 35))
                      ]))
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
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: indexIconFooter == 2 ? Settings() : Recherche(),
              ),
              bottomNavigationBar: Container(
                height: 70.0, // Hauteur du footer
                color: light
                    ? Colors.green
                    : Color.fromARGB(
                        255, 101, 133, 102), // Couleur de fond du footer
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(
                      color: indexIconFooter == 0 ? Colors.white : Colors.black,
                      iconSize: 25,
                      onPressed: () => {
                            changeIndexIconFooter(0),
                          },
                      icon: Icon(Icons.work_history)),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                      color: indexIconFooter == 1 ? Colors.white : Colors.black,
                      iconSize: 35,
                      onPressed: () => {
                            changeIndexIconFooter(1),
                          },
                      icon: Icon(Icons.task_alt_rounded)),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                      iconSize: 35,
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Settings()))
                          },
                      icon: Icon(Icons.settings))
                ]),
              ),
            ))));
  }
}
