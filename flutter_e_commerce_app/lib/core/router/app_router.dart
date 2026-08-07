import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/cart/presentation/screens/cart_screen.dart';
import '../../../features/products/presentation/screens/products_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';
import 'route_names.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

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
    initialLocation: RouteNames.products,
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
        return RouteNames.products;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.products,
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: RouteNames.cart,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: RouteNames.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );

  return router;
}
