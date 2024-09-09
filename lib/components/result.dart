import 'package:context_app/components/word_item_list.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int distance;
  final String word;

  const Result({required this.distance, required this.word});

  @override
  Widget build(BuildContext context) {
    if (distance == -2) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text('Você já tentou $word'),
      );
    }
    if (distance < 0) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text('Não conheço esta palavra'),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: WordItem(distance, word),
    );
  }
}