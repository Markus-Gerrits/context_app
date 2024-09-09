import 'package:context_app/components/game_status.dart';
import 'package:context_app/components/result.dart';
import 'package:context_app/components/welcome_text.dart';
import 'package:context_app/components/word_item_list.dart';
import 'package:context_app/components/word_list.dart';
import 'package:context_app/constants/dimensions.dart';
import 'package:context_app/services/word_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController inputController = TextEditingController();

  final WordService wordService = WordService();

  int attempts = 0;
  String currentWord = '';
  int currentDistance = 0 ;
  bool isRepeatedWord = false;

  List<WordItem> wordList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.defaultPadding,
      child: ListView(
        children: [
          GameStatus(
            attempts: attempts,
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: inputController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: 'Digite uma palavra',
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            onSubmitted: computeWordEntry,
          ),
          // Resultado
          // Texto
          // WordItem
          Offstage(offstage: attempts == 0, child: Result(distance: currentDistance, word: currentWord)),
          const SizedBox(height: 10,),
          Offstage(offstage: attempts != 0, child: const WelcomeText(), ),
          const SizedBox(height: 10,),
          Offstage(offstage: attempts == 0, child: WordList(items: wordList,)),
        ]
      ),
    );
  }

  void computeWordEntry(String wordTyped) async {
    isRepeatedWord = false;
    if (wordAlreadyExists(wordTyped)) {
      currentDistance = -2;
      currentWord = wordTyped;
      setState(() {});
      inputController.clear();
    } else {
      final distance = await wordService.getDistance(wordTyped);
      setState(() {
        currentWord = wordTyped;
        currentDistance = distance.distance;
        if (wordService.isValid(currentDistance)) {
          wordList.add(WordItem(distance.distance, wordTyped));
          wordList.sort((word1, word2) => word1.distance.compareTo(word2.distance));
        }
        attempts++;
        inputController.clear();
      });
      developer.log('Usuário digitou: $wordTyped e foi a tentativa: $attempts, tem ${wordList.length} itens na lista');
    }
  }

  bool wordAlreadyExists(String word) {
    bool alreadyExists = false;
    for (final item in wordList) {
      if (item.word.contains(word)) {
        alreadyExists = true;
      }
    }
    return alreadyExists;
  }

}
