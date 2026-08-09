import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/order.dart';
import '../../domain/usecases/get_orders_usecase.dart';

part 'orders_provider.g.dart';

@riverpod
class Orders extends _$Orders {
  @override
  FutureOr<List<Order>> build() async {
    return _fetchOrders();
  }

  Future<List<Order>> _fetchOrders() async {
    final getOrders = ref.watch(getOrdersUseCaseProvider);
    return await getOrders();
  }

  Future<void> refreshOrders() async {
    if (state.isLoading) return;
    state = const AsyncLoading<List<Order>>().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      return _fetchOrders();
    });
  }
}
