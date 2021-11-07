import 'dart:io';

class Plateau {
// On crée notre plateau de jeu avec un tableau de tableau d'abscisses 3 et d'ordonnées 3

// List<List<String>> monJeu = List.filled(3, List.filled(3, "."));
// J'ai essayé de créer mon plateau de jeu avec la ligne ci-dessus, selon le cours, mais le résultat n'est pas le même.
// En effet, j'ai constaté que lorsque le joueur jouait, il remplissait les 3 cases de la colonne choisie.
// Ici List.generate résout le problème en permettant au joueur de ne jouer qu'une fois par tour

  List<List<String>> plateau =
      List.generate(3, (_) => List.generate(3, (index) => "."));

// la méthode booléenne play permet au joueur de remplir une case du plateau de jeu grâce aux attributs colonne qui renseigne la colonne du plateau,
// ligne qui renseigne la ligne du tableau et joueur qui détermine le signe du joueur, soit X, soit O
// On utilise une petite vérification si l'endroit où le joueur veut jouer est déjà pris

  bool play(int colonne, int ligne, String joueur) {
    if (plateau[colonne][ligne] != ".") {
      print("Un joueur occupe déjà cette case !");
      return false;
    }
    plateau[colonne][ligne] = joueur;
    return true;
  }

// creerPlateau nous permet de créer le plateau de jeu grâce à une boucle parcourant tous les éléments dans notre tableau de tableau plateau
// \n nous permet de passer à la ligne. Etant un plateau de 3x3 cases, on passera donc 3x à la ligne
  void creerPlateau() {
    for (var element in plateau) {
      for (var element in element) {
        stdout.write(element);
        stdout.write(" ");
      }
      stdout.write("\n");
    }
  }

// Grâce à ces trois méthodes booléennes, on teste les cas de victoire dans les lignes, les colonnes et les diagonales
// On parcourt les coordonnées du plateau et on vérifie si les symboles des coordonées sont les mêmes et s'ils sont différents du point, valeur par défaut
// Si une condition est vraie, une des méthodes renverra alors vraie, et la partie sera gagnée par le joueur ayant aligné 3 fois son signe

  bool colonnes() {
    for (var i = 0; i < 3; i++) {
      if (plateau[i][0] == plateau[i][1] &&
          plateau[i][1] == plateau[i][2] &&
          plateau[i][2] != ".") {
        return true;
      }
    }
    return false;
  }

  bool lignes() {
    for (var i = 0; i < 3; i++) {
      if (plateau[0][i] == plateau[1][i] &&
          plateau[1][i] == plateau[2][i] &&
          plateau[2][i] != ".") {
        return true;
      }
    }
    return false;
  }

  bool diagonales() {
    if (plateau[0][0] == plateau[1][1] &&
        plateau[1][1] == plateau[2][2] &&
        plateau[2][2] != ".") {
      return true;
    }
    if (plateau[0][2] == plateau[1][1] &&
        plateau[1][1] == plateau[2][0] &&
        plateau[2][0] != ".") {
      return true;
    }
    return false;
  }
}
