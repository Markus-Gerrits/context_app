import 'package:context_app/constants/colors.dart';
import 'package:context_app/constants/dimensions.dart';
import 'package:flutter/material.dart';

class WordItem extends StatelessWidget {
  final double size;
  final String word;
  final double points;

  const WordItem(this.size, this.word, this.points, {super.key});

  Color getColor() {
    if (points > Dimensions.farDistancRef) {
      return AppColors.farColor;
    } else if (points < Dimensions.nearDistanceRef) {
      return AppColors.nearColor;
    }

    return AppColors.mediumColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.tileBackground,
        borderRadius: Dimensions.defaultRadius,
      ),
      child: Stack(
        children: [
          Container(
            width: size,
            decoration: BoxDecoration(
              color: getColor(),
              borderRadius: Dimensions.defaultRadius,
            ),
          ),
          Padding(
            padding: Dimensions.defaultPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  word,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  points.toString(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}