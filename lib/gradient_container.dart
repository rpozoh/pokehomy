import 'package:flutter/material.dart';

import 'package:pokehomy/center_text.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.red,
          ],
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: CenterText('Ejemplo 2', Colors.green, 28),
      ),
    );
  }
}
