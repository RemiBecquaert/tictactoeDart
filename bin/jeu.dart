import 'dart:io';
import 'plateau.dart';

class Jeu extends Plateau {
// La méthode debutDuJeu sera celle qui lancera le jeu en tant que tel. On créé une variable tour qui nous permettra de savoir quel joueur joue
// On commence par faire une boucle faire Tant que pour pouvoir jouer tant que les cas de victoire (lignes, colonnes et diagonales) ne renvoient pas vrai
// A chaque tour, on créé notre plateau de jeu grâce à la méthode creerPlateau. Ayant hérité de la classe Plateau, on n'a pas besoin de l'instancier avec Plateau plateau = Plateau ()
// Le reste de la division de l'entier tour nous permet de savoir quel joueur jouera
// On récuperera donc nos coordonées du plateau pour placer le signe du joueur, et donc jouer

  int tour = 0;

  void debutDuJeu() {
    do {
      creerPlateau();
      bool tourJoueur = false;
      String joueur;
      do {
        if (tour % 2 == 0) {
          joueur = "X";
        } else {
          joueur = "Y";
        }
        print("Colonne ?");
        int colonne = saisirEntier();
        print("Ligne ?");
        int ligne = saisirEntier();
        tourJoueur = play(colonne, ligne, joueur);
      } while (!tourJoueur);
      tour++;
    } while (!lignes() && !colonnes() && !diagonales());
    creerPlateau();
    if (tour % 2 == 1) {
      print("Le joueur X a gagné !");
    } else {
      print("Le joueur Y a gagné !");
    }
  }

// La méthode saisieUtilisateur nous permet de saisir et de récupérer une variable que l'on appelera input.
// En java, on utilise un scanner, ici on utiliser stdin.readLineSync
  String saisieUtilisateur() {
    String? input = stdin.readLineSync();
    if (input == null) {
      print("Erreur");
      input = saisieUtilisateur();
    }
    return input;
  }

// La méthode saisirEntier nous permet de récupérer la variable input que l'on essayera de transtyper grâce à int.parse
// Enfin, on pose une petite condition qui nous permet de conditionner la saisie entre 0 et 2 inclus, ce qui correspondera aux variables lignes et colonnes de notre plateau de jeu.

  int saisirEntier() {
    String input = saisieUtilisateur();
    int saisie = 0;
    try {
      saisie = int.parse(input);
    } on FormatException {
      print("Veuillez écrire un nombre:");
      saisie = saisirEntier();
    }
    if (saisie < 0 || saisie > 2) {
      print("Choisir un nombre entre 0 et 2:");
      saisie = saisirEntier();
    }
    return saisie;
  }
}
