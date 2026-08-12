// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryImageHash() => r'3cef301452be8a819f89bbb36c4a8e8578da44e5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [categoryImage].
@ProviderFor(categoryImage)
const categoryImageProvider = CategoryImageFamily();

/// See also [categoryImage].
class CategoryImageFamily extends Family<AsyncValue<String?>> {
  /// See also [categoryImage].
  const CategoryImageFamily();

  /// See also [categoryImage].
  CategoryImageProvider call(
    String category,
  ) {
    return CategoryImageProvider(
      category,
    );
  }

  @override
  CategoryImageProvider getProviderOverride(
    covariant CategoryImageProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryImageProvider';
}

/// See also [categoryImage].
class CategoryImageProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [categoryImage].
  CategoryImageProvider(
    String category,
  ) : this._internal(
          (ref) => categoryImage(
            ref as CategoryImageRef,
            category,
          ),
          from: categoryImageProvider,
          name: r'categoryImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryImageHash,
          dependencies: CategoryImageFamily._dependencies,
          allTransitiveDependencies:
              CategoryImageFamily._allTransitiveDependencies,
          category: category,
        );

  CategoryImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<String?> Function(CategoryImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryImageProvider._internal(
        (ref) => create(ref as CategoryImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _CategoryImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryImageProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryImageRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `category` of this provider.
  String get category;
}

class _CategoryImageProviderElement
    extends AutoDisposeFutureProviderElement<String?> with CategoryImageRef {
  _CategoryImageProviderElement(super.provider);

  @override
  String get category => (origin as CategoryImageProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
