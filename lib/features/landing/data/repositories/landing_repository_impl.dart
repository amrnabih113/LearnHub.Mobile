import 'package:learnhub/core/error/failuors.dart';
import 'package:learnhub/core/error/result.dart';
import 'package:learnhub/features/common/domain/entities/course.dart';
import 'package:learnhub/features/landing/data/datasources/remote/landing_remote_data_source.dart';
import 'package:learnhub/features/landing/domain/entities/category.dart';
import 'package:learnhub/features/landing/domain/entities/learning_path.dart';
import 'package:learnhub/features/landing/domain/repositories/landing_repository.dart';

class LandingRepositoryImpl implements LandingRepository {
  final LandingRemoteDataSource _remoteDataSource;

  const LandingRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<List<Course>>> getCourses() async {
    try {
      final models = await _remoteDataSource.getCourses();
      final entities = models.map((m) => m.toEntity()).toList();
      return Result.success(entities);
    } catch (e) {
      return Result.failure(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<Course>>> getFeaturedCourses() async {
    try {
      final models = await _remoteDataSource.getFeaturedCourses();
      final entities = models.map((m) => m.toEntity()).toList();
      return Result.success(entities);
    } catch (e) {
      return Result.failure(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<Course>>> getTrendingCourses() async {
    try {
      final models = await _remoteDataSource.getTrendingCourses();
      final entities = models.map((m) => m.toEntity()).toList();
      return Result.success(entities);
    } catch (e) {
      return Result.failure(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<LearningPath>>> getLearningPaths() async {
    try {
      final models = await _remoteDataSource.getLearningPaths();
      final entities = models.map((m) => m.toEntity()).toList();
      return Result.success(entities);
    } catch (e) {
      return Result.failure(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<Category>>> getCategories() async {
    try {
      final models = await _remoteDataSource.getCategories();
      final entities = models.map((m) => m.toEntity()).toList();
      return Result.success(entities);
    } catch (e) {
      return Result.failure(mapExceptionToFailure(e));
    }
  }
}
