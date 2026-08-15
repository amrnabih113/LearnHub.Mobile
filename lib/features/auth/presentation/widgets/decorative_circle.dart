import 'package:flutter/material.dart';

class DecorativeCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const DecorativeCircle({
    required this.size,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 1),
        ),
      ),
    );
  }
}
