import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'cart_provider.dart';

part 'cart_computed_providers.g.dart';

@riverpod
double cartTotal(CartTotalRef ref) {
  final cartState = ref.watch(cartProvider);
  
  return cartState.maybeWhen(
    data: (cartItems) {
      return cartItems.fold(0.0, (total, item) => total + (item.price * item.quantity));
    },
    orElse: () => 0.0,
  );
}

@riverpod
int cartItemCount(CartItemCountRef ref) {
  final cartState = ref.watch(cartProvider);
  
  return cartState.maybeWhen(
    data: (cartItems) {
      return cartItems.fold(0, (total, item) => total + item.quantity);
    },
    orElse: () => 0,
  );
}
