import 'package:context_app/components/word_item_list.dart';
import 'package:flutter/material.dart';

class WordList extends StatelessWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
        children: const [
            WordItem(370, 'Miller', 10),
            WordItem(10, 'Carro', 3000),
            WordItem(350, 'Mateus', 15),
            WordItem(203, 'Fumaça', 304),
        ],
      );
  }
}