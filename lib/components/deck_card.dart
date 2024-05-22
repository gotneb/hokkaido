import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hokkaido/models/deck.dart';

class DeckCard extends StatelessWidget {
  const DeckCard({
    super.key,
    required this.deck,
  });

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // Deck title
            Flexible(
              child: Text(
                deck.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Well...... a gap ;-)
            const Gap(12),
            // Edit Icon
            InkWell(onTap: () {}, child: const Icon(Icons.edit_outlined)),
          ]),
          // Total of Cards
          Text('${deck.totalCards()} cards'),
          const Gap(8),
          // Progress Indicator
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              color: Colors.blue,
              backgroundColor: Colors.grey,
              value: deck.totalCards() > 1
                  ? deck.totalReviewedCards() / deck.totalCards()
                  : 0,
            ),
          ),
          const Gap(4),
          // Statistics
          Text('${deck.totalReviewedCards()}/${deck.totalCards()} cards reviewed')
        ],
      ),
    );

    return InkWell(
      onTap: () {},
      child: content,
    );
  }
}
