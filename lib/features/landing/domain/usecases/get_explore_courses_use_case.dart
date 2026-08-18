import '../../../../core/error/result.dart';
import '../../../common/domain/entities/course.dart';
import '../repositories/landing_repository.dart';

class GetExploreCoursesUseCase {
  final LandingRepository _repository;
  const GetExploreCoursesUseCase(this._repository);

  Future<Result<List<Course>>> call() async {
    return _repository.getCourses();
  }
}
