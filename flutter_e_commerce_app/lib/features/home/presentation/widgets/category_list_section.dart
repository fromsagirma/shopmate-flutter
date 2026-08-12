import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../products/presentation/providers/products_provider.dart';
import '../providers/home_providers.dart';

class CategoryListSection extends ConsumerWidget {
  const CategoryListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shop by Category',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {
                  context.go(RouteNames.products);
                },
                child: Row(
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(color: AppColors.brandGreen.withValues(alpha: 0.8)),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: AppColors.brandGreen.withValues(alpha: 0.8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: categoriesAsync.when(
            data: (categories) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1, // +1 for the "More" tile
                itemBuilder: (context, index) {
                  if (index == categories.length) {
                    return _buildMoreTile(context);
                  }
                  final category = categories[index];
                  return _buildCategoryTile(context, ref, category);
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTile(BuildContext context, WidgetRef ref, String category) {
    final imageAsync = ref.watch(categoryImageProvider(category));
    
    return GestureDetector(
      onTap: () {
        ref.read(selectedCategoryProvider.notifier).setCategory(category);
        context.go(RouteNames.products);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: imageAsync.when(
                data: (imageUrl) {
                  if (imageUrl != null) {
                    return Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
                    );
                  }
                  return const Icon(Icons.category);
                },
                loading: () => const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                error: (_, __) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.length > 10 ? '${category.substring(0, 10)}...' : category,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoreTile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(RouteNames.products);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.more_horiz,
                color: AppColors.brandGreen,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'More',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
