import 'package:learnhub/core/network/dio_client.dart';
import 'package:learnhub/features/common/data/models/course_model.dart';
import 'package:learnhub/features/landing/data/datasources/remote/landing_remote_data_source.dart';
import 'package:learnhub/features/landing/data/models/category_model.dart';
import 'package:learnhub/features/landing/data/models/learning_path_model.dart';

/// Real HTTP API implementation of [LandingRemoteDataSource] using [DioClient].
class ApiLandingRemoteDataSource implements LandingRemoteDataSource {
  final DioClient _client;

  const ApiLandingRemoteDataSource(this._client);

  @override
  Future<List<CourseModel>> getCourses() async {
    final response = await _client.get('/courses');
    final dynamic data = response.data;
    if (data is List) {
      return data
          .whereType<Map<String, dynamic>>()
          .map(CourseModel.fromJson)
          .toList();
    }
    return <CourseModel>[];
  }

  @override
  Future<List<CourseModel>> getFeaturedCourses() async {
    final response = await _client.get('/courses/featured');
    final dynamic data = response.data;
    if (data is List) {
      return data
          .whereType<Map<String, dynamic>>()
          .map(CourseModel.fromJson)
          .toList();
    }
    return <CourseModel>[];
  }

  @override
  Future<List<CourseModel>> getTrendingCourses() async {
    final response = await _client.get('/courses/trending');
    final dynamic data = response.data;
    if (data is List) {
      return data
          .whereType<Map<String, dynamic>>()
          .map(CourseModel.fromJson)
          .toList();
    }
    return <CourseModel>[];
  }

  @override
  Future<List<LearningPathModel>> getLearningPaths() async {
    final response = await _client.get('/learning-paths');
    final dynamic data = response.data;
    if (data is List) {
      return data
          .whereType<Map<String, dynamic>>()
          .map(LearningPathModel.fromJson)
          .toList();
    }
    return <LearningPathModel>[];
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _client.get('/categories');
    final dynamic data = response.data;
    if (data is List) {
      return data
          .whereType<Map<String, dynamic>>()
          .map(CategoryModel.fromJson)
          .toList();
    }
    return <CategoryModel>[];
  }
}
