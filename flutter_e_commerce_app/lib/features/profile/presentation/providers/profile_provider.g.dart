// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileRemoteDataSourceHash() =>
    r'06b08f8aa3dc3086b4cb83f5b2b57b0ac3d574e9';

/// See also [profileRemoteDataSource].
@ProviderFor(profileRemoteDataSource)
final profileRemoteDataSourceProvider =
    AutoDisposeProvider<ProfileRemoteDataSource>.internal(
  profileRemoteDataSource,
  name: r'profileRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfileRemoteDataSourceRef
    = AutoDisposeProviderRef<ProfileRemoteDataSource>;
String _$profileRepositoryHash() => r'a423824ad733f20104a4668f14a1951f346de356';

/// See also [profileRepository].
@ProviderFor(profileRepository)
final profileRepositoryProvider =
    AutoDisposeProvider<ProfileRepository>.internal(
  profileRepository,
  name: r'profileRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfileRepositoryRef = AutoDisposeProviderRef<ProfileRepository>;
String _$getProfileUseCaseHash() => r'f31e08c20f14aecedfe9a2f7a166c2c259fc7471';

/// See also [getProfileUseCase].
@ProviderFor(getProfileUseCase)
final getProfileUseCaseProvider =
    AutoDisposeProvider<GetProfileUseCase>.internal(
  getProfileUseCase,
  name: r'getProfileUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getProfileUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetProfileUseCaseRef = AutoDisposeProviderRef<GetProfileUseCase>;
String _$profileNotifierHash() => r'c59a98255d7159bc8b371a392f5c64449e4e02cf';

/// See also [ProfileNotifier].
@ProviderFor(ProfileNotifier)
final profileNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ProfileNotifier, UserProfile>.internal(
  ProfileNotifier.new,
  name: r'profileNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfileNotifier = AutoDisposeAsyncNotifier<UserProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
