import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/product_model.dart';

part 'products_remote_datasource.g.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<String>> getCategories();
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<ProductModel> getProductById(int id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio dio;

  ProductsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get(ApiEndpoints.products);
    final data = response.data as List;
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<List<String>> getCategories() async {
    final response = await dio.get(ApiEndpoints.categories);
    final data = response.data as List;
    return data.map((e) => e.toString()).toList();
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await dio.get('${ApiEndpoints.category}/$category');
    final data = response.data as List;
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final response = await dio.get('${ApiEndpoints.products}/$id');
    return ProductModel.fromJson(response.data);
  }
}

@riverpod
ProductsRemoteDataSource productsRemoteDataSource(ProductsRemoteDataSourceRef ref) {
  return ProductsRemoteDataSourceImpl(ref.watch(dioProvider));
}
