import 'package:flutter/material.dart';

class PokeballLoading extends StatefulWidget {
  final double size;

  const PokeballLoading({Key? key, this.size = 80.0}) : super(key: key);

  @override
  _PokeballLoadingState createState() => _PokeballLoadingState();
}

class _PokeballLoadingState extends State<PokeballLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        'assets/images/pokeball.png',
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}