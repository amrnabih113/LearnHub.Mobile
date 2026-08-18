import 'package:learnhub/core/error/result.dart';
import 'package:learnhub/features/common/domain/entities/course.dart';
import 'package:learnhub/features/landing/domain/entities/category.dart';
import 'package:learnhub/features/landing/domain/entities/learning_path.dart';

/// Domain contract for Landing & Explore data operations.
abstract class LandingRepository {
  Future<Result<List<Course>>> getCourses();
  Future<Result<List<Course>>> getFeaturedCourses();
  Future<Result<List<Course>>> getTrendingCourses();
  Future<Result<List<LearningPath>>> getLearningPaths();
  Future<Result<List<Category>>> getCategories();
}
