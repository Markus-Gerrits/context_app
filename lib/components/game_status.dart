import 'package:context_app/services/word_service.dart';
import 'package:flutter/material.dart';

class GameStatus extends StatelessWidget {
  int attempts;
  GameStatus({required this.attempts, super.key});
  final WordService wordService = WordService();
  
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text('JOGO: '),
          Text('#${wordService.getGameId()}', style: TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            child: Row(children: [
              Text('TENTATIVAS: '),
              Text(
                attempts.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold),
                ),
              ],
            )
          ),
        ]
      );
  }
}