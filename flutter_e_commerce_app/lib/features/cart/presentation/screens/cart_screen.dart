import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../providers/cart_computed_providers.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: [
          cartState.maybeWhen(
            data: (items) {
              if (items.isNotEmpty) {
                return IconButton(
                  icon: const Icon(Icons.delete_sweep),
                  onPressed: () => _showClearCartConfirmation(context, ref),
                );
              }
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: cartState.when(
        skipLoadingOnReload: true,
        skipLoadingOnRefresh: true,
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Your cart is empty', style: TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
            );
          }

          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return CartItemTile(item: items[index]);
                      },
                    ),
                  ),
                  _CartTotalBar(),
                ],
              ),
            ),
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) {
          final message = error is Failure ? error.message : error.toString();
          return CustomErrorWidget(
            message: message,
            onRetry: () {
              ref.invalidate(cartProvider);
            },
          );
        },
      ),
    );
  }

  void _showClearCartConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Clear Cart'),
          content: const Text('Are you sure you want to remove all items?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ref.read(cartProvider.notifier).clearCart();
                Navigator.of(context).pop();
              },
              child: const Text('Clear All', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

class _CartTotalBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final total = ref.watch(cartTotalProvider);
    final itemCount = ref.watch(cartItemCountProvider);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, -4),
            blurRadius: 8,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total ($itemCount items)',
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  PriceFormatter.format(total),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Checkout not implemented')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Checkout', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
