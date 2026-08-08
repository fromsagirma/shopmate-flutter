import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../entities/product.dart';
import '../repositories/products_repository.dart';

part 'get_products_by_category_usecase.g.dart';

class GetProductsByCategoryUseCase {
  final ProductsRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  Future<List<Product>> call(String category) {
    return repository.getProductsByCategory(category);
  }
}

@riverpod
GetProductsByCategoryUseCase getProductsByCategoryUseCase(
  GetProductsByCategoryUseCaseRef ref,
) {
  return GetProductsByCategoryUseCase(ref.watch(productsRepositoryProvider));
}
