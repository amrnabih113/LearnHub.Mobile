import 'package:equatable/equatable.dart';

/// Domain entity representing a learning category.
class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    this.iconName,
    this.courseCount = 0,
  });

  final String id;
  final String name;
  final String? iconName;
  final int courseCount;

  @override
  List<Object?> get props => [id, name, iconName, courseCount];
}
