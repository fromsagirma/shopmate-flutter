// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'f2003698d91cec3f30a8b23649772043ea892352';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider = AutoDisposeFutureProvider<List<String>>.internal(
  categories,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoriesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$baseProductsHash() => r'3d5b89a481469f1610eecdcd816eb3e789b93ff5';

/// See also [baseProducts].
@ProviderFor(baseProducts)
final baseProductsProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  baseProducts,
  name: r'baseProductsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$baseProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BaseProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$filteredProductsHash() => r'd0c8355eae6da7641232b45e6da54c6f30d9f5b9';

/// See also [filteredProducts].
@ProviderFor(filteredProducts)
final filteredProductsProvider =
    AutoDisposeFutureProvider<List<Product>>.internal(
  filteredProducts,
  name: r'filteredProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$selectedCategoryHash() => r'bc64c0e8d692b8b71ce744f4b0e1a95c4be5659c';

/// See also [SelectedCategory].
@ProviderFor(SelectedCategory)
final selectedCategoryProvider =
    AutoDisposeNotifierProvider<SelectedCategory, String?>.internal(
  SelectedCategory.new,
  name: r'selectedCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCategory = AutoDisposeNotifier<String?>;
String _$searchQueryHash() => r'2c146927785523a0ddf51b23b777a9be4afdc092';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
