import 'package:context_app/constants/colors.dart';
import 'package:context_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WordItem extends StatelessWidget {
  final int distance;
  final String word;

  const WordItem({
    required this.distance,
    required this.word,
    super.key
  });

  Color getColor() {
    if (distance.toDouble() < Dimensions.nearDistanceRef) {
      return AppColors.nearColor;
    }
    if (distance.toDouble() > Dimensions.farDistancRef) {
      return AppColors.farColor;
    }
    
    return AppColors.mediumColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.tileBackground,
        borderRadius: Dimensions.defaultRadius,
      ),
      child: Stack(
        children: [
          Container(
            width: getBarWidth(distance, context),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  (distance + 1).toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  double getBarWidth (int distance, BuildContext ctx) {
    // width available
    final width = MediaQuery.of(ctx).size.width - 32.0; // 32

    const total = 111155;
    const lambda = 0.5;
    const startX = 0.0;
    const endX = 100.0;
    final startY = pdf(startX, lambda);
    final endY = pdf(endX, lambda);
    final x = distance / total * (endX - startX);
    final result = (pdf(x, lambda) - endY)/(startY - endY) * 100;
    return (result/100) * width;
  }
  
  double pdf(double x, double lambda) {
    return lambda * exp((-lambda) * x);
  }
}