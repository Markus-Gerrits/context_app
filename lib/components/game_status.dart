import 'package:context_app/services/word_service.dart';
import 'package:flutter/material.dart';

class GameStatus extends StatelessWidget {
  int attempts;
  int tips;
  GameStatus({required this.attempts, required this.tips, super.key});
  final WordService wordService = WordService();
  
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Text('JOGO: '),
          Text('#${wordService.getGameId()}', style: const TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: Row(children: [
              const Text('TENTATIVAS: '),
              Text(
                attempts.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold),
                ),
              ],
            )
          ),
          Offstage(
            offstage: tips == 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,),
              child: Row(
                children: [
                  const Text('Dicas: '),
                  Text(
                    tips.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            )
          )
        ]
      );
  }
}