import 'package:flutter/material.dart';

import 'package:pokehomy/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(Alignment.topCenter, Alignment.bottomCenter, [Color.fromARGB(255, 43, 1, 116), Color.fromARGB(255, 247, 148, 1)]),
      ),
      title: 'Randomizer by Rphisto v6.4.0',
    ),
  );
}
