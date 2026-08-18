import 'features/landing/data/datasources/remote/landing_remote_data_source.dart';
import 'features/landing/data/datasources/remote/mock_landing_remote_data_source.dart';
import 'features/landing/data/repositories/landing_repository_impl.dart';
import 'features/landing/domain/repositories/landing_repository.dart';
import 'features/landing/domain/usecases/get_categories_use_case.dart';
import 'features/landing/domain/usecases/get_explore_courses_use_case.dart';
import 'features/landing/domain/usecases/get_featured_courses_use_case.dart';
import 'features/landing/domain/usecases/get_learning_paths_use_case.dart';
import 'features/landing/presentation/cubit/explore_cubit.dart';

class ServiceLocator {
  ServiceLocator._();
  static final ServiceLocator instance = ServiceLocator._();

  final Map<Type, dynamic> _singletons = {};
  final Map<Type, dynamic Function()> _factories = {};

  void registerSingleton<T>(T instance) {
    _singletons[T] = instance;
  }

  void registerFactory<T>(T Function() factory) {
    _factories[T] = factory;
  }

  T get<T>() {
    if (_singletons.containsKey(T)) {
      return _singletons[T] as T;
    }
    if (_factories.containsKey(T)) {
      return _factories[T]!() as T;
    }
    throw StateError(
      'Dependency of type $T is not registered in ServiceLocator.',
    );
  }

  bool isRegistered<T>() =>
      _singletons.containsKey(T) || _factories.containsKey(T);

  void reset() {
    _singletons.clear;
    _factories.clear();
  }
}

/// Global accessor for dependency injection.
final sl = ServiceLocator.instance;

/// Initialize all app dependencies in correct Clean Architecture order.
Future<void> initDi() async {
  // 1. Data Sources
  sl.registerSingleton<LandingRemoteDataSource>(
    const MockLandingRemoteDataSource(),
  );

  // 2. Repositories
  sl.registerSingleton<LandingRepository>(
    LandingRepositoryImpl(sl.get<LandingRemoteDataSource>()),
  );

  // 3. Use Cases
  sl.registerSingleton<GetExploreCoursesUseCase>(
    GetExploreCoursesUseCase(sl.get<LandingRepository>()),
  );
  sl.registerSingleton<GetFeaturedCoursesUseCase>(
    GetFeaturedCoursesUseCase(sl.get<LandingRepository>()),
  );
  sl.registerSingleton<GetLearningPathsUseCase>(
    GetLearningPathsUseCase(sl.get<LandingRepository>()),
  );
  sl.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase(sl.get<LandingRepository>()),
  );

  // 4. Cubits / Presentation Layer (Factories for fresh instances or singleton if shared)
  sl.registerFactory<ExploreCubit>(
    () => ExploreCubit(
      getExploreCoursesUseCase: sl.get<GetExploreCoursesUseCase>(),
      getCategoriesUseCase: sl.get<GetCategoriesUseCase>(),
      getLearningPathsUseCase: sl.get<GetLearningPathsUseCase>(),
    ),
  );
}
