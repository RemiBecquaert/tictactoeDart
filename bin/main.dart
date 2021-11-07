import 'jeu.dart';

// Le main nous permet de lancer le jeu. On instancie la classe Jeu pour utiliser ses méthodes
// On utilise ensuite la méthode debutDuJeu de la classe Jeu pour débuter notre partie
void main() {
  Jeu tictactoe = Jeu();
  tictactoe.debutDuJeu();
}
