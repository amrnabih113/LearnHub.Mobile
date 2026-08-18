import 'package:learnhub/core/error/result.dart';
import 'package:learnhub/features/landing/domain/entities/learning_path.dart';
import 'package:learnhub/features/landing/domain/repositories/landing_repository.dart';

class GetLearningPathsUseCase {
  final LandingRepository _repository;
  const GetLearningPathsUseCase(this._repository);

  Future<Result<List<LearningPath>>> call() async {
    return _repository.getLearningPaths();
  }
}
