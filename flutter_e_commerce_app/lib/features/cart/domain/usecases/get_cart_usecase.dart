import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/cart_repository_impl.dart';
import '../entities/cart_item.dart';
import '../repositories/cart_repository.dart';

part 'get_cart_usecase.g.dart';

class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<List<CartItem>> call() {
    return repository.getCart();
  }
}

@riverpod
GetCartUseCase getCartUseCase(GetCartUseCaseRef ref) {
  return GetCartUseCase(ref.watch(cartRepositoryProvider));
}
