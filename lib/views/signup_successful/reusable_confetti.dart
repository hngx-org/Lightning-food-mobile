import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class MyConfetti extends StatelessWidget {
  MyConfetti({super.key, required this.controller});

  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: controller,
      shouldLoop: true,
      blastDirectionality: BlastDirectionality.explosive,
      numberOfParticles: 25,
      minBlastForce: 5,
      maxBlastForce: 50,
      gravity: 0.5,
      colors: [
        Colors.green,
        Colors.pinkAccent,
        AppColor.secondaryColor,
        Colors.pink,
        Colors.blue,
        Colors.lightBlueAccent
      ],
    );
  }
}
