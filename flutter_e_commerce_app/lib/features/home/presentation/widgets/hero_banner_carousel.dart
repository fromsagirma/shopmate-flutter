import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../products/presentation/providers/products_provider.dart';

/// A carousel widget for the home screen hero banner.
/// Shows up to three product images from the already‑fetched products
/// (`baseProductsProvider`). Falls back to the static asset image when the
/// provider is loading, has an error, or provides fewer than the required
/// images. Auto‑advances every 10 seconds and loops back to the first slide.
/// Includes dot indicators that reflect the current page; tapping a dot
/// jumps to that page. Properly disposes the [Timer] and [PageController]
/// to avoid memory leaks.
class HeroBannerCarousel extends ConsumerStatefulWidget {
  const HeroBannerCarousel({super.key});

  @override
  ConsumerState<HeroBannerCarousel> createState() => _HeroBannerCarouselState();
}

class _HeroBannerCarouselState extends ConsumerState<HeroBannerCarousel> {
  late final PageController _pageController;
  Timer? _autoSlideTimer;
  int _currentPage = 0;
  static const _autoSlideDuration = Duration(seconds: 10);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoSlideTimer();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlideTimer() {
    _autoSlideTimer = Timer.periodic(_autoSlideDuration, (_) {
      if (!_pageController.hasClients) return;
      final pageCount = _imageUrls.length;
      if (pageCount == 0) return;
      final nextPage = (_currentPage + 1) % pageCount;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  // Compute up to three image URLs from the already‑fetched products.
  List<String> get _imageUrls {
    final async = ref.watch(baseProductsProvider);
    if (async.hasValue && async.value != null && async.value!.isNotEmpty) {
      final images = async.value!
          .where((p) => p.image.isNotEmpty)
          .map((p) => p.image)
          .take(3)
          .toList();
      if (images.isNotEmpty) return images;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrls = _imageUrls;

    // Fallback to original static banner if no product images.
    if (imageUrls.isEmpty) {
      return Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1B3B2B),
          image: DecorationImage(
            image: AssetImage('assets/images/home-backg.png'),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
            opacity: 0.5,
          ),
        ),
          padding: const EdgeInsets.all(24.0),
          child: _buildBannerContent(theme),
      );
    }

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1B3B2B),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Stack(
        children: [
          // Image carousel fills the whole banner
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: PageView.builder(
                controller: _pageController,
                itemCount: imageUrls.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  return Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight,
                  );
                },
              ),
            ),
          ),
          // Dark overlay (keeps text legible)
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          // Text & button overlay – same as original banner.
          _buildBannerContent(theme),
          // Dot indicators at bottom centre.
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imageUrls.length, (i) {
                final isActive = i == _currentPage;
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? AppColors.brandGreen : Colors.grey.shade300,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Re‑use the original banner text & button layout.
  Widget _buildBannerContent(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover the\nEssence of\nEthiopia',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Authentic crafts, textiles, and\ncoffee — curated with love.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            context.go(RouteNames.products);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF1B3B2B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Shop Now', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
        ),
      ],
    );
  }
}
