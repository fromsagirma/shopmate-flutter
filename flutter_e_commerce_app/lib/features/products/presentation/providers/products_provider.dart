import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_products_by_category_usecase.dart';
import '../../domain/usecases/get_products_usecase.dart';

part 'products_provider.g.dart';

@riverpod
Future<List<String>> categories(CategoriesRef ref) {
  return ref.watch(getCategoriesUseCaseProvider).call();
}

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  String? build() => null;

  void setCategory(String? category) {
    state = category;
  }
}

@riverpod
Future<List<Product>> baseProducts(BaseProductsRef ref) {
  final category = ref.watch(selectedCategoryProvider);
  if (category == null) {
    return ref.watch(getProductsUseCaseProvider).call();
  } else {
    return ref.watch(getProductsByCategoryUseCaseProvider).call(category);
  }
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void setQuery(String query) {
    state = query;
  }
}

@riverpod
Future<List<Product>> filteredProducts(FilteredProductsRef ref) async {
  final products = await ref.watch(baseProductsProvider.future);
  final query = ref.watch(searchQueryProvider).toLowerCase();
  
  if (query.isEmpty) return products;
  
  return products
      .where((p) => p.title.toLowerCase().contains(query))
      .toList();
}
