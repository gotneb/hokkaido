import 'card.dart';

class Deck {
  final String title;
  final List<Card> _cards;

  /// Creates a new deck.
  const Deck({
    required this.title,
    required List<Card> cards,
  }) : _cards = cards;

  /// Creates an empty deck with a given title.
  Deck.empty({required String title}) : this(title: title, cards: []);

  void addCard(Card c) {
    _cards.add(c);
  }

  int totalCards() => _cards.length;
  int totalReviewedCards() => _cards.where((c) => c.reviewed).length;

  static List<Deck> fakeData() => [
        Deck(
          title: 'Na Adjectives',
          cards: [Card(front: 'a', back: 'b')],
        ),
        Deck(
          title: 'Commonly used words',
          cards: [
            Card(front: 'a', back: 'b', reviewed: true),
            Card(front: 'a', back: 'b'),
            Card(front: 'a', back: 'b'),
            Card(front: 'a', back: 'b')
          ],
        ),
        Deck(
          title: 'Godan verbs',
          cards: [
            Card(front: 'a', back: 'b', reviewed: true),
            Card(front: 'a', back: 'b')
          ],
        ),
      ];
}
