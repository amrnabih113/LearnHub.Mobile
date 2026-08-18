part of 'explore_filters_cubit.dart';

class ExploreFilterState extends Equatable {
  const ExploreFilterState({
    this.filters = const ExploreFilters(),
    this.filteredCourses = const [],
  });

  final ExploreFilters filters;
  final List<ExploreCourse> filteredCourses;

  ExploreFilterState copyWith({
    ExploreFilters? filters,
    List<ExploreCourse>? filteredCourses,
  }) {
    return ExploreFilterState(
      filters: filters ?? this.filters,
      filteredCourses: filteredCourses ?? this.filteredCourses,
    );
  }

  @override
  List<Object?> get props => [filters, filteredCourses];
}
