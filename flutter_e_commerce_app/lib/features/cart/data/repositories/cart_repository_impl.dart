import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../../products/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_local_datasource.dart';
import '../models/cart_item_model.dart';

part 'cart_repository_impl.g.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CartItem>> getCart() async {
    try {
      final models = await localDataSource.getCart();
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw CacheFailure('Failed to read cart data from local storage.');
    }
  }

  @override
  Future<void> addToCart(Product product) async {
    try {
      final cart = await localDataSource.getCart();
      final existingItem = cart.where((item) => item.id == product.id).firstOrNull;

      if (existingItem != null) {
        final updatedItem = CartItemModel(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          image: existingItem.image,
          quantity: existingItem.quantity + 1,
        );
        await localDataSource.saveCartItem(updatedItem);
      } else {
        final newItem = CartItemModel(
          id: product.id,
          title: product.title,
          price: product.price,
          image: product.image,
          quantity: 1,
        );
        await localDataSource.saveCartItem(newItem);
      }
    } catch (e) {
      throw CacheFailure('Failed to save item to cart.');
    }
  }

  @override
  Future<void> updateQuantity(int productId, int quantity) async {
    try {
      final cart = await localDataSource.getCart();
      final existingItem = cart.where((item) => item.id == productId).firstOrNull;
      
      if (existingItem != null) {
        final updatedItem = CartItemModel(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          image: existingItem.image,
          quantity: quantity,
        );
        await localDataSource.saveCartItem(updatedItem);
      }
    } catch (e) {
      throw CacheFailure('Failed to update cart item quantity.');
    }
  }

  @override
  Future<void> removeFromCart(int productId) async {
    try {
      await localDataSource.removeCartItem(productId);
    } catch (e) {
      throw CacheFailure('Failed to remove item from cart.');
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      await localDataSource.clearCart();
    } catch (e) {
      throw CacheFailure('Failed to clear cart.');
    }
  }
}

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  return CartRepositoryImpl(
    localDataSource: ref.watch(cartLocalDataSourceProvider),
  );
}
