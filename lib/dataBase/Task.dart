// ignore_for_file: file_names, unused_local_variable
import 'dart:core';

DateTime now = DateTime.now();

class Task {
  static int lastId = -1;
  String title;
  String description;
  String createdAt;
  int id = 0;
  String statut;
  bool find = true;

  Task(
      {
    required this.title,
      required this.description,
    required this.createdAt,
    required this.statut,
  }) {
    lastId++;
    id = lastId;
  }

  int getId() {
    return id;
  }

  bool getFind() {
    return find;
  }

  void setFind(bool find) {
    this.find = find;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'statut': statut
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        title: json['title'],
        description: json['description'],
        createdAt: json['createdAt'],
        statut: json['statut']);
  }
}

List<Task> tasks = [];
// [
//   Tache('Vaccances', 'Je doit aller à Dubai avec ma famille l\'hiver prochain',
//       DateFormat('MMM d HH:mm').format(now)),
//   Tache('Football', 'Cet aprem j\'ai un match tres important à jouer',
//       DateFormat('MMM d HH:mm').format(now)),
//   Tache('Cheri', 'Mon coeur m\'amene chez Luidji-restaut aujourd\'hui',
//       DateFormat('MMM d HH:mm').format(now)),
//   Tache(
//       'Papa',
//       'Papa m\'a demander de passer aujourd\'hui apparemment il aurais un soucis',
//       DateFormat('MMM d HH:mm').format(now)),
//   Tache(
//       'Mes enfants',
//       'Se soir je les ais promis d\'aller au cinemat faut pas que je gaf car je les connais',
//       DateFormat('MMM d HH:mm').format(now))
// ];

int indexIconFooter = 0;
bool light = true;
int themes = 0;
String lang = '';
