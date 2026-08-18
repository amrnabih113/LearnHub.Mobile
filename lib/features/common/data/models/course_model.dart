import '../../domain/entities/course.dart';

/// Unified Course Model with JSON serialization & mapping to/from domain [Course].
class CourseModel {
  const CourseModel({
    required this.id,
    required this.title,
    required this.category,
    required this.instructor,
    this.instructorImageUrl = '',
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.level,
    required this.price,
    this.discountPrice,
    required this.imageUrl,
    this.isSaved = false,
    this.progress = 0,
    this.isCompleted = false,
    this.isFeatured = false,
    this.isTrending = false,
  });

  final String id;
  final String title;
  final String category;
  final String instructor;
  final String instructorImageUrl;
  final double rating;
  final String reviews;
  final String duration;
  final String level;
  final double price;
  final double? discountPrice;
  final String imageUrl;
  final bool isSaved;
  final int progress;
  final bool isCompleted;
  final bool isFeatured;
  final bool isTrending;

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] as String? ?? '',
      category: json['category'] as String? ?? '',
      instructor: json['instructor'] as String? ?? '',
      instructorImageUrl: json['instructorImageUrl'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviews: json['reviews']?.toString() ?? '0',
      duration: json['duration'] as String? ?? '',
      level: json['level'] as String? ?? 'Beginner',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String? ?? '',
      isSaved: json['isSaved'] as bool? ?? false,
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      isCompleted: json['isCompleted'] as bool? ?? false,
      isFeatured: json['isFeatured'] as bool? ?? false,
      isTrending: json['isTrending'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'instructor': instructor,
      'instructorImageUrl': instructorImageUrl,
      'rating': rating,
      'reviews': reviews,
      'duration': duration,
      'level': level,
      'price': price,
      'discountPrice': discountPrice,
      'imageUrl': imageUrl,
      'isSaved': isSaved,
      'progress': progress,
      'isCompleted': isCompleted,
      'isFeatured': isFeatured,
      'isTrending': isTrending,
    };
  }

  Course toEntity() {
    return Course(
      id: id,
      title: title,
      category: category,
      instructor: instructor,
      instructorImageUrl: instructorImageUrl,
      rating: rating,
      reviews: reviews,
      duration: duration,
      level: level,
      price: price,
      discountPrice: discountPrice,
      imageUrl: imageUrl,
      isSaved: isSaved,
      progress: progress,
      isCompleted: isCompleted,
      isFeatured: isFeatured,
      isTrending: isTrending,
    );
  }

  factory CourseModel.fromEntity(Course entity) {
    return CourseModel(
      id: entity.id,
      title: entity.title,
      category: entity.category,
      instructor: entity.instructor,
      instructorImageUrl: entity.instructorImageUrl,
      rating: entity.rating,
      reviews: entity.reviews,
      duration: entity.duration,
      level: entity.level,
      price: entity.price,
      discountPrice: entity.discountPrice,
      imageUrl: entity.imageUrl,
      isSaved: entity.isSaved,
      progress: entity.progress,
      isCompleted: entity.isCompleted,
      isFeatured: entity.isFeatured,
      isTrending: entity.isTrending,
    );
  }
}
