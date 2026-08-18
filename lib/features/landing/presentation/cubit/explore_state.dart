part of 'explore_cubit.dart';

enum ExploreStatus { initial, loading, success, error }

class ExploreState extends Equatable {
  const ExploreState({
    this.status = ExploreStatus.initial,
    this.allCourses = const [],
    this.filteredCourses = const [],
    this.categories = const [],
    this.paths = const [],
    this.filters = const ExploreFilters(),
    this.errorMessage,
  });

  final ExploreStatus status;
  final List<Course> allCourses;
  final List<Course> filteredCourses;
  final List<Category> categories;
  final List<LearningPath> paths;
  final ExploreFilters filters;
  final String? errorMessage;

  bool get isLoading => status == ExploreStatus.loading;
  bool get isSuccess => status == ExploreStatus.success;
  bool get isError => status == ExploreStatus.error;

  /// Helper getter returning list of category names (e.g. for simple UI filters)
  List<String> get categoryNames => categories.map((c) => c.name).toList();

  ExploreState copyWith({
    ExploreStatus? status,
    List<Course>? allCourses,
    List<Course>? filteredCourses,
    List<Category>? categories,
    List<LearningPath>? paths,
    ExploreFilters? filters,
    String? errorMessage,
  }) {
    return ExploreState(
      status: status ?? this.status,
      allCourses: allCourses ?? this.allCourses,
      filteredCourses: filteredCourses ?? this.filteredCourses,
      categories: categories ?? this.categories,
      paths: paths ?? this.paths,
      filters: filters ?? this.filters,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        allCourses,
        filteredCourses,
        categories,
        paths,
        filters,
        errorMessage,
      ];
}
