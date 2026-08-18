import 'package:learnhub/core/error/result.dart';
import 'package:learnhub/features/common/domain/entities/course.dart';
import 'package:learnhub/features/landing/domain/repositories/landing_repository.dart';

class GetFeaturedCoursesUseCase {
  final LandingRepository _repository;
  const GetFeaturedCoursesUseCase(this._repository);

  Future<Result<List<Course>>> call() async {
    return _repository.getFeaturedCourses();
  }
}
