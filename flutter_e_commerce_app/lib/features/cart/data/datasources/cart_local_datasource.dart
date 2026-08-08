import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/storage/storage_keys.dart';
import '../models/cart_item_model.dart';

part 'cart_local_datasource.g.dart';

abstract class CartLocalDataSource {
  Future<void> init();
  Future<List<CartItemModel>> getCart();
  Future<void> saveCartItem(CartItemModel item);
  Future<void> removeCartItem(int productId);
  Future<void> clearCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  Box<CartItemModel>? _cartBox;

  @override
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CartItemModelAdapter());
    }
    _cartBox = await Hive.openBox<CartItemModel>(StorageKeys.cartBox);
  }

  @override
  Future<List<CartItemModel>> getCart() async {
    if (_cartBox == null) await init();
    return _cartBox!.values.toList();
  }

  @override
  Future<void> saveCartItem(CartItemModel item) async {
    if (_cartBox == null) await init();
    await _cartBox!.put(item.id, item);
  }

  @override
  Future<void> removeCartItem(int productId) async {
    if (_cartBox == null) await init();
    await _cartBox!.delete(productId);
  }

  @override
  Future<void> clearCart() async {
    if (_cartBox == null) await init();
    await _cartBox!.clear();
  }
}

@riverpod
CartLocalDataSource cartLocalDataSource(CartLocalDataSourceRef ref) {
  return CartLocalDataSourceImpl();
}
