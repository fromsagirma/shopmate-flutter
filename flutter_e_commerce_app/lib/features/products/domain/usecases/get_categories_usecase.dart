import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../repositories/products_repository.dart';

part 'get_categories_usecase.g.dart';

class GetCategoriesUseCase {
  final ProductsRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<String>> call() {
    return repository.getCategories();
  }
}

@riverpod
GetCategoriesUseCase getCategoriesUseCase(GetCategoriesUseCaseRef ref) {
  return GetCategoriesUseCase(ref.watch(productsRepositoryProvider));
}
