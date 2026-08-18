import '../../../../core/error/result.dart';
import '../entities/learning_path.dart';
import '../repositories/landing_repository.dart';

class GetLearningPathsUseCase {
  final LandingRepository _repository;
  const GetLearningPathsUseCase(this._repository);

  Future<Result<List<LearningPath>>> call() async {
    return _repository.getLearningPaths();
  }
}
