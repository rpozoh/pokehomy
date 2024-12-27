import 'package:flutter/material.dart';

import 'package:pokehomy/UI/randomizer.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.beginAlignment, this.endAlignment, this.colors, {super.key});

  final Alignment beginAlignment;
  final Alignment endAlignment;
  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: Randomizer(),
      ),
    );
  }
}
