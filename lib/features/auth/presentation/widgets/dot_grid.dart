import 'package:flutter/material.dart';

class DotGrid extends StatelessWidget {
  final int rows;
  final int columns;
  final double spacing;
  final Color color;
  final double opacity;

  const DotGrid({
    required this.rows,
    required this.columns,
    required this.spacing,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          rows,
          (_) => Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              columns,
              (_) => Padding(
                padding: EdgeInsets.all(spacing / 2),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
