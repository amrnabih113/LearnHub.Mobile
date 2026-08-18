import 'package:learnhub/features/landing/presentation/widgets/explore_mokeup_data.dart';

class ExploreFilters {
  const ExploreFilters({
    this.category,
    this.levels = const {},
    this.minRating = 0,
    this.price = CoursePriceFilter.all,
  });

  final String? category;
  final Set<String> levels;
  final double minRating;
  final CoursePriceFilter price;

  bool get hasFilters {
    return category != null ||
        levels.isNotEmpty ||
        minRating > 0 ||
        price != CoursePriceFilter.all;
  }

  ExploreFilters copyWith({
    String? category,
    Set<String>? levels,
    double? minRating,
    CoursePriceFilter? price,
  }) {
    return ExploreFilters(
      category: category,
      levels: levels ?? this.levels,
      minRating: minRating ?? this.minRating,
      price: price ?? this.price,
    );
  }
}
