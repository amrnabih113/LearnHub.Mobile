import '../../../../core/error/result.dart';
import '../entities/category.dart';
import '../repositories/landing_repository.dart';

class GetCategoriesUseCase {
  final LandingRepository _repository;
  const GetCategoriesUseCase(this._repository);

  Future<Result<List<Category>>> call() async {
    return _repository.getCategories();
  }
}
