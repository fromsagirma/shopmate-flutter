import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';

import '../../../cart/presentation/providers/cart_computed_providers.dart';

import '../widgets/category_list_section.dart';
import '../widgets/featured_products_section.dart';
import '../widgets/special_offer_section.dart';
import '../widgets/hero_banner_carousel.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.brandGreen,
              ),
              child: Text(
                'Mesob Gebeya',
                style: theme.textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                context.go(RouteNames.home);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                Navigator.pop(context);
                context.go(RouteNames.products);
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Orders'),
              onTap: () {
                Navigator.pop(context);
                context.go(RouteNames.orders);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {
                Navigator.pop(context);
                context.go(RouteNames.cart);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: AppColors.brandGreen),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                // VERIFY this exact filename (case + spacing) against
                // what's actually registered in pubspec.yaml and on disk
                // before running.
                'assets/images/Mesob_Market.jpg',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback so a bad path shows a visible icon instead
                  // of silently failing / leaving blank space.
                  return const Icon(
                    Icons.storefront,
                    size: 32,
                    color: AppColors.brandGreen,
                  );
                },
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Mesob Gebeya',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.brandGreen,
                fontFamily: 'serif',
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),
          Consumer(
            builder: (context, ref, child) {
              final cartItemCount = ref.watch(cartItemCountProvider);
              return IconButton(
                icon: Badge(
                  label: Text('$cartItemCount'),
                  isLabelVisible: cartItemCount > 0,
                  backgroundColor: AppColors.brandGreen,
                  child: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.black87),
                ),
                onPressed: () {
                  context.go(RouteNames.cart);
                },
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                readOnly: true,
                onTap: () {
                  context.go(RouteNames.products);
                },
                decoration: InputDecoration(
                  hintText: 'Search for products, brands and more...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.qr_code_scanner),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),

            // Hero Banner Carousel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const HeroBannerCarousel(),
            ),

            const SizedBox(height: 24),

            const CategoryListSection(),

            const SizedBox(height: 16),

            const SpecialOfferSection(),

            const SizedBox(height: 24),

            const FeaturedProductsSection(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}