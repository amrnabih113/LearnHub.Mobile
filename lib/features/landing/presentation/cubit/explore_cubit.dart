import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/common/domain/entities/course.dart';
import 'package:learnhub/features/landing/domain/entities/category.dart';
import 'package:learnhub/features/landing/domain/entities/explore_filters.dart';
import 'package:learnhub/features/landing/domain/entities/learning_path.dart';
import 'package:learnhub/features/landing/domain/usecases/get_categories_use_case.dart';
import 'package:learnhub/features/landing/domain/usecases/get_explore_courses_use_case.dart';
import 'package:learnhub/features/landing/domain/usecases/get_learning_paths_use_case.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit({
    required GetExploreCoursesUseCase getExploreCoursesUseCase,
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetLearningPathsUseCase getLearningPathsUseCase,
  }) : _getExploreCoursesUseCase = getExploreCoursesUseCase,
       _getCategoriesUseCase = getCategoriesUseCase,
       _getLearningPathsUseCase = getLearningPathsUseCase,
       super(const ExploreState());

  final GetExploreCoursesUseCase _getExploreCoursesUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetLearningPathsUseCase _getLearningPathsUseCase;

  Future<void> loadExploreData() async {
    emit(state.copyWith(status: ExploreStatus.loading));

    final results = await Future.wait([
      _getExploreCoursesUseCase(),
      _getCategoriesUseCase(),
      _getLearningPathsUseCase(),
    ]);

    final coursesResult = results[0];
    final categoriesResult = results[1];
    final pathsResult = results[2];

    String? errorMessage;
    List<Course> courses = state.allCourses;
    List<Category> categories = state.categories;
    List<LearningPath> paths = state.paths;

    coursesResult.when(
      onSuccess: (data) => courses = data as List<Course>,
      onFailure: (failure) => errorMessage ??= failure.message,
    );

    categoriesResult.when(
      onSuccess: (data) => categories = data as List<Category>,
      onFailure: (failure) => errorMessage ??= failure.message,
    );

    pathsResult.when(
      onSuccess: (data) => paths = data as List<LearningPath>,
      onFailure: (failure) => errorMessage ??= failure.message,
    );

    if (errorMessage != null && courses.isEmpty) {
      emit(
        state.copyWith(status: ExploreStatus.error, errorMessage: errorMessage),
      );
      return;
    }

    final filtered = _applyFilters(courses, state.filters);

    emit(
      state.copyWith(
        status: ExploreStatus.success,
        allCourses: courses,
        filteredCourses: filtered,
        categories: categories,
        paths: paths,
        errorMessage: null,
      ),
    );
  }

  void updateFilters(ExploreFilters filters) {
    final filtered = _applyFilters(state.allCourses, filters);
    emit(state.copyWith(filters: filters, filteredCourses: filtered));
  }

  void selectCategory(String? category) {
    updateFilters(state.filters.copyWith(category: category));
  }

  void searchCourses(String query) {
    updateFilters(state.filters.copyWith(searchQuery: query));
  }

  void clearFilters() {
    updateFilters(const ExploreFilters());
  }

  

  List<Course> _applyFilters(List<Course> courses, ExploreFilters filters) {
    return courses.where((course) {
      // 1. Search Query
      if (filters.searchQuery.trim().isNotEmpty) {
        final query = filters.searchQuery.trim().toLowerCase();
        final matchTitle = course.title.toLowerCase().contains(query);
        final matchInstructor = course.instructor.toLowerCase().contains(query);
        final matchCategory = course.category.toLowerCase().contains(query);
        if (!matchTitle && !matchInstructor && !matchCategory) {
          return false;
        }
      }

      // 2. Category
      if (filters.category != null &&
          filters.category!.isNotEmpty &&
          filters.category != 'All' &&
          course.category.toLowerCase() != filters.category!.toLowerCase()) {
        return false;
      }

      // 3. Level
      if (filters.levels.isNotEmpty &&
          !filters.levels.any(
            (l) => l.toLowerCase() == course.level.toLowerCase(),
          )) {
        return false;
      } 

      // 4. Rating
      if (course.rating < filters.minRating) {
        return false;
      }

      // 5. Price
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
