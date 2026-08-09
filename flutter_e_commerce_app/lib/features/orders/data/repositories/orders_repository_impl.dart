import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/order.dart';
import '../../domain/repositories/orders_repository.dart';
import '../datasources/orders_local_datasource.dart';
import '../models/order_model.dart';

part 'orders_repository_impl.g.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersLocalDataSource _localDataSource;

  OrdersRepositoryImpl(this._localDataSource);

  @override
  Future<List<Order>> getOrders() async {
    final models = await _localDataSource.getOrders();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> saveOrder(Order order) async {
    final model = OrderModel.fromEntity(order);
    await _localDataSource.saveOrder(model);
  }
}

@riverpod
OrdersRepository ordersRepository(OrdersRepositoryRef ref) {
  final localDataSource = ref.watch(ordersLocalDataSourceProvider);
  return OrdersRepositoryImpl(localDataSource);
}
