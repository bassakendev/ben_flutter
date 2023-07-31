// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../dataBase/Tache.dart';
import '../../main.dart';

class Themes extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  String selectedColor = 'Vert';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisir une couleur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choisissez une couleur :',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                colorButton('Vert', Colors.green),
                colorButton('Jaune', Colors.yellow),
                colorButton('Rouge', Colors.red),
                colorButton('Orange', Colors.orange),
                colorButton('Rose', Colors.pink),
                colorButton('Violet', Colors.purple),
                colorButton('Gris', Colors.grey),
                colorButton('Bleu', Colors.blue),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Couleur sélectionnée :',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: getColor(selectedColor),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  selectedColor,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget colorButton(String colorName, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = colorName;
          themes = colorName;
        });

        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => MyApp())));
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: color,
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
            colorName,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Color getColor(String colorName) {
    switch (colorName) {
      case 'Vert':
        return Colors.green;
      case 'Jaune':
        return Colors.yellow;
      case 'Rouge':
        return Colors.red;
      case 'Orange':
        return Colors.orange;
      case 'Rose':
        return Colors.pink;
      case 'Violet':
        return Colors.purple;
      case 'Gris':
        return Colors.grey;
      case 'Bleu':
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }
}
