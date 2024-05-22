class Card {
  final String front;
  final String back;
  bool reviewed = false; 

  Card({
    required this.front,
    required this.back,
    this.reviewed = false,
  });
}
