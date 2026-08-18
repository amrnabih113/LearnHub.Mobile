import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum PathColor { blue, yellow, purple }

/// Domain entity representing a curated sequence/learning path.
class LearningPath extends Equatable {
  const LearningPath({
    required this.title,
    required this.description,
    required this.courses,
    required this.duration,
    required this.colorType,
    required this.icon,
  });

  final String title;
  final String description;
  final String courses;
  final String duration;
  final PathColor colorType;
  final IconData icon;

  @override
  List<Object?> get props => [
        title,
        description,
        courses,
        duration,
        colorType,
        icon,
      ];
}
