import 'package:learnhub/core/error/result.dart';
import 'package:learnhub/features/landing/domain/entities/category.dart';
import 'package:learnhub/features/landing/domain/repositories/landing_repository.dart';

class GetCategoriesUseCase {
  final LandingRepository _repository;
  const GetCategoriesUseCase(this._repository);

  Future<Result<List<Category>>> call() async {
    return _repository.getCategories();
  }
}
