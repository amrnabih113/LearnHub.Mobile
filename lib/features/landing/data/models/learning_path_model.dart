import 'package:flutter/material.dart';
import 'package:learnhub/features/landing/domain/entities/learning_path.dart';

/// Data model for LearningPath serialization and mapping to entity.
class LearningPathModel {
  const LearningPathModel({
    required this.title,
    required this.description,
    required this.courses,
    required this.duration,
    required this.colorType,
    required this.iconCodePoint,
    this.iconFontFamily,
  });

  final String title;
  final String description;
  final String courses;
  final String duration;
  final PathColor colorType;
  final int iconCodePoint;
  final String? iconFontFamily;

  factory LearningPathModel.fromJson(Map<String, dynamic> json) {
    PathColor parseColor(String? value) {
      switch (value?.toLowerCase()) {
        case 'blue':
          return PathColor.blue;
        case 'yellow':
          return PathColor.yellow;
        case 'purple':
          return PathColor.purple;
        default:
          return PathColor.blue;
      }
    }

    return LearningPathModel(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      courses: json['courses'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      colorType: parseColor(json['colorType'] as String?),
      iconCodePoint: (json['iconCodePoint'] as num?)?.toInt() ??
          Icons.school_rounded.codePoint,
      iconFontFamily: json['iconFontFamily'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'courses': courses,
      'duration': duration,
      'colorType': colorType.name,
      'iconCodePoint': iconCodePoint,
      'iconFontFamily': iconFontFamily,
    };
  }

  LearningPath toEntity() {
    return LearningPath(
      title: title,
      description: description,
      courses: courses,
      duration: duration,
      colorType: colorType,
      icon: IconData(
        iconCodePoint,
        fontFamily: iconFontFamily ?? 'MaterialIcons',
      ),
    );
  }

  factory LearningPathModel.fromEntity(LearningPath entity) {
    return LearningPathModel(
      title: entity.title,
      description: entity.description,
      courses: entity.courses,
      duration: entity.duration,
      colorType: entity.colorType,
      iconCodePoint: entity.icon.codePoint,
      iconFontFamily: entity.icon.fontFamily,
    );
  }
}
