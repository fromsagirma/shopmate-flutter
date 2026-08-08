import '../../../../core/error/exceptions.dart';
import '../../../auth/data/datasources/auth_local_datasource.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<UserProfile> getCurrentUserProfile() async {
    // 1. Fetch the local UserSession
    final session = localDataSource.getSession();
    if (session == null || session.username.isEmpty) {
      throw ServerException(message: 'No active session found. Please log in again.', statusCode: 401);
    }

    // 2. Fetch all users from remote
    final users = await remoteDataSource.getUsers();

    // 3. Filter the list for a matching username
    final matchingUser = users.where((u) => u.username == session.username).firstOrNull;

    if (matchingUser == null) {
      throw ServerException(message: 'User profile not found.', statusCode: 404);
    }

    // 4. Return the model mapped to a pure UserProfile entity
    return matchingUser.toEntity();
  }
}
