import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../features/products/domain/usecases/get_products_by_category_usecase.dart';

part 'home_providers.g.dart';

@riverpod
Future<String?> categoryImage(CategoryImageRef ref, String category) async {
  final usecase = ref.watch(getProductsByCategoryUseCaseProvider);
  final products = await usecase.call(category);
  if (products.isNotEmpty) {
    return products.first.image;
  }
  return null;
}
