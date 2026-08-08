import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_product_by_id_usecase.dart';

part 'product_detail_provider.g.dart';

@riverpod
Future<Product> productDetail(ProductDetailRef ref, int id) {
  return ref.watch(getProductByIdUseCaseProvider).call(id);
}
