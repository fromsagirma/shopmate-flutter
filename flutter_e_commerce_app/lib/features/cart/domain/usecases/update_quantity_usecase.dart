import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/cart_repository_impl.dart';
import '../repositories/cart_repository.dart';

part 'update_quantity_usecase.g.dart';

class UpdateQuantityUseCase {
  final CartRepository repository;

  UpdateQuantityUseCase(this.repository);

  Future<void> call(int productId, int quantity) {
    return repository.updateQuantity(productId, quantity);
  }
}

@riverpod
UpdateQuantityUseCase updateQuantityUseCase(UpdateQuantityUseCaseRef ref) {
  return UpdateQuantityUseCase(ref.watch(cartRepositoryProvider));
}
