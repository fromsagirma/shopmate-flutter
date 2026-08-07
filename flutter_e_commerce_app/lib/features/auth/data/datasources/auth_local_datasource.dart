import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/user_session.dart';

part 'auth_local_datasource.g.dart';

abstract class AuthLocalDataSource {
  Future<void> init();
  Future<void> saveSession(UserSession session);
  UserSession? getSession();
  Future<void> clearSession();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  Box<UserSession>? _sessionBox;

  @override
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserSessionAdapter());
    }
    _sessionBox = await Hive.openBox<UserSession>(StorageKeys.sessionBox);
  }

  @override
  Future<void> saveSession(UserSession session) async {
    if (_sessionBox == null) await init();
    await _sessionBox!.put(StorageKeys.userSessionKey, session);
  }

  @override
  UserSession? getSession() {
    if (_sessionBox == null || !_sessionBox!.isOpen) return null;
    return _sessionBox!.get(StorageKeys.userSessionKey);
  }

  @override
  Future<void> clearSession() async {
    if (_sessionBox == null) await init();
    await _sessionBox!.delete(StorageKeys.userSessionKey);
  }
}

@riverpod
AuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) {
  return AuthLocalDataSourceImpl();
}
