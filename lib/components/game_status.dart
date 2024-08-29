import 'package:flutter/material.dart';

class GameStatus extends StatelessWidget {
  const GameStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        children: [
          Text('JOGO: '),
          Text('#917', style: TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            child: Row(children: [
              Text('TENTATIVAS: '),
              Text(
                '4',
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