import 'package:learnhub/features/landing/domain/entities/category.dart';

/// Category Data Model with JSON mapping to/from [Category] entity.
class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    this.iconName,
    this.courseCount = 0,
  });

  final String id;
  final String name;
  final String? iconName;
  final int courseCount;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] as String? ?? '',
      iconName: json['iconName'] as String?,
      courseCount: (json['courseCount'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (iconName != null) 'iconName': iconName,
      'courseCount': courseCount,
    };
  }

  Category toEntity() {
    return Category(
      id: id,
      name: name,
      iconName: iconName,
      courseCount: courseCount,
    );
  }

  factory CategoryModel.fromEntity(Category entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      iconName: entity.iconName,
      courseCount: entity.courseCount,
    );
  }
}
