// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, file_names, lendsTasksrary_private_types_in_public_api, unused_element, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../controller/TacheController.dart';
import '../dataBase/Tache.dart';

class ListDeTache extends StatefulWidget {
  final List<Tache> taches;
  ListDeTache({required this.taches});
  @override
  _ListDeTacheState createState() => _ListDeTacheState();
}

class _ListDeTacheState extends State<ListDeTache> {
  List<Tache> tachesCopy = [];
  int checked = 0;

  @override
  void initState() {
    super.initState();
    tachesCopy = widget.taches;
  }

  @override
  Widget build(BuildContext context) {
    tachesCopy.sort((a, b) => b.getId().compareTo(a.getId()));
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
          itemCount: endsTasks == 0
              ? tachesCopy
                  .where((tache) =>
                      tache.getFind() == true && tache.getStatut() == false)
                  .length
              : tachesCopy
                  .where((tache) =>
                      tache.getStatut() == true && tache.getFind() == true)
                  .length,
          itemBuilder: (context, i) {
            Tache tache = endsTasks == 0
                ? tachesCopy
                    .where((tache) =>
                        tache.getFind() == true && tache.getStatut() == false)
                    .toList()[i]
                : tachesCopy
                    .where((tache) =>
                        tache.getStatut() == true && tache.getFind() == true)
                    .toList()[i];
            return ListBody(
              children: [
                Opacity(
                    opacity: 1.0,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 115,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: light
                            ? Color.fromARGB(255, 214, 230, 214)
                            : Color.fromARGB(255, 103, 109, 103),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // tache.titre,
                                tache.titre,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 112, 6),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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
                                                builder: (builder) =>
                                                    TacheController(
                                                        opperation: 'show',
                                                        titre: tache.titre,
                                                        description:
                                                            tache.description,
                                                        id: 0)));
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye_rounded,
                                        color: Color.fromARGB(255, 6, 129, 129),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    TacheController(
                                                        opperation: 'update',
                                                        titre: tache.titre,
                                                        description:
                                                            tache.description,
                                                        id: tache.getId())));
                                      },
                                      child: Icon(Icons.edit,
                                          color: light
                                              ? Colors.black
                                              : Colors.white
                                      ))
                                ],
                              ),
                              Row(children: [
                                Spacer(),
                                Text(tache.createdAt),
                              ])
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
