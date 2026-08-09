import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/storage/storage_keys.dart';
import '../models/order_model.dart';

part 'orders_local_datasource.g.dart';

abstract class OrdersLocalDataSource {
  Future<void> init();
  Future<List<OrderModel>> getOrders();
  Future<void> saveOrder(OrderModel order);
}

class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  Box<OrderModel>? _ordersBox;

  @override
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(OrderModelAdapter());
    }
    _ordersBox = await Hive.openBox<OrderModel>(StorageKeys.ordersBox);
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    if (_ordersBox == null) await init();
    final orders = _ordersBox!.values.toList();
    orders.sort((a, b) => b.checkoutDate.compareTo(a.checkoutDate));
    return orders;
  }

  @override
  Future<void> saveOrder(OrderModel order) async {
    if (_ordersBox == null) await init();
    await _ordersBox!.put(order.id, order);
  }
}

@riverpod
OrdersLocalDataSource ordersLocalDataSource(OrdersLocalDataSourceRef ref) {
  return OrdersLocalDataSourceImpl();
}
