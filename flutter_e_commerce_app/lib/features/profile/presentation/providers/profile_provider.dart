import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../../auth/data/datasources/auth_local_datasource.dart';
import '../../data/datasources/profile_remote_datasource.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../../../core/error/error_mapper.dart';

part 'profile_provider.g.dart';

@riverpod
ProfileRemoteDataSource profileRemoteDataSource(ProfileRemoteDataSourceRef ref) {
  return ProfileRemoteDataSourceImpl(client: ref.watch(dioProvider));
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepositoryImpl(
    remoteDataSource: ref.watch(profileRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
}

@riverpod
GetProfileUseCase getProfileUseCase(GetProfileUseCaseRef ref) {
  return GetProfileUseCase(ref.watch(profileRepositoryProvider));
}

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  FutureOr<UserProfile> build() async {
    return _fetchProfile();
  }

  Future<UserProfile> _fetchProfile() async {
    try {
      final useCase = ref.read(getProfileUseCaseProvider);
      return await useCase();
    } catch (e) {
      throw ErrorMapper.mapExceptionToFailure(e);
    }
  }

  Future<void> refreshProfile() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchProfile());
  }
}
