import '../entities/user_session.dart';

abstract class AuthRepository {
  Future<UserSession> login(String username, String password);
  Future<void> logout();
  UserSession? getCurrentSession();
}
