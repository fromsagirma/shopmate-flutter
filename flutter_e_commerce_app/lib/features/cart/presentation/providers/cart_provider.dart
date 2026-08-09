import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../products/domain/entities/product.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_usecase.dart';
import '../../domain/usecases/remove_from_cart_usecase.dart';
import '../../domain/usecases/update_quantity_usecase.dart';
import '../../../orders/domain/entities/order.dart';
import '../../../orders/domain/usecases/create_order_usecase.dart';
import '../../../orders/presentation/providers/orders_provider.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  FutureOr<List<CartItem>> build() async {
    return _fetchCart();
  }

  Future<List<CartItem>> _fetchCart() async {
    final getCart = ref.watch(getCartUseCaseProvider);
    return await getCart();
  }

  Future<void> addToCart(Product product) async {
    if (state.isLoading) return;
    state = const AsyncLoading<List<CartItem>>().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      final addToCartUseCase = ref.read(addToCartUseCaseProvider);
      await addToCartUseCase(product);
      return _fetchCart();
    });
  }

  Future<void> updateQuantity(int productId, int quantity) async {
    if (state.isLoading) return;
    state = const AsyncLoading<List<CartItem>>().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      final updateQuantityUseCase = ref.read(updateQuantityUseCaseProvider);
      await updateQuantityUseCase(productId, quantity);
      return _fetchCart();
    });
  }

  Future<void> removeItem(int productId) async {
    if (state.isLoading) return;
    state = const AsyncLoading<List<CartItem>>().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      final removeFromCartUseCase = ref.read(removeFromCartUseCaseProvider);
      await removeFromCartUseCase(productId);
      return _fetchCart();
    });
  }

  Future<void> clearCart() async {
    if (state.isLoading) return;
    state = const AsyncLoading<List<CartItem>>().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      final clearCartUseCase = ref.read(clearCartUseCaseProvider);
      await clearCartUseCase();
      return _fetchCart();
    });
  }

  Future<void> checkoutItem(int productId) async {
    if (state.isLoading) return;
    
    // Find item before we enter the loading state/guard
    final cartItem = state.valueOrNull?.firstWhere((item) => item.id == productId);
    if (cartItem == null) return;

    state = const AsyncLoading<List<CartItem>>().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      // Simulated checkout network delay
      await Future.delayed(const Duration(milliseconds: 800));
      
      // 1. Create order
      final createOrderUseCase = ref.read(createOrderUseCaseProvider);
      await createOrderUseCase(
        Order(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          productId: cartItem.id,
          title: cartItem.title,
          image: cartItem.image,
          price: cartItem.price.toDouble(),
          quantity: cartItem.quantity,
          checkoutDate: DateTime.now(),
        ),
      );

      // 2. Remove from cart (only if order creation succeeds)
      final removeFromCartUseCase = ref.read(removeFromCartUseCaseProvider);
      await removeFromCartUseCase(productId);
      
      // 3. Invalidate Orders provider to refetch from Hive on next view
      ref.invalidate(ordersProvider);
      
      return _fetchCart();
    });
  }
}
