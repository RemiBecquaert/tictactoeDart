class Plateau {
  List<List<int>> plateau = List.filled(3, List.filled(3, 0));

  Plateau(this.plateau);

  set lePlateau(plateau) {
    this.plateau = plateau;
  }

  void nouveau() {
    List<List<int>> plateau = List.filled(3, List.filled(3, 0));
  }

  //méthode de création du tableau
  void creation() {
    for (int i = 0; i < 9; i++) {}
  }

//méthodes de tests renvoyant vrai si les tests sont bons
  testLignes() {}

  testColonnes() {}

  testDiagonales() {}

  testFin() {}
}
