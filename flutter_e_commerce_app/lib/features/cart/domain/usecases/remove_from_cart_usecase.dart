import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/cart_repository_impl.dart';
import '../repositories/cart_repository.dart';

part 'remove_from_cart_usecase.g.dart';

class RemoveFromCartUseCase {
  final CartRepository repository;

  RemoveFromCartUseCase(this.repository);

  Future<void> call(int productId) {
    return repository.removeFromCart(productId);
  }
}

@riverpod
RemoveFromCartUseCase removeFromCartUseCase(RemoveFromCartUseCaseRef ref) {
  return RemoveFromCartUseCase(ref.watch(cartRepositoryProvider));
}
