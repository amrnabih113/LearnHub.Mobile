import '../../../../common/data/models/course_model.dart';
import '../../models/category_model.dart';
import '../../models/learning_path_model.dart';

/// Abstract contract for landing & explore remote operations.
abstract class LandingRemoteDataSource {
  Future<List<CourseModel>> getCourses();
  Future<List<CourseModel>> getFeaturedCourses();
  Future<List<CourseModel>> getTrendingCourses();
  Future<List<LearningPathModel>> getLearningPaths();
  Future<List<CategoryModel>> getCategories();
}
