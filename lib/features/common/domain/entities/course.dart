import 'package:equatable/equatable.dart';

/// Unified Course entity used across all features and UI widgets (such as CourseCard).
class Course extends Equatable {
  const Course({
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

  bool get isFree => price == 0;
  bool get hasDiscount => discountPrice != null && discountPrice! < price;

  Course copyWith({
    String? id,
    String? title,
    String? category,
    String? instructor,
    String? instructorImageUrl,
    double? rating,
    String? reviews,
    String? duration,
    String? level,
    double? price,
    double? discountPrice,
    String? imageUrl,
    bool? isSaved,
    int? progress,
    bool? isCompleted,
    bool? isFeatured,
    bool? isTrending,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      instructor: instructor ?? this.instructor,
      instructorImageUrl: instructorImageUrl ?? this.instructorImageUrl,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      isSaved: isSaved ?? this.isSaved,
      progress: progress ?? this.progress,
      isCompleted: isCompleted ?? this.isCompleted,
      isFeatured: isFeatured ?? this.isFeatured,
      isTrending: isTrending ?? this.isTrending,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        category,
        instructor,
        instructorImageUrl,
        rating,
        reviews,
        duration,
        level,
        price,
        discountPrice,
        imageUrl,
        isSaved,
        progress,
        isCompleted,
        isFeatured,
        isTrending,
      ];
}
