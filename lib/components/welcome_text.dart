import 'package:context_app/components/faq_text.dart';
import 'package:context_app/constants/colors.dart';
import 'package:context_app/constants/dimensions.dart';
import 'package:context_app/constants/strings.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Como Jogar
        Container(
          padding: Dimensions.defaultPadding,
          decoration: BoxDecoration(
            color: AppColors.tipBackground,
            borderRadius: Dimensions.defaultRadius,
          ),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.help_outline_rounded),
                    ),
                    Text(
                      'Como jogar?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                Strings.comoJogar,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const FaqText(),
      ],
    );
  }
}
