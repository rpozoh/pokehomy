import 'package:flutter/material.dart';

import 'package:pokehomy/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(Alignment.topLeft, Alignment.bottomRight, [Colors.black, Colors.red]),
      ),
    ),
  );
}
