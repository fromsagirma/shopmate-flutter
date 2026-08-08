import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/cart_item.dart';
import '../providers/cart_provider.dart';

class CartItemTile extends ConsumerWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
                  ),
                  child: Image.network(
                    item.image,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(height: 1.2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        PriceFormatter.format(item.price),
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Remove Icon
                IconButton(
                  icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
                  onPressed: () {
                    _showRemoveConfirmation(context, ref);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Quantity Controls
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.outline),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        iconSize: 20,
                        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                        onPressed: () {
                          if (item.quantity > 1) {
                            ref.read(cartProvider.notifier).updateQuantity(item.id, item.quantity - 1);
                          } else {
                            _showRemoveConfirmation(context, ref);
                          }
                        },
                      ),
                      Text(
                        '${item.quantity}',
                        style: theme.textTheme.titleMedium,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        iconSize: 20,
                        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                        onPressed: () {
                          ref.read(cartProvider.notifier).updateQuantity(item.id, item.quantity + 1);
                        },
                      ),
                    ],
                  ),
                ),
                // Checkout Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    foregroundColor: theme.colorScheme.onPrimaryContainer,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: ref.watch(cartProvider).isLoading ? null : () async {
                    await ref.read(cartProvider.notifier).checkoutItem(item.id);
                    if (!context.mounted) return;
                    
                    if (!ref.read(cartProvider).hasError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Checkout completed successfully.'),
                          backgroundColor: AppColors.success,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  icon: ref.watch(cartProvider).isLoading
                      ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: theme.colorScheme.onPrimaryContainer))
                      : const Icon(Icons.shopping_bag_outlined, size: 20),
                  label: const Text('Checkout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRemoveConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remove Item'),
          content: const Text('Are you sure you want to remove this item from your cart?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ref.read(cartProvider.notifier).removeItem(item.id);
                Navigator.of(context).pop();
              },
              child: const Text('Remove', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
