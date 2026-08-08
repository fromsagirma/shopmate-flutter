import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../entities/product.dart';
import '../repositories/products_repository.dart';

part 'get_product_by_id_usecase.g.dart';

class GetProductByIdUseCase {
  final ProductsRepository repository;

  GetProductByIdUseCase(this.repository);

  Future<Product> call(int id) {
    return repository.getProductById(id);
  }
}

@riverpod
GetProductByIdUseCase getProductByIdUseCase(GetProductByIdUseCaseRef ref) {
  return GetProductByIdUseCase(ref.watch(productsRepositoryProvider));
}
