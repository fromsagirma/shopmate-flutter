import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../domain/entities/product.dart';
import '../providers/product_detail_provider.dart';

class ProductDetailScreen extends ConsumerWidget {
  final int id;
  final Product? initialProduct;

  const ProductDetailScreen({
    super.key,
    required this.id,
    this.initialProduct,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialProduct != null) {
      return _ProductDetailView(product: initialProduct!);
    }

    final productAsync = ref.watch(productDetailProvider(id));

    return Scaffold(
      appBar: AppBar(title: const Text('Loading...')),
      body: productAsync.when(
        data: (product) => _ProductDetailView(product: product),
        loading: () => const LoadingWidget(),
        error: (error, _) => CustomErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(productDetailProvider(id)),
        ),
      ),
    );
  }
}

class _ProductDetailView extends ConsumerWidget {
  final Product product;

  const _ProductDetailView({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              PriceFormatter.format(product.price),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(label: Text(product.category)),
                const Spacer(),
                if (product.rating != null) ...[
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${product.rating!.rate} (${product.rating!.count} reviews)'),
                ],
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () async {
                await ref.read(cartProvider.notifier).addToCart(product);
                if (!context.mounted) return;

                final cartState = ref.read(cartProvider);
                if (cartState.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to add to cart.')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to cart!')),
                  );
                }
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
