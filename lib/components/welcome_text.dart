import 'package:context_app/constants/colors.dart';
import 'package:context_app/constants/dimensions.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: Dimensions.defaultPadding,
        decoration: BoxDecoration(
          color: AppColors.tipBackground,
          borderRadius: Dimensions.defaultRadius,
        ),
        child: const Text(
          'Descubra a palavra secreta do dia através do significado.\n\nDepois de enviar uma palavra, você verá o quão próxima ela está da resposta.\n\nPalavras são mais próximas quando são frequentemente utilizadas no mesmo contexto.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
  }
}