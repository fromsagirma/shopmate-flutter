import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/cart/presentation/screens/cart_screen.dart';
import '../../../features/products/domain/entities/product.dart';
import '../../../features/products/presentation/screens/product_detail_screen.dart';
import '../../../features/products/presentation/screens/products_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/orders/presentation/screens/orders_screen.dart';
import '../widgets/scaffold_with_nav_bar.dart';
import 'route_names.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _productsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'products');
final GlobalKey<NavigatorState> _ordersNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'orders');
final GlobalKey<NavigatorState> _cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cart');

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  late final GoRouter router;

  ref.listen(
    authProvider,
    (previous, next) {
      router.refresh();
    },
  );

  router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.home,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isAuthLoading = authState.isLoading;
      if (isAuthLoading) return null;

      final isAuthenticated = authState.valueOrNull != null;
      final isGoingToLogin = state.matchedLocation == RouteNames.login;

      if (!isAuthenticated && !isGoingToLogin) {
        return RouteNames.login;
      }

      if (isAuthenticated && isGoingToLogin) {
        return RouteNames.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: RouteNames.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _productsNavigatorKey,
            routes: [
              GoRoute(
                path: RouteNames.products,
                builder: (context, state) => const ProductsScreen(),
                routes: [
                  GoRoute(
                    name: RouteNames.productDetail,
                    path: ':id',
                    builder: (context, state) {
                      final id = int.parse(state.pathParameters['id']!);
                      final product = state.extra as Product?;
                      return ProductDetailScreen(id: id, initialProduct: product);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _ordersNavigatorKey,
            routes: [
              GoRoute(
                path: RouteNames.orders,
                builder: (context, state) => const OrdersScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _cartNavigatorKey,
            routes: [
              GoRoute(
                path: RouteNames.cart,
                builder: (context, state) => const CartScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RouteNames.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );

  return router;
}
