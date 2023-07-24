// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, file_names, library_private_types_in_public_api, unused_element, prefer_const_constructors_in_immutables

import 'ShowTache.dart';
import 'package:flutter/material.dart';
import 'Tache.dart';

class ListDeTache extends StatefulWidget {
  final List<Tache> taches;
  ListDeTache({required this.taches});
  @override
  _ListDeTacheState createState() => _ListDeTacheState();
}

class _ListDeTacheState extends State<ListDeTache> {
  List<Tache> tachesCopy = [];

  @override
  void initState() {
    super.initState();
    tachesCopy = widget.taches;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
          itemCount:
              tachesCopy.where((tache) => tache.getFind() == true).length,
          itemBuilder: (context, i) {
            Tache tache = tachesCopy
                .where((tache) => tache.getFind() == true)
                .toList()[i];
            return ListBody(
              children: [
                Opacity(
                    opacity: 1.0,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 230, 214),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                tache.titre,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 112, 6),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              SizedBox(height: 5),
                              Text(
                                tache.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        tache.setStatut();
                                      });
                                    },
                                    child: tache.getStatut()
                                        ? Icon(Icons.check, color: Colors.green)
                                        : Text('En attente...',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 6, 59, 102))),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        tachesCopy.removeWhere((element) =>
                                            element.id == tache.getId());
                                      });
                                      taches.removeWhere((element) =>
                                          element.id == tache.getId());
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 116, 64, 64),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) => ShowTache(
                                                      titre: tache.titre,
                                                      description:
                                                          tache.description,
                                                    )));
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye_rounded,
                                        color: Color.fromARGB(255, 6, 129, 129),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
