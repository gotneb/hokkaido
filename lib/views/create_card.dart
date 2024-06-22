import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CreateCardView extends StatelessWidget {
  CreateCardView({super.key});

  final _textOptionsIcons = [
    Icons.format_bold_rounded,
    Icons.format_italic_rounded,
    Icons.format_size_rounded,
    Icons.format_align_right_rounded,
  ];

  final appBar = AppBar(
    title: Text('Create Card'),
    centerTitle: true,
    leading: Icon(Icons.keyboard_backspace_outlined),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Icon(Icons.visibility_outlined),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    // TODO: AppBar
    return Scaffold(
      appBar: appBar,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: Select Deck Widget
          Text('Deck: Commonly Used Words'),
          const Gap(16),
          // TODO: Card Text Input
          Container(
            height: 0.5 * Get.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey)),
          ),
          // TODO: Formatting Text Buttons
          const Gap(16),
          Text('Option'),
          const Gap(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              _textOptionsIcons.length,
              (index) => _textOption(index),
            ),
          ),
          const Gap(16),
          // TODO: Add Card Button
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: _onAddCard,
                child: Text('Add Card'),
              ))
            ],
          ),
        ],
      ),
    );
  }

  Widget _textOption(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Icon(
        _textOptionsIcons[index],
        size: 38,
      ),
    );
  }

  void _onAddCard() {
    Get.back();
  }
}
