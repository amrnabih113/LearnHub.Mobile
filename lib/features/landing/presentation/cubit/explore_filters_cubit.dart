import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learnhub/features/landing/presentation/widgets/explore_filters.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_mokeup_data.dart';
import 'package:equatable/equatable.dart';

part 'explore_filters_state.dart';

class ExploreFilterCubit extends Cubit<ExploreFilterState> {
  ExploreFilterCubit({required List<ExploreCourse> courses})
    : _courses = courses,
      super(ExploreFilterState(filteredCourses: courses));

  final List<ExploreCourse> _courses;

  // ==========================================================================
  // FILTER
  // ==========================================================================

  void updateFilters(ExploreFilters filters) {
    final filteredCourses = _filterCourses(filters);

    emit(state.copyWith(filters: filters, filteredCourses: filteredCourses));
  }

  // ==========================================================================
  // CATEGORY
  // ==========================================================================

  void selectCategory(String? category) {
    updateFilters(state.filters.copyWith(category: category));
  }

  // ==========================================================================
  // CLEAR
  // ==========================================================================

  void clearFilters() {
    updateFilters(const ExploreFilters());
  }

  // ==========================================================================
  // FILTERING LOGIC
  // ==========================================================================

  List<ExploreCourse> _filterCourses(ExploreFilters filters) {
    return _courses.where((course) {
      // ----------------------------------------------------------------------
      // CATEGORY
      // ----------------------------------------------------------------------

      if (filters.category != null && course.category != filters.category) {
        return false;
      }

      // ----------------------------------------------------------------------
      // LEVEL
      // ----------------------------------------------------------------------

      if (filters.levels.isNotEmpty && !filters.levels.contains(course.level)) {
        return false;
      }

      // ----------------------------------------------------------------------
      // RATING
      // ----------------------------------------------------------------------

      if (course.rating < filters.minRating) {
        return false;
      }

      // ----------------------------------------------------------------------
      // PRICE
      // ----------------------------------------------------------------------

      switch (filters.price) {
        case CoursePriceFilter.all:
          break;

        case CoursePriceFilter.free:
          if (course.price != 0) {
            return false;
          }
          break;

        case CoursePriceFilter.paid:
          if (course.price == 0) {
            return false;
          }
          break;
      }

      return true;
    }).toList();
  }
}
