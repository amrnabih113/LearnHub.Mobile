import '../../../../core/error/result.dart';
import '../../../common/domain/entities/course.dart';
import '../repositories/landing_repository.dart';

class GetFeaturedCoursesUseCase {
  final LandingRepository _repository;
  const GetFeaturedCoursesUseCase(this._repository);

  Future<Result<List<Course>>> call() async {
    return _repository.getFeaturedCourses();
  }
}
