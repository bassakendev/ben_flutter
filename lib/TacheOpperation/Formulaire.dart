// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, file_names, library_private_types_in_public_api, unused_local_variable

import '../assset/Home.dart';
import 'package:flutter/material.dart';
import '../dataBase/Tache.dart';

class Formulaire extends StatefulWidget {
  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final _formkey = GlobalKey<FormState>();
  List<Tache> tachesCopy = taches;
  String titre = '';
  String description = '';
  bool ok1 = false;
  bool ok2 = false;
  bool ok = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (builder) => Home()));
                },
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            Spacer(),
            Text('Nouvelle Tache')
          ]),
          backgroundColor:
              light ? Colors.green : Color.fromARGB(255, 33, 68, 35),
          titleTextStyle: TextStyle(
            letterSpacing: 5,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        body: Form(
          key: _formkey,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                maxLines: null,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Titre...',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 197, 241, 200), fontSize: 30),
                ),
                onChanged: (value) {
                  setState(() {
                    ok1 = value.isEmpty ? false : true;
                    ok = (ok1 || ok2) ? true : false;
                    titre = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  cursorColor: Colors.green,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Description...',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 186, 226, 189),
                        fontSize: 18,
                      )),
                  onChanged: (value) {
                    setState(() {
                      ok2 = value.isEmpty ? false : true;
                      ok = (ok1 || ok2) ? true : false;
                      description = value;
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: SizedBox(
                    height: 40,
                    width: 100,
                    child: Opacity(
                      opacity: ok ? 1.0 : 0.0,
                      child: TextButton(
                        onPressed: () {
                          _formkey.currentState?.save();
                          tachesCopy.add(Tache(titre, description));
                          setState(() {
                            ok = ok1 = ok2 = false;
                            titre = description = '';
                          });
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (builder) => Home()));
                        },
                        child: Text('Enregistrer',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(light
                              ? Colors.green
                              : Color.fromARGB(255, 101, 133, 102)),
                        ),
                      ),
                    )),
              ),
            ),
          ]),
        ));
  }
}
