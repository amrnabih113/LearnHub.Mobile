import 'package:equatable/equatable.dart';

enum CoursePriceFilter { all, free, paid }

/// Domain criteria for filtering and searching courses.
class ExploreFilters extends Equatable {
  const ExploreFilters({
    this.category,
    this.levels = const {},
    this.minRating = 0.0,
    this.price = CoursePriceFilter.all,
    this.searchQuery = '',
  });

  final String? category;
  final Set<String> levels;
  final double minRating;
  final CoursePriceFilter price;
  final String searchQuery;

  bool get hasFilters {
    return category != null ||
        levels.isNotEmpty ||
        minRating > 0 ||
        price != CoursePriceFilter.all ||
        searchQuery.trim().isNotEmpty;
  }

  ExploreFilters copyWith({
    String? category,
    Set<String>? levels,
    double? minRating,
    CoursePriceFilter? price,
    String? searchQuery,
    bool clearCategory = false,
  }) {
    return ExploreFilters(
      category: clearCategory ? null : (category ?? this.category),
      levels: levels ?? this.levels,
      minRating: minRating ?? this.minRating,
      price: price ?? this.price,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
        category,
        levels,
        minRating,
        price,
        searchQuery,
      ];
}
