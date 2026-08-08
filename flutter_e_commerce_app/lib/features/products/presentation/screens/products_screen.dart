import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../cart/presentation/providers/cart_computed_providers.dart';
import '../providers/products_provider.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchQueryProvider.notifier).setQuery(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final productsAsync = ref.watch(filteredProductsProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final itemCount = ref.watch(cartItemCountProvider);
              return IconButton(
                icon: Badge(
                  label: Text('$itemCount'),
                  isLabelVisible: itemCount > 0,
                  child: const Icon(Icons.shopping_cart),
                ),
                tooltip: 'Cart',
                onPressed: () {
                  context.push(RouteNames.cart);
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () {
              context.push(RouteNames.profile);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Categories List
          categoriesAsync.when(
            data: (categories) {
              return SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: categories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: const Text('All'),
                          selected: selectedCategory == null,
                          onSelected: (_) {
                            ref.read(selectedCategoryProvider.notifier).setCategory(null);
                          },
                        ),
                      );
                    }
                    final category = categories[index - 1];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: selectedCategory == category,
                        onSelected: (_) {
                          ref.read(selectedCategoryProvider.notifier).setCategory(category);
                        },
                      ),
                    );
                  },
                ),
              );
            },
            loading: () => const SizedBox(height: 60, child: LoadingWidget()),
            error: (err, _) => const SizedBox(height: 60, child: Center(child: Text('Failed to load categories'))),
          ),
          
          const Divider(height: 1),

          // Products Grid
          Expanded(
            child: productsAsync.when(
              data: (products) {
                if (products.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            searchQuery.isNotEmpty 
                              ? 'No results for "$searchQuery"'
                              : (selectedCategory != null ? 'No products in this category' : 'No products found.'),
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = constraints.maxWidth > 800 ? 4 : (constraints.maxWidth > 600 ? 3 : 2);
                    
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          product: product,
                          onTap: () {
                            context.push(
                              '${RouteNames.products}/${product.id}',
                              extra: product,
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
              loading: () => const LoadingWidget(),
              error: (error, stack) => CustomErrorWidget(
                message: error.toString(),
                onRetry: () => ref.invalidate(baseProductsProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
