import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/orders_repository_impl.dart';
import '../entities/order.dart';
import '../repositories/orders_repository.dart';

part 'get_orders_usecase.g.dart';

class GetOrdersUseCase {
  final OrdersRepository _repository;

  GetOrdersUseCase(this._repository);

  Future<List<Order>> call() async {
    return await _repository.getOrders();
  }
}

@riverpod
GetOrdersUseCase getOrdersUseCase(GetOrdersUseCaseRef ref) {
  final repository = ref.watch(ordersRepositoryProvider);
  return GetOrdersUseCase(repository);
}
