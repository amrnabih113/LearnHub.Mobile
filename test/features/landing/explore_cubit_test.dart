import 'package:flutter_test/flutter_test.dart';
import 'package:learnhub/features/landing/data/datasources/remote/mock_landing_remote_data_source.dart';
import 'package:learnhub/features/landing/data/repositories/landing_repository_impl.dart';
import 'package:learnhub/features/landing/domain/entities/explore_filters.dart';
import 'package:learnhub/features/landing/domain/usecases/get_categories_use_case.dart';
import 'package:learnhub/features/landing/domain/usecases/get_explore_courses_use_case.dart';
import 'package:learnhub/features/landing/domain/usecases/get_learning_paths_use_case.dart';
import 'package:learnhub/features/landing/presentation/cubit/explore_cubit.dart';

void main() {
  group('ExploreCubit Clean Architecture Tests', () {
    late ExploreCubit cubit;
    late MockLandingRemoteDataSource mockDataSource;
    late LandingRepositoryImpl repository;
    late GetExploreCoursesUseCase getCoursesUseCase;
    late GetCategoriesUseCase getCategoriesUseCase;
    late GetLearningPathsUseCase getLearningPathsUseCase;

    setUp(() {
      mockDataSource = const MockLandingRemoteDataSource();
      repository = LandingRepositoryImpl(mockDataSource);
      getCoursesUseCase = GetExploreCoursesUseCase(repository);
      getCategoriesUseCase = GetCategoriesUseCase(repository);
      getLearningPathsUseCase = GetLearningPathsUseCase(repository);

      cubit = ExploreCubit(
        getExploreCoursesUseCase: getCoursesUseCase,
        getCategoriesUseCase: getCategoriesUseCase,
        getLearningPathsUseCase: getLearningPathsUseCase,
      );
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state has default filters and empty data', () {
      expect(cubit.state.status, ExploreStatus.initial);
      expect(cubit.state.allCourses, isEmpty);
      expect(cubit.state.filteredCourses, isEmpty);
      expect(cubit.state.categories, isEmpty);
      expect(cubit.state.paths, isEmpty);
      expect(cubit.state.filters, const ExploreFilters());
    });

    test('loadExploreData populates all datasets and filteredCourses',
        () async {
      await cubit.loadExploreData();

      expect(cubit.state.status, ExploreStatus.success);
      expect(cubit.state.allCourses.isNotEmpty, isTrue);
      expect(cubit.state.filteredCourses.length, cubit.state.allCourses.length);
      expect(cubit.state.categories.isNotEmpty, isTrue);
      expect(cubit.state.paths.isNotEmpty, isTrue);
    });

    test('selectCategory filters courses by chosen category', () async {
      await cubit.loadExploreData();

      cubit.selectCategory('Design');

      expect(cubit.state.filters.category, 'Design');
      expect(
        cubit.state.filteredCourses.every((c) => c.category == 'Design'),
        isTrue,
      );
    });

    test('updateFilters with level filters correctly', () async {
      await cubit.loadExploreData();

      cubit.updateFilters(const ExploreFilters(levels: {'Beginner'}));

      expect(
        cubit.state.filteredCourses.every((c) => c.level == 'Beginner'),
        isTrue,
      );
    });

    test('updateFilters with free price filter returns only free courses',
        () async {
      await cubit.loadExploreData();

      cubit.updateFilters(
        const ExploreFilters(price: CoursePriceFilter.free),
      );

      expect(
        cubit.state.filteredCourses.every((c) => c.price == 0),
        isTrue,
      );
    });

    test('updateFilters with min rating returns courses >= rating', () async {
      await cubit.loadExploreData();

      cubit.updateFilters(const ExploreFilters(minRating: 4.8));

      expect(
        cubit.state.filteredCourses.every((c) => c.rating >= 4.8),
        isTrue,
      );
    });

    test('searchCourses matches course title or instructor', () async {
      await cubit.loadExploreData();

      cubit.searchCourses('Flutter');

      expect(cubit.state.filteredCourses.isNotEmpty, isTrue);
      expect(
        cubit.state.filteredCourses.every(
          (c) =>
              c.title.toLowerCase().contains('flutter') ||
              c.instructor.toLowerCase().contains('flutter') ||
              c.category.toLowerCase().contains('flutter'),
        ),
        isTrue,
      );
    });

    test('clearFilters restores full list of courses', () async {
      await cubit.loadExploreData();

      cubit.selectCategory('Design');
      expect(cubit.state.filteredCourses.length,
          lessThan(cubit.state.allCourses.length));

      cubit.clearFilters();
      expect(cubit.state.filters.hasFilters, isFalse);
      expect(cubit.state.filteredCourses.length, cubit.state.allCourses.length);
    });
  });
}
