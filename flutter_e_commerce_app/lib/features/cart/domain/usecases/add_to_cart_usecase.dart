import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../products/domain/entities/product.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../repositories/cart_repository.dart';

part 'add_to_cart_usecase.g.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<void> call(Product product) {
    return repository.addToCart(product);
  }
}

@riverpod
AddToCartUseCase addToCartUseCase(AddToCartUseCaseRef ref) {
  return AddToCartUseCase(ref.watch(cartRepositoryProvider));
}
