// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, unused_local_variable, library_private_types_in_public_api, must_be_immutable

import 'ListDeTache.dart';
import 'package:flutter/material.dart';
import 'Tache.dart';

class Recherche extends StatefulWidget {
  @override
  _RechercheState createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  List<Tache> tachesCopy = taches;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20.0),
            Expanded(
                child: SizedBox(
              child: TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    prefixIconColor: Colors.green,
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    labelText: 'Rechercher...',
                    labelStyle: TextStyle(
                      color: Colors.green,
                    )),
                onChanged: (value) {
                  for (int i = 0; i < tachesCopy.length; i++) {
                    if (tachesCopy[i]
                            .titre
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        tachesCopy[i]
                            .description
                            .toLowerCase()
                            .contains(value.toLowerCase())) {
                      setState(() {
                        tachesCopy[i].setFind(true);
                      });
                    } else {
                      setState(() {
                        tachesCopy[i].setFind(false);
                      });
                    }
                  }
                  if (value == '') {
                    for (int i = 0; i < tachesCopy.length; i++) {
                      tachesCopy[i].setFind(true);
                    }
                  }
                },
              ),
            )),
          ],
        ),
      ),
      ListDeTache(taches: tachesCopy)
    ]);
  }
}
