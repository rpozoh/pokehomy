import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  const CenterText(this.inputText, this.inputColor, this.inputFontSize, {super.key});

  final String inputText;
  final Color inputColor;
  final double inputFontSize;

  @override
  Widget build(context) {
    return Text(
        inputText,
        style: TextStyle(
          color: inputColor,
          fontSize: inputFontSize,
        )
      );
  }
}
