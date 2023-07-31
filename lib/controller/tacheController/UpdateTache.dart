// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, file_names, library_private_types_in_public_api, unused_local_variable

import '../../../assset/Home.dart';
import 'package:flutter/material.dart';
import '../../../dataBase/Tache.dart';

class UpdateTache extends StatefulWidget {
  int id;
  UpdateTache({required this.id});
  @override
  _UpdateTacheState createState() => _UpdateTacheState();
}

class _UpdateTacheState extends State<UpdateTache> {
  final _formkey = GlobalKey<FormState>();
  List<Tache> tachesCopy = taches;
  bool ok1 = false;
  bool ok2 = false;
  bool ok = false;
  int id = 1;
  late TextEditingController titreController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    titreController = TextEditingController(text: tachesCopy[id].titre);
    descriptionController =
        TextEditingController(text: tachesCopy[id].description);
  }

  @override
  void dispose() {
    titreController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Modifier'),
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
                style: TextStyle(fontSize: 22.0),
                controller: titreController,
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
                  });
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  style: TextStyle(fontSize: 22.0),
                  controller: descriptionController,
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
                          tachesCopy[id].titre = titreController.text;
                          tachesCopy[id].description =
                              descriptionController.text;
                          setState(() {
                            ok = ok1 = ok2 = false;
                            titreController.text = '';
                            descriptionController.text = '';
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
