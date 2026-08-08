import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/error_mapper.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_remote_datasource.dart';

part 'products_repository_impl.g.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts() async {
    try {
      final models = await remoteDataSource.getProducts();
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ErrorMapper.mapExceptionToFailure(e);
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      return await remoteDataSource.getCategories();
    } catch (e) {
      throw ErrorMapper.mapExceptionToFailure(e);
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final models = await remoteDataSource.getProductsByCategory(category);
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ErrorMapper.mapExceptionToFailure(e);
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      final model = await remoteDataSource.getProductById(id);
      return model.toEntity();
    } catch (e) {
      throw ErrorMapper.mapExceptionToFailure(e);
    }
  }
}

@riverpod
ProductsRepository productsRepository(ProductsRepositoryRef ref) {
  return ProductsRepositoryImpl(
    remoteDataSource: ref.watch(productsRemoteDataSourceProvider),
  );
}
