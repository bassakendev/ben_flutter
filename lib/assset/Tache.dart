// ignore_for_file: file_names, unused_local_variable
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Tache {
  static int lastId = 0;
  String titre;
  String description;
  int id = 0;
  bool statut = false;
  bool find = true;

  Tache(this.titre, this.description) {
    lastId++;
    id = lastId;
  }

  int getId() {
    return id;
  }

  bool getStatut() {
    return statut;
  }

  void setStatut() {
    statut = !statut;
  }

  bool getFind() {
    return find;
  }

  void setFind(bool find) {
    this.find = find;
  }
}

// List<Tache> taches = [
//   Tache('Vaccances', 'Je doit aller à Dubai avec ma famille l\'hiver prochain'),
//   Tache('Football', 'Cet aprem j\'ai un match tres important à jouer'),
//   Tache('Cheri', 'Mon coeur m\'amene chez Luidji-restaut aujourd\'hui'),
//   Tache('Papa',
//       'Papa m\'a demander de passer aujourd\'hui apparemment il aurais un soucis'),
//   Tache('Mes enfants',
//       'Se soir je les ais promis d\'aller au cinemat faut pas que je gaf car je les connais')
// ];

int endsTasks = 0;

setTache(taches) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('taches', jsonEncode(taches));
}

getTache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? json = prefs.getString('taches');
  List<Tache> taches = jsonDecode(json!);
  return taches;
}

List<Tache> taches = getTache();
