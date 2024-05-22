import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hokkaido/models/deck.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final decks = Deck.fakeData();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF007FFF),
          title: Text("My Decks"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddButtonModal(context),
          child: Icon(Icons.add_rounded),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (decks.isNotEmpty) {
      return _buildCardList();
    }

    return const Center(
      child: Text("You don't have any deck"),
    );
  }

  Widget _buildCardList() {
    final divider = Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 1,
      color: Colors.grey,
    );

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: decks.length,
      separatorBuilder: (_, __) => divider,
      itemBuilder: (_, index) => _buildDeckBox(decks[index]),
    );
  }

  Future<void> _showCreateDeckPopup(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text('New deck name'),
          content: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(onPressed: Get.back, child: Text('Cancel')),
            TextButton(onPressed: Get.back, child: Text('Ok')),
          ],
        );
      },
    );
  }

  Widget _buildDeckBox(Deck d) {
    final content = SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // Deck title
            Flexible(
              child: Text(
                d.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Edit Icon
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Icon(Icons.edit_outlined),
              ),
            ),
          ]),
          // Total of Cards
          Text(d.totalCards() > 1
              ? '${d.totalCards()} cards'
              : '${d.totalCards()} card'),
          const Gap(8),
          // Progress Indicator
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              color: Colors.blue,
              backgroundColor: Colors.grey,
              value: d.totalReviewedCards() / d.totalCards(),
            ),
          ),
          const Gap(4),
          // Statistics
          Text('${d.totalReviewedCards()}/${d.totalCards()} cards reviewed')
        ],
      ),
    );

    return InkWell(
      onTap: () {},
      child: content,
    );
  }

  void _showAddButtonModal(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    const modalRadius = Radius.circular(16);

    final modalOptions = [
      _buildModalRow(
        context,
        title: 'Add Deck',
        description: 'Create a new deck for your flashcards',
        onClick: () async => _showCreateDeckPopup(context),
      ),
      const SizedBox(height: 16),
      _buildModalRow(
        context,
        title: 'Add Card',
        description: 'Create a new flashcard',
        onClick: () {},
      )
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 0.28 * screenHeight,
          decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                topLeft: modalRadius,
                topRight: modalRadius,
              )),
          child: Column(children: modalOptions),
        );
      },
    );
  }

  Widget _buildModalRow(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onClick,
  }) =>
      InkWell(
        onTap: () {
          Get.back();
          onClick();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 12,
              height: 12,
              decoration: ShapeDecoration(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
            const SizedBox(width: 12),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(height: 8),
                  Text(description),
                ]),
          ],
        ),
      );
}
