import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/orders_repository_impl.dart';
import '../entities/order.dart';
import '../repositories/orders_repository.dart';

part 'create_order_usecase.g.dart';

class CreateOrderUseCase {
  final OrdersRepository _repository;

  CreateOrderUseCase(this._repository);

  Future<void> call(Order order) async {
    await _repository.saveOrder(order);
  }
}

@riverpod
CreateOrderUseCase createOrderUseCase(CreateOrderUseCaseRef ref) {
  final repository = ref.watch(ordersRepositoryProvider);
  return CreateOrderUseCase(repository);
}
