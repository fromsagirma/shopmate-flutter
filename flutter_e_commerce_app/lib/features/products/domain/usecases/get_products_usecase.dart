import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../entities/product.dart';
import '../repositories/products_repository.dart';

part 'get_products_usecase.g.dart';

class GetProductsUseCase {
  final ProductsRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}

@riverpod
GetProductsUseCase getProductsUseCase(GetProductsUseCaseRef ref) {
  return GetProductsUseCase(ref.watch(productsRepositoryProvider));
}
