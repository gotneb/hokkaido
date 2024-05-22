import 'package:get/get.dart';
import 'package:hokkaido/models/deck.dart';

class DeckController extends GetxController {
  final decks = <Deck>[].obs;

  void addNewDeck({required String title}) {
    decks.insert(0, Deck.empty(title: title));
  }
}