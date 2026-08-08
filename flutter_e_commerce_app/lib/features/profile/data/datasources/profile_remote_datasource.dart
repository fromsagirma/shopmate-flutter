import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/user_profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<List<UserProfileModel>> getUsers();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio client;

  ProfileRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserProfileModel>> getUsers() async {
    try {
      final response = await client.get(ApiEndpoints.users);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => UserProfileModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          message: 'Failed to fetch users',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException(message: 'Connection error while fetching users');
      }
      throw ServerException(
        message: e.message ?? 'Unknown server error',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: 'Unexpected error: ${e.toString()}');
    }
  }
}
