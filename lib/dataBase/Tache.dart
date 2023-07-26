// ignore_for_file: file_names, unused_local_variable

class Tache {
  static int lastId = -1;
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

  Map<String, dynamic> toMap() {
    return {
      'titre': titre,
      'description': description,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Tache{titre: $titre, description: $description}';
  }
}

List<Tache> taches = [
  Tache('Vaccances', 'Je doit aller à Dubai avec ma famille l\'hiver prochain'),
  Tache('Football', 'Cet aprem j\'ai un match tres important à jouer'),
  Tache('Cheri', 'Mon coeur m\'amene chez Luidji-restaut aujourd\'hui'),
  Tache('Papa',
      'Papa m\'a demander de passer aujourd\'hui apparemment il aurais un soucis'),
  Tache('Mes enfants',
      'Se soir je les ais promis d\'aller au cinemat faut pas que je gaf car je les connais')
];

int endsTasks = 0;
bool light = false;
