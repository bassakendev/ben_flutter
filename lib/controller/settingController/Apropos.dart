// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '/dataBase/Tache.dart';

class Apropos extends StatefulWidget {
  @override
  _AproposState createState() => _AproposState();
}

class _AproposState extends State<Apropos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text('À propos'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'À propos de l\'application',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bienvenue dans notre application ToDoList !',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Cette application est une application moderne, qui vous permet de gérer facilement vos tâches quotidiennes. Vous pouvez ajouter, supprimer, modifier, voir et marquer vos tâches comme terminées.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Fonctionnalités principales :',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '- Ajouter des tâches avec une description et une date de création',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
                SizedBox(height: 16),
            Text(
              '- Marquer les tâches comme terminées/En cours',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
                SizedBox(height: 16),
            Text(
              '- Supprimer les tâches',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '- Passer en mode Nuit ou Jour',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '- Choisir un Thème parmi plusieurs couleurs populaires, selon votre préference',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '- Choisir la langue de préférence, parmi plusieurs couramment utilisées',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'À propos du développeur',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Nom : bassakendev',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Mail : bassakendev@gmail.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Pays : Cameroun',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
                Text(
                  'Description : Developpeur Full-stack web et mobile',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30),
                Text(
              'Nous espérons que notre application vous aidera à rester organisé et productif !',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
        ),
      ),
    );
  }
}
