import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/cart_repository_impl.dart';
import '../repositories/cart_repository.dart';

part 'clear_cart_usecase.g.dart';

class ClearCartUseCase {
  final CartRepository repository;

  ClearCartUseCase(this.repository);

  Future<void> call() {
    return repository.clearCart();
  }
}

@riverpod
ClearCartUseCase clearCartUseCase(ClearCartUseCaseRef ref) {
  return ClearCartUseCase(ref.watch(cartRepositoryProvider));
}
